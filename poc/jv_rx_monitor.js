// Test helper for issue #6: does incoming SysEx reach a Max for Live device?
//
// inlet 0: bytes from sysexin
// inlet 1: bytes from midiin (raw MIDI; SysEx would show up as 240 ... 247)
// outlet 0: status text for the sysexin route
// outlet 1: status text for the midiin route
// outlet 2: summary of the last complete SysEx message
//
// Every complete message is also printed to the Max console as hex.
// "clear" resets the counters.

autowatch = 1;
inlets = 2;
outlets = 3;

var buf = [[], []];
var collecting = [false, false];
var count = [0, 0];
var bytes = [0, 0];
var ROUTE = ["sysexin", "midiin"];

function msg_int(b) {
	var r = inlet;
	if (b === 0xF0) {
		collecting[r] = true;
		buf[r] = [b];
		return;
	}
	if (!collecting[r]) {
		return;
	}
	if (b >= 0xF8) {
		return; // realtime bytes may be interleaved; ignore them
	}
	buf[r].push(b);
	if (b === 0xF7) {
		collecting[r] = false;
		done(r, buf[r]);
	}
}

function list() {
	var a = arrayfromargs(arguments);
	for (var i = 0; i < a.length; i++) {
		msg_int(a[i]);
	}
}

function hex(b) {
	return (b < 16 ? "0" : "") + b.toString(16).toUpperCase();
}

function describe(m) {
	if (m.length > 9 && m[1] === 0x41 && m[3] === 0x6A) {
		var cmd = m[4] === 0x12 ? "DT1" : (m[4] === 0x11 ? "RQ1" : "cmd " + hex(m[4]));
		return "Roland JV " + cmd + " dev " + (m[2] + 1) + " addr " + hex(m[5]) + " " + hex(m[6]) + " " + hex(m[7]) + " " + hex(m[8]);
	}
	return "SysEx from " + (m.length > 1 ? "manufacturer " + hex(m[1]) : "?");
}

function done(r, m) {
	count[r] += 1;
	bytes[r] += m.length;
	var h = [];
	for (var i = 0; i < m.length; i++) {
		h.push(hex(m[i]));
	}
	post("JV SysEx Monitor [" + ROUTE[r] + "] " + m.length + " bytes: " + h.join(" ") + "\n");
	say(r, ROUTE[r] + ": " + count[r] + " msgs, " + bytes[r] + " bytes");
	say(2, "last (" + ROUTE[r] + "): " + describe(m) + ", " + m.length + " bytes");
}

// one word per atom, so the message box shows the text without quotes
function say(o, text) {
	outlet(o, ["set"].concat(text.split(" ")));
}

function clear() {
	for (var r = 0; r < 2; r++) {
		count[r] = 0;
		bytes[r] = 0;
		buf[r] = [];
		collecting[r] = false;
		say(r, ROUTE[r] + ": 0 msgs");
	}
	say(2, "last: -");
}

function loadbang() {
	clear();
}
