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

// Top: the key ranges as four horizontal strips over the keyboard (C-1 ... G9). Bottom: the velocity ranges as
// four vertical bars, one per tone, velocity going up (1 at the bottom, 127 at the top) as in Live's velocity
// lane. The cross fade is shaded at the bar's ends. With the velocity range switch off the bars are dimmed: the JV
// then ignores velocity ranges.
var COLORS = [[1.0, 0.71, 0.2], [0.45, 0.78, 0.95], [0.55, 0.85, 0.45], [0.95, 0.5, 0.7]];

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var keysH = Math.round(h * 0.42);   // key strips
	var labelH = 11;                     // C1 / C4 / C7 under the strips
	var velTop = keysH + labelH + 3;
	var velH = h - velTop - 10;          // tone numbers under the bars
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(8);
	// keys: octave lines at every C
	for (var oct = 0; oct <= 10; oct++) {
		var x = oct * 12 / 128 * w;
		mgraphics.set_source_rgba(0.3, 0.3, 0.3, 1);
		mgraphics.move_to(x + 0.5, 0);
		mgraphics.line_to(x + 0.5, keysH);
		mgraphics.stroke();
		if (oct === 2 || oct === 5 || oct === 8) {
			mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
			mgraphics.move_to(x + 2, keysH + labelH - 2);
			mgraphics.show_text("C" + (oct - 1));
		}
	}
	var row = keysH / 4;
	var col = w / 4;
	for (var i = 0; i < 4; i++) {
		var z = tones[i];
		var c = COLORS[i];
		// key strip
		var k = spans(z.keylo, z.keyhi, 0);
		if (k.length) {
			mgraphics.set_source_rgba(c[0], c[1], c[2], 0.85);
			mgraphics.rectangle(k[0][0] * w, i * row + 1, Math.max(1, (k[0][1] - k[0][0]) * w), row - 2);
			mgraphics.fill();
			mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);   // tone number at the strip's start
			mgraphics.move_to(k[0][0] * w + 2, i * row + row - 2);
			mgraphics.show_text(String(i + 1));
		}
		// velocity bar
		var bx = i * col + col * 0.2, bw = col * 0.6;
		mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
		mgraphics.rectangle(bx, velTop, bw, velH);
		mgraphics.fill();
		var b = velBar(z, velH);
		if (b) {
			mgraphics.set_source_rgba(c[0], c[1], c[2], velOn ? 0.85 : 0.3);
			mgraphics.rectangle(bx, velTop + b[0], bw, b[1]);
			mgraphics.fill();
			if (velOn && z.fade > 0) {
				var f = Math.min(b[1] / 2, z.fade / 127 * velH);
				mgraphics.set_source_rgba(0.12, 0.12, 0.12, 0.35);
				mgraphics.rectangle(bx, velTop + b[0], bw, f);
				mgraphics.fill();
				mgraphics.rectangle(bx, velTop + b[0] + b[1] - f, bw, f);
				mgraphics.fill();
			}
		}
		mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
		var n = String(i + 1);
		mgraphics.move_to(bx + bw / 2 - mgraphics.text_measure(n)[0] / 2, h - 1);
		mgraphics.show_text(n);
	}
	if (!velOn) {
		mgraphics.set_source_rgba(0.55, 0.55, 0.55, 1);
		var off = "velocity off";
		mgraphics.move_to(w / 2 - mgraphics.text_measure(off)[0] / 2, velTop + velH / 2 + 3);
		mgraphics.show_text(off);
	}
}

// [top, height] of a tone's velocity range in a bar of height h (127 at the top), or null when empty;
// with the switch off the tone plays at every velocity
function velBar(z, h) {
	var v = velOn ? spans(z.vello, z.velhi, 1) : [[0, 1]];
	if (!v.length) {
		return null;
	}
	return [h - v[0][1] * h, Math.max(1, (v[0][1] - v[0][0]) * h)];
}
