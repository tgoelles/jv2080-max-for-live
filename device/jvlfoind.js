// LFO modulation ring around a dial, like Live draws for modulated parameters (jsui laid over the dial,
// ignoreclick on). Shows the range the tone's LFOs sweep around the dial's value; hidden when both depths are 0.
//
//   jsui jvlfoind.js <target> <min> <max>     target: 0 pitch, 1 filter, 2 amp, 3 pan; min/max: the dial's range
//
//   int/float             the dial's value
//   addr n                this section's tone address (16/18/20/22)
//   lfodepth a t l d      from the LFO page (s ---lfodepth): tone address, target, LFO 1/2, depth -63..+63
//
// Illustrative like the LFO preview: the JV doesn't say how far a depth moves a parameter, so full depth on both
// LFOs is drawn as half the dial's travel either side.

autowatch = 1;
inlets = 1;
outlets = 0;
setinletassist(0, "dial value; addr n; lfodepth addr target lfo depth");

var target = jsarguments.length > 1 ? Math.round(jsarguments[1]) : 0;
var lo = jsarguments.length > 2 ? jsarguments[2] : 0;
var hi = jsarguments.length > 3 ? jsarguments[3] : 127;
var SWEEP = 1.5 * Math.PI;           // live.dial's arc: 270 degrees, from 7:30 to 4:30
var START = 0.75 * Math.PI;
var TEXT_ROW = 11;                   // name above and number below the knob
var address = -1;
var value = lo;
var depths = {};                     // tone address -> [LFO1, LFO2]: depths can arrive before our address

if (typeof mgraphics !== "undefined") {
	mgraphics.init();
	mgraphics.relative_coords = 0;
	mgraphics.autofill = 0;
}

function redraw() {
	if (typeof mgraphics !== "undefined") {
		mgraphics.redraw();
	}
}

function msg_int(v) {
	value = v;
	redraw();
}

function msg_float(v) {
	msg_int(v);
}

function addr(a) {
	address = Math.round(a);
	redraw();
}

function lfodepth(a, t, l, d) {
	if (Math.round(t) !== target || (l !== 1 && l !== 2)) {
		return;
	}
	a = Math.round(a);
	depths[a] = depths[a] || [0, 0];
	depths[a][l - 1] = Math.round(d);
	redraw();
}

// [from, to] as fractions 0..1 of the dial's travel, or null when not modulated
function range() {
	var d = depths[address] || [0, 0];
	var amount = (Math.abs(d[0]) + Math.abs(d[1])) / 126 * 0.5;
	if (amount === 0) {
		return null;
	}
	var pos = hi > lo ? (value - lo) / (hi - lo) : 0;
	pos = Math.max(0, Math.min(1, pos));
	return [Math.max(0, pos - amount), Math.min(1, pos + amount)];
}

function paint() {
	var r = range();
	if (!r) {
		return;
	}
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var radius = Math.min(w, h - 2 * TEXT_ROW) / 2 + 1;
	mgraphics.set_source_rgba(0.45, 0.78, 0.95, 1);
	mgraphics.set_line_width(2);
	mgraphics.arc(w / 2, h / 2, radius, START + r[0] * SWEEP, START + r[1] * SWEEP);
	mgraphics.stroke();
}
