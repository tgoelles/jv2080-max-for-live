// Structure diagram for one tone pair on the Patch page (jsui), like the JV's PATCH -> Common -> Struct page.
//
//   jsui jvstruct.js <pair>      pair 1 = Tones 1&2, 2 = Tones 3&4
//
//   type <0-9>      Structure Type 1-10
//   booster <0-3>   Booster gain 0 / +6 / +12 / +18 dB (shown in the B block)
// outlet 0: "active 0/1" for the Booster menu: the booster only works in Types 3 and 4 (manual p.75)
//
// The diagrams are copied from the JV-2080's own Struct page.
// "1"/"2" stand for the pair's first/second tone (3/4 for the second pair). B = booster, R = ring modulator,
// R+ = ring modulator drawn filled, as the JV does for some types.

autowatch = 1;
inlets = 1;
outlets = 1;
setinletassist(0, "type 0-9, booster 0-3");
setoutletassist(0, "active 0/1 for the Booster menu");

var pair = jsarguments.length > 1 ? Math.round(jsarguments[1]) : 1;
var current = 0;   // structure type index 0-9
var boost = 0;
var BOOST = ["0", "+6", "+12", "+18"];

// Each type: blocks [label, column, lane] (lanes 0 = first tone, 1 = second tone, 0.5 = between) and
// links [from block, to block]. Labels with "1"/"2" get the pair's tone numbers. Copied from the JV-2080's
// Struct page (photos of all 10 types, 2026-10-19): the second tone joins after TVA1, the filters then run
// TVF1 -> TVF2. "R+" is an R block the JV draws filled (Types 6-10).
function ring(tvf, plus) {   // WG1-TVA1 and WG2 into a B/R block, then TVF1 -> TVF2 -> TVA2 (Types 4-6)
	return {
		blocks: [["WG1", 0, 0], ["TVA1", 1, 0], ["WG2", 0, 1], [tvf, 2, 0.5], ["TVF1", 3, 0], ["TVF2", 4, 1], ["TVA2", 5, 1]],
		links: [[0, 1], [1, 3], [2, 3], [3, 4], [4, 5], [5, 6]]
	};
}
function ring7(mix) {        // WG1-TVF1-TVA1 and WG2 into R, then TVF2 -> TVA2 (Types 7, 8); mix: WG2 also goes
	var links = [[0, 1], [1, 2], [2, 4], [3, 4], [4, 5], [5, 6]];   // straight to TVF2, below the R block
	if (mix) {
		links.push([3, 5]);
	}
	return {
		blocks: [["WG1", 0, 0], ["TVF1", 1, 0], ["TVA1", 2, 0], ["WG2", 0, 1], ["R+", 3, 0.5], ["TVF2", 4, 1], ["TVA2", 5, 1]],
		links: links
	};
}
function ring9(mix) {        // WG1-TVF1-TVA1 and WG2-TVF2 into R, then TVA2 (Types 9, 10); mix: TVF2 also goes
	var links = [[0, 1], [1, 2], [2, 5], [3, 4], [4, 5], [5, 6]];   // straight to TVA2, below the R block
	if (mix) {
		links.push([4, 6]);
	}
	return {
		blocks: [["WG1", 0, 0], ["TVF1", 1, 0], ["TVA1", 2, 0], ["WG2", 0, 1], ["TVF2", 1, 1], ["R+", 3, 0.5], ["TVA2", 4, 1]],
		links: links
	};
}
var TYPES = [
	{ // 1: independent tones
		blocks: [["WG1", 0, 0], ["TVF1", 1, 0], ["TVA1", 2, 0], ["WG2", 0, 1], ["TVF2", 1, 1], ["TVA2", 2, 1]],
		links: [[0, 1], [1, 2], [3, 4], [4, 5]]
	},
	{ // 2: WG1-TVA1 and WG2 mixed, then the two filters stacked
		blocks: [["WG1", 0, 0], ["TVA1", 1, 0], ["WG2", 0, 1], ["TVF1", 2, 0], ["TVF2", 3, 1], ["TVA2", 4, 1]],
		links: [[0, 1], [1, 3], [2, 3], [3, 4], [4, 5]]
	},
	{ // 3: mixed, TVF1, booster, TVF2
		blocks: [["WG1", 0, 0], ["TVA1", 1, 0], ["WG2", 0, 1], ["TVF1", 2, 0], ["B", 3, 0.5], ["TVF2", 4, 1], ["TVA2", 5, 1]],
		links: [[0, 1], [1, 3], [2, 3], [3, 4], [4, 5], [5, 6]]
	},
	ring("B"),       // 4: booster, then the two filters
	ring("R"),       // 5: ring modulator, then the two filters
	ring("R+"),      // 6: ring modulator with Tone 2 mixed in, then the two filters
	ring7(false),    // 7
	ring7(true),     // 8: Tone 2 also mixed in, the line below R
	ring9(false),    // 9
	ring9(true)      // 10: Tone 2 also mixed in, the line below R
];

if (typeof mgraphics !== "undefined") {
	mgraphics.init();
	mgraphics.relative_coords = 0;
	mgraphics.autofill = 0;
}

function msg_int(v) {
	type(v);
}

function type(v) {
	v = Math.round(v);
	if (v < 0 || v >= TYPES.length) {
		return;
	}
	current = v;
	outlet(0, "active", v === 2 || v === 3 ? 1 : 0);
	redraw();
}

function booster(v) {
	boost = Math.max(0, Math.min(3, Math.round(v)));
	redraw();
}

function redraw() {
	if (typeof mgraphics !== "undefined") {
		mgraphics.redraw();
	}
}

// label with the pair's tone numbers: "WG1" -> "WG3" for the second pair
function label(s) {
	var a = pair === 2 ? 3 : 1;
	return s.replace(/1$/, String(a)).replace(/2$/, String(a + 1));
}

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var t = TYPES[current];
	var cols = 0;
	for (var i = 0; i < t.blocks.length; i++) {
		cols = Math.max(cols, t.blocks[i][1] + 1);
	}
	var cw = w / cols;
	var bw = Math.min(cw - 6, 34), bh = Math.min(14, h / 2 - 4);
	function pos(b) {
		return [b[1] * cw + (cw - bw) / 2, 2 + b[2] * (h - bh - 4), bw, bh];
	}
	mgraphics.set_line_width(1);
	mgraphics.set_source_rgba(1.0, 0.71, 0.2, 0.9);
	for (i = 0; i < t.links.length; i++) {
		var a = pos(t.blocks[t.links[i][0]]), b = pos(t.blocks[t.links[i][1]]);
		var x1 = a[0] + a[2], y1 = a[1] + a[3] / 2, x2 = b[0], y2 = b[1] + b[3] / 2;
		var xm = (x1 + x2) / 2;
		mgraphics.move_to(x1, y1);
		mgraphics.line_to(xm, y1);
		mgraphics.line_to(xm, y2);
		mgraphics.line_to(x2, y2);
		mgraphics.stroke();
	}
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(8);
	for (i = 0; i < t.blocks.length; i++) {
		var r = pos(t.blocks[i]);
		var name = t.blocks[i][0];
		var special = name === "B" || name === "R" || name === "R+";
		var inverted = name === "R+";   // the JV draws this block inverted
		if (inverted) {
			mgraphics.set_source_rgba(1.0, 0.71, 0.2, 1);
		} else {
			mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
		}
		mgraphics.rectangle(r[0], r[1], r[2], r[3]);
		mgraphics.fill();
		mgraphics.set_source_rgba(special ? 1.0 : 0.65, special ? 0.71 : 0.65, special ? 0.2 : 0.65, 1);
		mgraphics.rectangle(r[0] + 0.5, r[1] + 0.5, r[2] - 1, r[3] - 1);
		mgraphics.stroke();
		var text = name === "B" ? "B" + BOOST[boost] : (name === "R+" ? "R" : label(name));
		var m = mgraphics.text_measure(text);
		var c = inverted ? 0.12 : 0.9;
		mgraphics.set_source_rgba(c, c, c, 1);
		mgraphics.move_to(r[0] + (r[2] - m[0]) / 2, r[1] + r[3] / 2 + 3);
		mgraphics.show_text(text);
	}
}
