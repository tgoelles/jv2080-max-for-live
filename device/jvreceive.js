// Read the JV's temporary patch back into the device (#6).
//
// inlet 0: MIDI bytes from midiin (only complete SysEx messages are used); "get" requests the patch;
//          "send" writes the device's whole patch to the JV (Send button, on-load push);
//          "busy 1/0" from the Library page: Get and Send wait while it talks to the JV;
//          "model 0/1/2" (JV-2080, JV-1080, XP-50/80) sets the patch common size to request
// outlet 0: SysEx bytes (RQ1 requests, DT1 blocks for "send") for jv_sysex_queue.js inlet 1
// outlet 1: "mute 1" / "mute 0" for jv_sysex_queue.js, around updating the controls
// outlet 2: "fromjv <patch name>" for the name field (jvname.js): after a read or a name edit on the JV
// outlet 3: "jvpatch type id number" when the JV reports a patch picked on its panel (System Common 02-05);
//           "jvperf n" for its performance number (System Common 01); "perfselect" (Send in Perform mode)
//
// Perform mode ("mode 1", from the device's Patch / Perform switch): Get reads the temporary performance (common
// + 16 parts, 01 00 ..) and shows its name ("perfname ..." on outlet 2). The JV's Sound Mode (System Common 00)
// moves the switch, like the Effects On/Off toggles. After every mode change (except while the set loads) the
// device asks the JV for System Common 00-05: its mode, performance number and patch, which the program block
// follows.
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
var nameChars = [32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32];   // the JV's patch name, ASCII
var perfChars = [32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32];   // its performance name
var perform = false;
var loadedAt = new Date().getTime();
var LOAD_MS = 1500;     // mode changes this soon after load come from the saved set: don't ask the JV
var ASK_MS = 500;       // after a mode change: the JV answers a request during the switch with "Data error"
var askRetry = false;
var askTask = new Task(askWhere, this);
// System Common 08-0A: EFX, Chorus and Reverb switch -> the toggles in the Effects On/Off bpatcher
var SWITCHES = { 8: "live.toggle[3]", 9: "live.toggle[2]", 10: "live.toggle[1]" };
var buf = null;
var BY_ID = {};
for (var i = 0; i < JV2080_BINDINGS.length; i++) {
	var b = JV2080_BINDINGS[i];
	var key = b.block + ":" + b.id;   // ids repeat between blocks (efx_type in patch common and performance)
	(BY_ID[key] = BY_ID[key] || []).push(b);
}

var COMMON_SIZE = [0x4A, 0x48, 0x49];   // per model: JV-2080, JV-1080, XP-50/80 (#9)
var commonSize = COMMON_SIZE[0];

// "model 0/1/2" from the Setup page
function model(m) {
	commonSize = COMMON_SIZE[m] || COMMON_SIZE[0];
}

// "mode 0/1" from the Patch / Perform switch (s ---mode)
function mode(m) {
	var p = Math.round(m) === 1;
	if (p === perform) {
		return;
	}
	perform = p;
	if (new Date().getTime() - loadedAt > LOAD_MS) {
		askTask.schedule(ASK_MS);   // give the JV time to switch, then ask where it is
	}
}

// RQ1 System Common 00-05: Sound Mode, Performance Number, Patch Group Type / ID / Number
// Goes through the same one-at-a-time request queue as Get (reply, timeout), and is asked once more if lost.
function askWhere() {
	if (libraryBusy) {
		return;
	}
	if (pending.length || waiting || outbox.length) {
		askTask.schedule(ASK_MS);   // a Get or Send is running: ask after it
		return;
	}
	askRetry = true;
	pending = [whereRequest()];
	sendNext();
}

function whereRequest() {
	return JVSysEx.rq1(0x10, [0, 0, 0, 0], 6);
}

var GAP_MS = 30;        // pause after a reply before the next request
var TIMEOUT_MS = 500;   // give up waiting for a reply and move on
// Perform mode: right after a performance is picked the JV loads 16 parts and answers the first request only after
// ~0.8 s (measured). A request sent before that answer makes it report "Receive data error" and drop it.
var PERF_TIMEOUT_MS = 2000;
var pending = [];       // requests still to send
var waiting = null;     // the request we're waiting for: its 4 address bytes
var nextTask = new Task(sendNext, this);
var timeoutTask = new Task(onTimeout, this);
var SEND_GAP_MS = 60;   // between the DT1 blocks of "send": a 129-byte message takes ~45 ms on the MIDI cable
var PERF_SEND_GAP_MS = 150;   // Perform mode: a part block can make the JV load another patch
var PERF_SELECT_MS = 1500;    // Send in Perform mode: select the performance, let the JV load it, then write the parts
var sendGap = SEND_GAP_MS;
var perfSendTask = new Task(sendPerfBlocks, this);
var outbox = [];        // DT1 blocks still to send
var sendTask = new Task(sendBlock, this);

// Send: every bound control's value, read back from the controls and converted to raw values (the reverse of
// a read), as one DT1 per run of consecutive addresses: patch common and the 4 tones in a few messages instead
// of one message per parameter. Parameters the device doesn't edit are left out, so the JV keeps its own values.
var sendAfterGet = false;
var getAfterSend = false;
var libraryBusy = false;

function busy(on) {
	libraryBusy = !!on;
}

function send() {
	if (libraryBusy) {
		post("jvreceive: the Library is busy with the JV, Send skipped\n");
		return;
	}
	if (pending.length || waiting) {
		sendAfterGet = true;   // a Get is still running: send when it's done
		return;
	}
	cache = {};
	if (perform) {
		// the set's performance: selected on the JV (the program block sends it), then, once the JV has loaded it,
		// the device's part settings written over it
		outlet(3, "perfselect");
		perfSendTask.schedule(PERF_SELECT_MS);
		return;
	}
	sendGap = SEND_GAP_MS;
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

function sendPerfBlocks() {
	cache = {};
	sendGap = PERF_SEND_GAP_MS;
	outbox = perfBlocks(0x10);
	report(outbox);
	sendTask.cancel();
	sendBlock();
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
		sendTask.schedule(sendGap);
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
		if (b.block !== "common" && b.block !== "tone") {
			continue;
		}
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

// The DT1 messages for the device's performance: common + 16 parts -> runs of consecutive bytes
function perfBlocks(dev) {
	var bytes = { perf: {} };
	for (var p = 1; p <= 16; p++) {
		bytes["part" + p] = {};
	}
	for (var i = 0; i < JV2080_BINDINGS.length; i++) {
		var b = JV2080_BINDINGS[i];
		if (b.block !== "perf" && b.block !== "part") {
			continue;
		}
		var obj = find(b.path[0], b.varname);
		if (obj) {
			place(bytes[b.block === "perf" ? "perf" : "part" + b.tones[0]], b, controlValue(obj));
		}
	}
	var out = [];
	runs(bytes.perf, JVSysEx.params.blocks.perf.size, JVSysEx.perfAddress("perf"), dev, out);
	for (p = 1; p <= 16; p++) {
		runs(bytes["part" + p], JVSysEx.params.blocks.part.size, JVSysEx.perfAddress("part", p), dev, out);
	}
	return out;
}

// a binding's control value as raw bytes at their offsets
function place(block, b, value) {
	var op = b.ops.length ? b.ops[0][0] : null;
	if (op === "part_group") {
		var pg = JVSysEx.partGroupFromMenu(value);
		block[JVSysEx.find("part", "patch_group_type").off] = pg.type;
		block[JVSysEx.find("part", "patch_group_id").off] = pg.id;
		return;
	}
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
	if (libraryBusy) {
		post("jvreceive: the Library is busy with the JV, Get skipped\n");
		return;
	}
	if (outbox.length) {
		getAfterSend = true;   // a Send is still going out: read when it's done
		return;
	}
	cache = {};
	pending = perform ? JVSysEx.requestPerformance(0x10) : JVSysEx.requestPatch(0x10, commonSize);   // the queue sets the real device ID
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
	timeoutTask.schedule(perform ? PERF_TIMEOUT_MS : TIMEOUT_MS);
}

function onTimeout() {
	if (waiting.join(" ") === "0 0 0 0" && askRetry) {
		askRetry = false;
		pending.unshift(whereRequest());   // lost (e.g. the JV was still switching modes): ask once more
	}
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
	if (msg.addr[0] === 0 && msg.addr[1] === 0 && msg.addr[2] === 0) {
		system(msg.addr[3], msg.data);
		return;
	}
	var where = JVSysEx.locate(msg.addr);
	if (where && where.perf && where.perf[0] === 0x01) {
		performance(msg);   // the temporary performance
		return;
	}
	if (!where || !where.patch || where.patch[0] !== 0x03) {
		return;   // only the temporary patch is what the device edits
	}
	var base = JVSysEx.toNumber(msg.addr);
	for (var i = 0; i < msg.data.length; i++) {
		lastRead[base + i] = msg.data[i];
	}
	apply(JVSysEx.decode(msg));
	answered(msg.addr);
}

// System Common: 00 Sound Mode, 01 Performance Number, 02-05 Patch Group Type, Group ID, Patch Number (2 nibbles;
// the JV-2080 sends these when a patch is picked on its panel), 08-0A the EFX / Chorus / Reverb switches
function system(start, data) {
	var at = function (off) {
		return off >= start && off < start + data.length ? data[off - start] : undefined;
	};
	if (at(0) !== undefined) {
		followMode(at(0));
	}
	if (at(1) !== undefined) {
		outlet(3, "jvperf", at(1));
	}
	if (at(2) !== undefined && at(5) !== undefined) {
		outlet(3, "jvpatch", at(2), at(3), (at(4) << 4) | at(5));
	}
	switches(start, data);
	answered([0, 0, 0, start]);
}

// The JV's Sound Mode (0 PERFORM, 1 PATCH, 2 GM) -> the Patch / Perform switch (0 Patch, 1 Perform)
function followMode(v) {
	if (v === 2) {
		post("jvreceive: the JV is in GM mode, which the device doesn't edit\n");
		return;
	}
	var m = v === 0 ? 1 : 0;
	if ((m === 1) === perform) {
		return;
	}
	var obj = jsthis.patcher.getnamed("ModeSwitch");
	if (obj) {
		outlet(1, "mute", 1);
		try {
			obj.message("int", m);   // its output tells everyone, including mode() here
		} finally {
			outlet(1, "mute", 0);
		}
	}
}

// A reply or panel edit for the temporary performance: values onto the Parts page, the name to the name field
function performance(msg) {
	var base = JVSysEx.toNumber(msg.addr);
	for (var i = 0; i < msg.data.length; i++) {
		lastRead[base + i] = msg.data[i];
	}
	var values = JVSysEx.decode(msg), named = false, group = {};
	outlet(1, "mute", 1);
	try {
		for (i = 0; i < values.length; i++) {
			var v = values[i];
			setControls(v.block + ":" + v.id, v.block === "part" ? v.part : null, v.raw);
			if (v.id === "patch_group_type" || v.id === "patch_group_id") {
				group[v.id] = v.raw;
			}
		}
		if (group.patch_group_type !== undefined && group.patch_group_id !== undefined) {
			var menu = JVSysEx.partGroupToMenu(group.patch_group_type, group.patch_group_id);
			if (menu !== null) {
				setControls("part:part_group", values[0].part, menu, true);
			}
		}
	} finally {
		outlet(1, "mute", 0);
	}
	for (i = 0; i < values.length; i++) {
		var m = values[i].block === "perf" ? /^name_(\d+)$/.exec(values[i].id) : null;
		if (m) {
			perfChars[m[1] - 1] = values[i].raw;
			named = true;
		}
	}
	if (named) {
		var s = String.fromCharCode.apply(null, perfChars).replace(/\s+$/, "");
		outlet(2, ["perfname"].concat(s.length ? s.split(" ") : []));
	}
	answered(msg.addr);
}

function switches(start, data) {
	if (start + data.length <= 8 || start > 10) {
		return;   // none of the switches
	}
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
			setControls(v.block + ":" + v.id, v.tone, v.raw);
		}
		if (raw.wave_group_type !== undefined && raw.wave_group_id !== undefined) {
			var menu = JVSysEx.waveGroupToMenu(raw.wave_group_type, raw.wave_group_id);
			if (menu !== null) {
				setControls("tone:wave_group", values[0].tone, menu, true);
			}
		}
	} finally {
		outlet(1, "mute", 0);
	}
	// the patch name: a read carries all 12 characters, a panel edit on the JV just the changed ones
	var named = false;
	for (var n = 1; n <= 12; n++) {
		if (raw["name_" + n] !== undefined) {
			nameChars[n - 1] = raw["name_" + n];
			named = true;
		}
	}
	if (named) {
		var s = "";
		for (n = 0; n < 12; n++) {
			s += String.fromCharCode(nameChars[n]);
		}
		s = s.replace(/\s+$/, "");
		outlet(2, ["fromjv"].concat(s.length ? s.split(" ") : []));
	}
}

// Write a raw value to every control bound to this parameter ("block:id") and tone.
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
	askTask.cancel();
	askTask.freepeer();
	perfSendTask.cancel();
	perfSendTask.freepeer();
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
