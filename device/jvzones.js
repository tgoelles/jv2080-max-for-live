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

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var half = (h - 14) / 2;
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(8);
	// key axis: octave lines at every C, labels for C1 and C4
	for (var oct = 0; oct <= 10; oct++) {
		var x = oct * 12 / 128 * w;
		mgraphics.set_source_rgba(0.3, 0.3, 0.3, 1);
		mgraphics.move_to(x + 0.5, 0);
		mgraphics.line_to(x + 0.5, half);
		mgraphics.stroke();
		if (oct === 2 || oct === 5) {
			mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
			mgraphics.move_to(x + 2, half + 10);
			mgraphics.show_text("C" + (oct - 1));
		}
	}
	mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
	mgraphics.move_to(w - 52, half + 10);
	mgraphics.show_text(velOn ? "velocity" : "velocity off");
	var row = half / 4;
	for (var i = 0; i < 4; i++) {
		var z = tones[i];
		var y = i * row;
		draw(spans(z.keylo, z.keyhi, 0), y, row, w, 1, 0);
		draw(spans(z.vello, z.velhi, 1), half + 14 + y, row, w, velOn ? 1 : 0.3, velOn ? z.fade : 0);
		mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
		mgraphics.move_to(2, y + row - 2);
		mgraphics.show_text(String(i + 1));
		mgraphics.move_to(2, half + 14 + y + row - 2);
		mgraphics.show_text(String(i + 1));
	}
}

// bars for one tone; fade: the cross-fade width (0-127) shaded at both inner ends
function draw(list, y, row, w, alpha, fade) {
	for (var k = 0; k < list.length; k++) {
		var x1 = list[k][0] * w, x2 = list[k][1] * w;
		mgraphics.set_source_rgba(1.0, 0.71, 0.2, 0.85 * alpha);
		mgraphics.rectangle(x1, y + 1, Math.max(1, x2 - x1), row - 2);
		mgraphics.fill();
		if (fade > 0) {
			var f = Math.min((x2 - x1) / 2, fade / 127 * w);
			mgraphics.set_source_rgba(0.16, 0.16, 0.16, 0.35);
			mgraphics.rectangle(x1, y + 1, f, row - 2);
			mgraphics.fill();
			mgraphics.rectangle(x2 - f, y + 1, f, row - 2);
			mgraphics.fill();
		}
	}
}
