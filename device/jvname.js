// Patch name editing in the program block (one instance, in the embedded NameBlock bpatcher).
//
// The name is stored in the Live set as 12 hidden, stored-only live.numbox parameters (Patch Name 1-12, ASCII
// 32-125). It is not part of Send or the on-load push: the device never overwrites the JV's patch name unless you
// type one. Typed characters go straight to their senders; the numboxes only store the name in the Live set.
//
// inlet 0: text from the textedit ("text word word ..." or a plain list), when the user presses Return;
//          "fromjv <name>" from jvreceive.js (Get or an edit on the JV's panel): stored and shown, not sent
// inlet 1: "ch <0-11> <ascii>" from the 12 numboxes (their stored values when a set loads): shown only
// outlets 0-11: ASCII code for name character n, to its sender (js jvparam.js 3 0 0 n)
// outlet 12: "set <name>" for the textedit
// outlets 13-24: "set <ascii>" for numbox n (store without output)

autowatch = 1;
inlets = 2;
outlets = 25;
setinletassist(0, "text from the textedit");
setinletassist(1, "ch n ascii from the name numboxes");
setoutletassist(12, "set name for the textedit");

var LENGTH = 12;
var chars = [];
for (var i = 0; i < LENGTH; i++) {
	chars.push(32);
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
	var s = "";
	for (var k = 0; k < LENGTH; k++) {
		s += String.fromCharCode(chars[k]);
	}
	return s.replace(/\s+$/, "");
}

function typed(text) {
	var c = codes(text);
	for (var k = 0; k < LENGTH; k++) {
		if (c[k] !== chars[k]) {
			chars[k] = c[k];
			outlet(k, c[k]);            // only changed characters go to the JV
			outlet(13 + k, "set", c[k]);
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
