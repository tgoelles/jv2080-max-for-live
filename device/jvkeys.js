// Key ranges of the 16 performance parts on the Keys page (jsui): one horizontal bar per part over the keyboard
// (C-1 ... G9), for splits and layers. The key range controls feed it, and dragging an end of a bar sets that
// control: outlet 0 sends "<varname> <value>" (e.g. "P3KeyHi 59"), routed to the control, which sends it to the JV
// like any other edit. Parts switched off are drawn dim.
//
//   part <1-16> lo|hi <0-127>   Keyboard Range Lower/Upper (MIDI note, C-1 = 0)
//   part <1-16> on <0/1>        Receive Switch (from the Parts page)
//   keysw <0/1>                 Keyboard Range Switch (performance common): off = the JV ignores the ranges

autowatch = 1;
inlets = 1;
outlets = 1;
setinletassist(0, "part n lo|hi|on v; keysw 0/1");

var parts = [];
for (var p = 0; p < 16; p++) {
	parts.push({ lo: 0, hi: 127, on: 1 });
}
var keysOn = 1;
var FIELDS = { lo: "KeyLo", hi: "KeyHi" };
var COLORS = [[1.0, 0.71, 0.2], [0.45, 0.78, 0.95], [0.55, 0.85, 0.45], [0.95, 0.5, 0.7]];
var NAMES = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
var grab = null;   // { part 0-15, field } while dragging

if (typeof mgraphics !== "undefined") {
	mgraphics.init();
	mgraphics.relative_coords = 0;
	mgraphics.autofill = 0;
}

function part(n, key, v) {
	var z = parts[Math.round(n) - 1];
	if (z && z[key] !== undefined) {
		z[key] = Math.round(v);
		redraw();
	}
}

function keysw(v) {
	keysOn = v ? 1 : 0;
	redraw();
}

function redraw() {
	if (typeof mgraphics !== "undefined") {
		mgraphics.redraw();
	}
}

function note(n) {
	return NAMES[n % 12] + (Math.floor(n / 12) - 1);
}

// where things are in a w x h graphic: a label column for the part numbers, the bars, the octave labels below
function layout(w, h) {
	var left = 18, labelH = 11;
	return { w: w, h: h, left: left, keysW: w - left, row: (h - labelH) / 16, barsH: h - labelH };
}

// x of a key's left edge
function keyX(k, L) {
	return L.left + k / 128 * L.keysW;
}

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var L = layout(w, h);
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(8);
	for (var oct = 0; oct <= 10; oct++) {
		var x = keyX(oct * 12, L);
		mgraphics.set_source_rgba(0.3, 0.3, 0.3, 1);
		mgraphics.move_to(x + 0.5, 0);
		mgraphics.line_to(x + 0.5, L.barsH);
		mgraphics.stroke();
		mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
		mgraphics.move_to(x + 2, h - 2);
		mgraphics.show_text("C" + (oct - 1));
	}
	for (var i = 0; i < 16; i++) {
		var z = parts[i], c = COLORS[i % 4], y = i * L.row;
		mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
		var n = String(i + 1);
		mgraphics.move_to(L.left - 3 - mgraphics.text_measure(n)[0], y + L.row - 1.5);
		mgraphics.show_text(n);
		if (z.lo > z.hi) {
			continue;
		}
		var alpha = !z.on ? 0.15 : keysOn ? 0.85 : 0.35;
		var x0 = keyX(z.lo, L), x1 = keyX(z.hi + 1, L);
		mgraphics.set_source_rgba(c[0], c[1], c[2], alpha);
		mgraphics.rectangle(x0, y + 1, Math.max(1, x1 - x0), L.row - 2);
		mgraphics.fill();
		if (z.on && (z.lo > 0 || z.hi < 127)) {   // the range's ends as note names
			var label = note(z.lo) + "-" + note(z.hi);
			if (mgraphics.text_measure(label)[0] < x1 - x0 - 4) {
				mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
				mgraphics.move_to(x0 + 2, y + L.row - 2);
				mgraphics.show_text(label);
			}
		}
	}
	if (!keysOn) {
		var off = "key ranges off: every part plays the whole keyboard";
		mgraphics.set_source_rgba(0.85, 0.85, 0.85, 1);
		mgraphics.move_to(L.left + L.keysW / 2 - mgraphics.text_measure(off)[0] / 2, L.barsH / 2 + 3);
		mgraphics.show_text(off);
	}
}

// --- dragging: grab the nearest end of a part's bar

function hit(x, y, L) {
	if (y < 0 || y >= L.barsH || x < L.left) {
		return null;
	}
	var i = Math.min(15, Math.floor(y / L.row));
	var z = parts[i];
	var lo = keyX(z.lo, L), hi = keyX(z.hi + 1, L);
	return { part: i, field: Math.abs(x - lo) <= Math.abs(x - hi) ? "lo" : "hi" };
}

function valueAt(g, x, L) {
	var z = parts[g.part];
	var key = Math.max(0, Math.min(127, Math.floor((x - L.left) / L.keysW * 128)));
	return g.field === "lo" ? Math.min(key, z.hi) : Math.max(key, z.lo);
}

function onclick(x, y) {
	grab = hit(x, y, layout(box.rect[2] - box.rect[0], box.rect[3] - box.rect[1]));
	ondrag(x, y, 1);
}

function ondrag(x, y, but) {
	if (!grab) {
		return;
	}
	var v = valueAt(grab, x, layout(box.rect[2] - box.rect[0], box.rect[3] - box.rect[1]));
	if (v !== parts[grab.part][grab.field]) {
		outlet(0, "P" + (grab.part + 1) + FIELDS[grab.field], v);   // the control sets it, sends it and feeds it back
	}
	if (!but) {
		grab = null;
	}
}

if (typeof module !== "undefined") {
	module.exports = { layout: layout, hit: hit, valueAt: valueAt, parts: parts, note: note };
}
