// Key and velocity zones of the four tones on the Patch page (jsui): which keys and velocities each tone plays,
// for splits and layers. Display only; the zone controls next to it feed it.
//
//   tone <1-4> keylo|keyhi <0-127>   Keyboard Range Lower/Upper (MIDI note, C-1 = 0)
//   tone <1-4> vello|velhi <1-127>   Velocity Range Lower/Upper
//   tone <1-4> fade <0-127>          Velocity Cross Fade
//   velsw <0/1>                      Velocity Range Switch (patch common): off = velocity ranges are ignored

autowatch = 1;
inlets = 1;
outlets = 0;
setinletassist(0, "tone n keylo|keyhi|vello|velhi|fade v; velsw 0/1");

var tones = [];
for (var t = 0; t < 4; t++) {
	tones.push({ keylo: 0, keyhi: 127, vello: 1, velhi: 127, fade: 0 });
}
var velOn = 0;

if (typeof mgraphics !== "undefined") {
	mgraphics.init();
	mgraphics.relative_coords = 0;
	mgraphics.autofill = 0;
}

function tone(n, key, v) {
	var z = tones[Math.round(n) - 1];
	if (z && z[key] !== undefined) {
		z[key] = Math.round(v);
		redraw();
	}
}

function velsw(v) {
	velOn = v ? 1 : 0;
	redraw();
}

function redraw() {
	if (typeof mgraphics !== "undefined") {
		mgraphics.redraw();
	}
}

// [from, to] as fractions of the width for a range of min..127; nothing when lower > upper
function spans(lo, hi, min) {
	var n = 128 - min;
	return lo <= hi ? [[(lo - min) / n, (hi - min + 1) / n]] : [];
}

// One map like Live's: keys left to right (C-1 ... G9), velocity bottom to top (1 ... 127). Each tone is a
// rectangle over its key range and velocity range; the cross fade is shaded at its velocity edges. With the
// velocity range switch off the JV ignores velocity ranges, so every tone spans the full height.
var COLORS = [[1.0, 0.71, 0.2], [0.45, 0.78, 0.95], [0.55, 0.85, 0.45], [0.95, 0.5, 0.7]];

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var axis = 12;            // key labels below the map
	var mh = h - axis;
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(8);
	mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
	mgraphics.rectangle(0, 0, w, mh);
	mgraphics.fill();
	// octave lines at every C, labels for C1, C4, C7; velocity lines at 32 / 64 / 96
	for (var oct = 0; oct <= 10; oct++) {
		var x = oct * 12 / 128 * w;
		mgraphics.set_source_rgba(0.25, 0.25, 0.25, 1);
		mgraphics.move_to(x + 0.5, 0);
		mgraphics.line_to(x + 0.5, mh);
		mgraphics.stroke();
		if (oct === 2 || oct === 5 || oct === 8) {
			mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
			mgraphics.move_to(x + 2, h - 2);
			mgraphics.show_text("C" + (oct - 1));
		}
	}
	for (var v = 32; v < 128; v += 32) {
		var y = mh - v / 127 * mh;
		mgraphics.set_source_rgba(0.25, 0.25, 0.25, 1);
		mgraphics.move_to(0, y + 0.5);
		mgraphics.line_to(w, y + 0.5);
		mgraphics.stroke();
	}
	for (var i = 0; i < 4; i++) {
		var z = tones[i];
		var r = zone(z, w, mh);
		if (!r) {
			continue;
		}
		var c = COLORS[i];
		mgraphics.set_source_rgba(c[0], c[1], c[2], 0.3);
		mgraphics.rectangle(r[0], r[1], r[2], r[3]);
		mgraphics.fill();
		if (velOn && z.fade > 0) {   // cross fade: lighter bands at the top and bottom velocity edges
			var f = Math.min(r[3] / 2, z.fade / 127 * mh);
			mgraphics.set_source_rgba(0.12, 0.12, 0.12, 0.35);
			mgraphics.rectangle(r[0], r[1], r[2], f);
			mgraphics.fill();
			mgraphics.rectangle(r[0], r[1] + r[3] - f, r[2], f);
			mgraphics.fill();
		}
		mgraphics.set_source_rgba(c[0], c[1], c[2], 1);
		mgraphics.set_line_width(1);
		mgraphics.rectangle(r[0] + 0.5, r[1] + 0.5, r[2] - 1, r[3] - 1);
		mgraphics.stroke();
		mgraphics.move_to(r[0] + 3, r[1] + 9);
		mgraphics.show_text(String(i + 1));
	}
	mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
	var label = velOn ? "vel" : "vel off";
	mgraphics.move_to(w - mgraphics.text_measure(label)[0] - 2, h - 2);
	mgraphics.show_text(label);
}

// [x, y, width, height] of a tone's zone in a w x h map, or null when a range is empty (lower > upper)
function zone(z, w, h) {
	var k = spans(z.keylo, z.keyhi, 0);
	var v = velOn ? spans(z.vello, z.velhi, 1) : [[0, 1]];
	if (!k.length || !v.length) {
		return null;
	}
	var x1 = k[0][0] * w, x2 = k[0][1] * w;
	var y1 = h - v[0][1] * h, y2 = h - v[0][0] * h;   // velocity 127 at the top
	return [x1, y1, Math.max(1, x2 - x1), Math.max(1, y2 - y1)];
}
