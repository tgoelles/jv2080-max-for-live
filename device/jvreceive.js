// Read the JV's temporary patch back into the device (#6).
//
// inlet 0: MIDI bytes from midiin (only complete SysEx messages are used); "get" requests the patch;
//          "send" writes the device's whole patch to the JV (Send button, on-load push);
//          "model 0/1/2" (JV-2080, JV-1080, XP-50/80) sets the patch common size to request
// outlet 0: SysEx bytes (RQ1 requests, DT1 blocks for "send") for jv_sysex_queue.js inlet 1
// outlet 1: "mute 1" / "mute 0" for jv_sysex_queue.js, around updating the controls
// outlet 2: "set <patch name>" for a comment showing the name
// outlet 3: "jvpatch type id number" when the JV reports a patch picked on its panel (System Common 02-05)
//
// The 5 requests (common + 4 tones) go out one at a time: the next only after the previous reply has
// arrived (or after a timeout). The JV needs ~45 ms to send a tone; a request arriving while it is still
// sending makes it report "Receive data error".
//
// Replies (DT1) are decoded with jvsysex.js. Each value is written to the control that edits it, found
// through the generated bindings (path + varname) and converted with toControl(). Controls are updated
// with output, so Live's stored values, the senders' stored values and linked displays stay consistent;
// the queue is muted meanwhile so nothing is sent back to the JV.
//
// The JV also reports its EFX / CHORUS / REVERB buttons (System Common 08-0A); the device's Effects On/Off
// toggles follow them the same way.

include("jv2080_params.js");
include("jvsysex.js");
include("jv2080_bindings.js");
include("jv2080_efx.js");

autowatch = 1;
inlets = 1;
outlets = 4;
setinletassist(0, "MIDI bytes from midiin; get");
setoutletassist(0, "RQ1 SysEx bytes to the queue");
setoutletassist(1, "mute 1 / mute 0 to the queue");
setoutletassist(2, "patch name (set ...)");
setoutletassist(3, "jvpatch type id number");

var jsthis = this;
// System Common 08-0A: EFX, Chorus and Reverb switch -> the toggles in the Effects On/Off bpatcher
var SWITCHES = { 8: "live.toggle[3]", 9: "live.toggle[2]", 10: "live.toggle[1]" };
var buf = null;
var BY_ID = {};
for (var i = 0; i < JV2080_BINDINGS.length; i++) {
	var b = JV2080_BINDINGS[i];
	(BY_ID[b.id] = BY_ID[b.id] || []).push(b);
}

var COMMON_SIZE = [0x4A, 0x48, 0x49];   // per model: JV-2080, JV-1080, XP-50/80 (#9)
var commonSize = COMMON_SIZE[0];

// "model 0/1/2" from the Setup page
function model(m) {
	commonSize = COMMON_SIZE[m] || COMMON_SIZE[0];
}

var GAP_MS = 30;        // pause after a reply before the next request
var TIMEOUT_MS = 500;   // give up waiting for a reply and move on
var pending = [];       // requests still to send
var waiting = null;     // the request we're waiting for: its 4 address bytes
var nextTask = new Task(sendNext, this);
var timeoutTask = new Task(onTimeout, this);
var SEND_GAP_MS = 60;   // between the DT1 blocks of "send": a 129-byte message takes ~45 ms on the MIDI cable
var outbox = [];        // DT1 blocks still to send
var sendTask = new Task(sendBlock, this);

// Send: every bound control's value, read back from the controls and converted to raw values (the reverse of
// a read), as one DT1 per run of consecutive addresses: patch common and the 4 tones in a few messages instead
// of one message per parameter. Parameters the device doesn't edit are left out, so the JV keeps its own values.
var sendAfterGet = false;
var getAfterSend = false;

function send() {
	if (pending.length || waiting) {
		sendAfterGet = true;   // a Get is still running: send when it's done
		return;
	}
	cache = {};
	outbox = patchBlocks(0x10);   // the queue sets the real device ID
	report(outbox);
	sendTask.cancel();
	sendBlock();
}

// What the JV last told us, by address (Get replies and panel edits): Send reports how many bytes it changes
// compared to that, so a "*" on the JV after Get -> Send can be told apart from a real difference.
var lastRead = {};

function report(messages) {
	var known = 0, changed = [];
	for (var i = 0; i < messages.length; i++) {
		var m = messages[i];
		var addr = JVSysEx.toNumber(m.slice(5, 9));
		for (var k = 9; k < m.length - 2; k++) {
			var a = addr + k - 9;
			if (lastRead[a] !== undefined) {
				known++;
				if (lastRead[a] !== m[k]) {
					changed.push(JVSysEx.toAddress(a).join(" ") + ": " + lastRead[a] + " -> " + m[k]);
				}
			}
		}
	}
	if (known) {
		post("jvreceive: send: " + messages.length + " blocks, " + changed.length + " of " + known +
			" bytes differ from the JV's last values" + (changed.length ? " (" + changed.slice(0, 8).join(", ") + ")" : "") + "\n");
	}
}

function sendBlock() {
	if (!outbox.length) {
		return;
	}
	var m = outbox.shift();
	for (var i = 0; i < m.length; i++) {
		outlet(0, m[i]);
	}
	if (outbox.length) {
		sendTask.schedule(SEND_GAP_MS);
	} else if (getAfterSend) {
		getAfterSend = false;
		get();
	}
}

// The DT1 messages for the device's patch: [block, tone] -> runs of consecutive bytes
function patchBlocks(dev) {
	var bytes = { common: {} };
	for (var t = 1; t <= 4; t++) {
		bytes["tone" + t] = {};
	}
	for (var i = 0; i < JV2080_BINDINGS.length; i++) {
		var b = JV2080_BINDINGS[i];
		var tones = b.tones.length ? b.tones : [null];
		for (var k = 0; k < tones.length; k++) {
			var obj = find(b.path[0].replace("{n}", tones[k]), b.varname);
			if (obj) {
				place(bytes[b.block === "common" ? "common" : "tone" + tones[k]], b, controlValue(obj));
			}
		}
	}
	var out = [];
	runs(bytes.common, commonSize, JVSysEx.patchAddress("common"), dev, out);
	for (t = 1; t <= 4; t++) {
		runs(bytes["tone" + t], 0x81, JVSysEx.patchAddress("tone", t), dev, out);
	}
	return out;
}

function controlValue(obj) {
	var v = obj.getvalueof();
	return Math.round(v instanceof Array ? v[0] : v) || 0;
}

// a binding's control value as raw bytes at their offsets
function place(block, b, value) {
	var op = b.ops.length ? b.ops[0][0] : null;
	if (op === "wave_group") {
		var g = JVSysEx.waveGroupFromMenu(value);
		block[JVSysEx.find("tone", "wave_group_type").off] = g.type;
		block[JVSysEx.find("tone", "wave_group_id").off] = g.id;
		return;
	}
	var raw = op === "efx" ? JV2080_EFX.toRaw(currentEfxType(), b.ops[0][1], value) : JVSysEx.fromControl(b, value);
	var param = JVSysEx.find(b.block, b.id);
	var data = JVSysEx.encodeValue(param, raw);
	for (var i = 0; i < data.length; i++) {
		block[param.off + i] = data[i];
	}
}

// one DT1 per run of consecutive offsets below size
function runs(block, size, base, dev, out) {
	var start = -1, data = [];
	for (var off = 0; off <= size; off++) {
		if (off < size && block[off] !== undefined) {
			if (start < 0) {
				start = off;
			}
			data.push(block[off]);
		} else if (start >= 0) {
			out.push(JVSysEx.dt1(dev, JVSysEx.addOffset(base, start), data));
			start = -1;
			data = [];
		}
	}
}

function get() {
	if (outbox.length) {
		getAfterSend = true;   // a Send is still going out: read when it's done
		return;
	}
	cache = {};
	pending = JVSysEx.requestPatch(0x10, commonSize);   // the queue sets the real device ID
	waiting = null;
	timeoutTask.cancel();
	sendNext();
}

function sendNext() {
	if (!pending.length) {
		waiting = null;
		if (sendAfterGet) {
			sendAfterGet = false;
			send();
		}
		return;
	}
	var req = pending.shift();
	waiting = req.slice(5, 9);
	for (var j = 0; j < req.length; j++) {
		outlet(0, req[j]);
	}
	timeoutTask.schedule(TIMEOUT_MS);
}

function onTimeout() {
	post("jvreceive: no reply from the JV for " + waiting.join(" ") + "\n");
	sendNext();
}

// a reply for the block we asked for: move on to the next request
function answered(addr) {
	if (waiting && addr.join(" ") === waiting.join(" ")) {
		timeoutTask.cancel();
		waiting = null;
		nextTask.schedule(GAP_MS);
	}
}

function msg_int(byte) {
	if (byte === 0xF0) {
		buf = [byte];
		return;
	}
	if (buf === null || byte >= 0xF8) {
		return;   // not in a SysEx message, or a realtime byte inside one
	}
	buf.push(byte);
	if (byte === 0xF7) {
		var m = buf;
		buf = null;
		receive(m);
	}
}

function list() {
	var a = arrayfromargs(arguments);
	for (var i = 0; i < a.length; i++) {
		msg_int(a[i]);
	}
}

function receive(bytes) {
	var msg = JVSysEx.parse(bytes);
	if (!msg || msg.command !== "DT1" || !msg.valid) {
		return;
	}
	// System Common 02-05: Patch Group Type, Group ID, Patch Number (2 nibbles). The JV-2080 sends this
	// when a patch is picked on its panel.
	if (msg.addr.join(" ") === "0 0 0 2" && msg.data.length >= 4) {
		outlet(3, "jvpatch", msg.data[0], msg.data[1], (msg.data[2] << 4) | msg.data[3]);
		return;
	}
	if (msg.addr[0] === 0 && msg.addr[1] === 0 && msg.addr[2] === 0) {
		switches(msg.addr[3], msg.data);
		return;
	}
	var where = JVSysEx.locate(msg.addr);
	if (!where || where.patch[0] !== 0x03) {
		return;   // only the temporary patch is what the device edits
	}
	var base = JVSysEx.toNumber(msg.addr);
	for (var i = 0; i < msg.data.length; i++) {
		lastRead[base + i] = msg.data[i];
	}
	apply(JVSysEx.decode(msg));
	answered(msg.addr);
}

function switches(start, data) {
	outlet(1, "mute", 1);
	try {
		for (var i = 0; i < data.length; i++) {
			var name = SWITCHES[start + i];
			var obj = name ? find("EffectsSwitch", name) : null;
			if (obj) {
				obj.message("int", data[i] ? 1 : 0);
			}
		}
	} finally {
		outlet(1, "mute", 0);
	}
}

function apply(values) {
	var raw = {};
	outlet(1, "mute", 1);
	try {
		for (var i = 0; i < values.length; i++) {
			var v = values[i];
			raw[v.id] = v.raw;
			setControls(v.id, v.tone, v.raw);
		}
		if (raw.wave_group_type !== undefined && raw.wave_group_id !== undefined) {
			var menu = JVSysEx.waveGroupToMenu(raw.wave_group_type, raw.wave_group_id);
			if (menu !== null) {
				setControls("wave_group", values[0].tone, menu, true);
			}
		}
	} finally {
		outlet(1, "mute", 0);
	}
	if (values.length && values[0].block === "common" && raw.name_1 !== undefined) {
		outlet(2, "set", JVSysEx.patchName(values).replace(/\s+$/, ""));
	}
}

// Write a raw value to every control bound to this parameter and tone.
// isControlValue: the value is already a control value (wave group menu index).
function setControls(id, tone, value, isControlValue) {
	var list = BY_ID[id];
	if (!list) {
		return;
	}
	for (var i = 0; i < list.length; i++) {
		var b = list[i];
		if (tone !== null && b.tones.indexOf(tone) < 0) {
			continue;
		}
		var obj = find(b.path[0].replace("{n}", tone), b.varname);
		if (!obj) {
			continue;
		}
		if (b.ops.length && b.ops[0][0] === "efx") {
			obj.message("int", JV2080_EFX.toDial(currentEfxType(), b.ops[0][1], value));
		} else {
			obj.message("int", isControlValue ? value : JVSysEx.toControl(b, value));
		}
	}
}

// EFX parameter values are converted per EFX type: the device's EFX Type menu. In a read, the type (offset 0x0C)
// is set before its parameters (0x0D-0x18), so the menu already has the JV's type.
function currentEfxType() {
	var menu = find("FX", "EFXType");
	var v = menu ? menu.getvalueof() : 0;
	return Math.round(v instanceof Array ? v[0] : v) || 0;
}

function notifydeleted() {
	sendTask.cancel();
	sendTask.freepeer();
	nextTask.cancel();
	nextTask.freepeer();
	timeoutTask.cancel();
	timeoutTask.freepeer();
}

var cache = {};

// Controls are looked up once per Get/Send (cache cleared in get() and send()): a cached object can be freed
// when Max rebuilds a bpatcher, and messages to it fail with "corrupt object".
function find(path, varname) {
	var key = path + "/" + varname;
	if (cache[key] && cache[key].valid !== false) {
		return cache[key];
	}
	var box = jsthis.patcher.getnamed(path);
	var sub = box ? box.subpatcher() : null;
	var obj = sub ? sub.getnamed(varname) : null;
	if (!obj) {
		post("jvreceive: no control " + key + "\n");
		return null;
	}
	return (cache[key] = obj);
}
