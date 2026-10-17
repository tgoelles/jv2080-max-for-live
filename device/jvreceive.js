// Read the JV's temporary patch back into the device (#6).
//
// inlet 0: MIDI bytes from midiin (only complete SysEx messages are used); "get" requests the patch
// outlet 0: SysEx bytes (RQ1 requests) for jv_sysex_queue.js inlet 1
// outlet 1: "mute 1" / "mute 0" for jv_sysex_queue.js, around updating the controls
// outlet 2: "set <patch name>" for a comment showing the name
//
// Replies (DT1) are decoded with jvsysex.js. Each value is written to the control that edits it, found
// through the generated bindings (path + varname) and converted with toControl(). Controls are updated
// with output, so Live's stored values, the senders' stored values and linked displays stay consistent;
// the queue is muted meanwhile so nothing is sent back to the JV.

include("jv2080_params.js");
include("jvsysex.js");
include("jv2080_bindings.js");

autowatch = 1;
inlets = 1;
outlets = 3;
setinletassist(0, "MIDI bytes from midiin; get");
setoutletassist(0, "RQ1 SysEx bytes to the queue");
setoutletassist(1, "mute 1 / mute 0 to the queue");
setoutletassist(2, "patch name (set ...)");

var jsthis = this;
var buf = null;
var BY_ID = {};
for (var i = 0; i < JV2080_BINDINGS.length; i++) {
	var b = JV2080_BINDINGS[i];
	(BY_ID[b.id] = BY_ID[b.id] || []).push(b);
}

function get() {
	var reqs = JVSysEx.requestPatch(0x10);   // the queue sets the real device ID
	for (var r = 0; r < reqs.length; r++) {
		for (var j = 0; j < reqs[r].length; j++) {
			outlet(0, reqs[r][j]);
		}
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
	var where = JVSysEx.locate(msg.addr);
	if (!where || where.patch[0] !== 0x03) {
		return;   // only the temporary patch is what the device edits
	}
	apply(JVSysEx.decode(msg));
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
		if (obj) {
			obj.message("int", isControlValue ? value : JVSysEx.toControl(b, value));
		}
	}
}

var cache = {};

function find(path, varname) {
	var key = path + "/" + varname;
	if (cache[key]) {
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
