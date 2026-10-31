// Patch name editing in the program block (one instance, in the embedded NameBlock bpatcher). In Perform mode the
// same field shows and edits the performance name.
//
// The name is stored in the Live set as 12 hidden, stored-only live.numbox parameters (Patch Name 1-12, ASCII
// 32-125); the performance name likewise (Perf Name 1-12). Neither is part of Send or the on-load push: the device
// never overwrites the JV's names unless you type one. Typed patch name characters go straight to their senders; a
// typed performance name goes out as one DT1. The numboxes only store the names in the Live set.
//
// inlet 0: text from the textedit ("text word word ..." or a plain list), when the user presses Return;
//          "fromjv <name>" / "perfname <name>" from jvreceive.js (Get or an edit on the JV's panel): stored and
//          shown, not sent; "mode 0/1" (Patch / Perform): which name the field shows and edits
// inlet 1: "ch <0-11> <ascii>" from the 12 patch name numboxes, "pch <0-11> <ascii>" from the performance name
//          numboxes (their stored values when a set loads): shown only
// outlets 0-11: ASCII code for name character n, to its sender (js jvparam.js 3 0 0 n)
// outlet 12: "set <name>" for the textedit
// outlets 13-24: "set <ascii>" for patch name numbox n (store without output)
// outlets 25-36: "set <ascii>" for performance name numbox n
// outlet 37: SysEx bytes: the performance name as one DT1 to the temporary performance (01 00 00 00)

autowatch = 1;
inlets = 2;
outlets = 38;
setinletassist(0, "text from the textedit");
setinletassist(1, "ch n ascii from the name numboxes");
setoutletassist(12, "set name for the textedit");
setoutletassist(37, "performance name DT1 bytes");

var LENGTH = 12;
var chars = [];
var pchars = [];   // the performance name
for (var i = 0; i < LENGTH; i++) {
	chars.push(32);
	pchars.push(32);
}
var perform = false;

function mode(m) {
	perform = Math.round(m) === 1;
	show();
}

// a typed name as 12 ASCII codes: padded with spaces, characters the JV can't show (outside 32-125) as spaces
function codes(text) {
	var out = [];
	for (var k = 0; k < LENGTH; k++) {
		var c = k < text.length ? text.charCodeAt(k) : 32;
		out.push(c >= 32 && c <= 125 ? c : 32);
	}
	return out;
}

function name() {
	var s = "", c = perform ? pchars : chars;
	for (var k = 0; k < LENGTH; k++) {
		s += String.fromCharCode(c[k]);
	}
	return s.replace(/\s+$/, "");
}

function typed(text) {
	var c = codes(text);
	if (perform) {
		typedPerf(c);
		return;
	}
	for (var k = 0; k < LENGTH; k++) {
		if (c[k] !== chars[k]) {
			chars[k] = c[k];
			outlet(k, c[k]);            // only changed characters go to the JV
			outlet(13 + k, "set", c[k]);
		}
	}
	show();
}

// the performance name: one DT1 with all 12 characters, if any changed
function typedPerf(c) {
	var changed = false;
	for (var k = 0; k < LENGTH; k++) {
		if (c[k] !== pchars[k]) {
			pchars[k] = c[k];
			changed = true;
			outlet(25 + k, "set", c[k]);
		}
	}
	if (changed) {
		var body = [0x01, 0x00, 0x00, 0x00].concat(pchars), sum = 0;
		for (k = 0; k < body.length; k++) {
			sum += body[k];
		}
		var bytes = [0xF0, 0x41, 0x10, 0x6A, 0x12].concat(body, [(128 - sum % 128) % 128, 0xF7]);
		for (k = 0; k < bytes.length; k++) {
			outlet(37, bytes[k]);
		}
	}
	show();
}

function show() {
	var n = name();
	outlet(12, n.length ? ["set"].concat(n.split(/ +/)) : ["set"]);   // the textedit shows words with single spaces
}

function text() {
	if (inlet === 0) {
		typed(arrayfromargs(arguments).join(" "));
	}
}

function list() {
	text.apply(this, arguments);
}

function anything() {
	if (inlet === 0) {
		typed([messagename].concat(arrayfromargs(arguments)).join(" "));
	}
}

function msg_int(v) {
	if (inlet === 0) {
		typed(String(v));
	}
}

// the JV's name (Get, panel edit): store and show, don't send it back
function fromjv() {
	var c = codes(arrayfromargs(arguments).join(" "));
	for (var k = 0; k < LENGTH; k++) {
		chars[k] = c[k];
		outlet(13 + k, "set", c[k]);
	}
	show();
}

// the JV's performance name (Get, panel edit): store, and show in Perform mode
function perfname() {
	var c = codes(arrayfromargs(arguments).join(" "));
	for (var k = 0; k < LENGTH; k++) {
		pchars[k] = c[k];
		outlet(25 + k, "set", c[k]);
	}
	show();
}

function pch(k, v) {
	k = Math.round(k);
	if (k >= 0 && k < LENGTH) {
		v = Math.round(v);
		pchars[k] = v >= 32 && v <= 125 ? v : 32;
		show();
	}
}

function ch(k, v) {
	k = Math.round(k);
	if (k >= 0 && k < LENGTH) {
		v = Math.round(v);
		chars[k] = v >= 32 && v <= 125 ? v : 32;
		show();
	}
}

if (typeof module !== "undefined") {
	module.exports = { codes: codes };
}
