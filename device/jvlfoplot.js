// LFO shape preview for the LFO page (jsui). One instance per LFO; the page's controls feed it.
//
//   wave 0-7      TRI SIN SAW SQR TRP S&H RND CHS
//   rate 0-127    more cycles in the window
//   offset 0-4    -100 -50 0 +50 +100: shifts the swing below / around / above 0
//   delay 0-127   time before the LFO starts (or, for the OFF modes, after key off)
//   fademode 0-3  ON-IN ON-OUT OFF-IN OFF-OUT
//   fadetime 0-127
//
// It's an illustration, not a measurement: the JV doesn't document rate or times in seconds. The window shows
// key on at the left edge; for the OFF fade modes, key off is the dashed line at KEY_OFF.

autowatch = 1;
inlets = 1;
outlets = 0;
setinletassist(0, "wave, rate, offset, delay, fademode, fadetime");

var KEY_OFF = 0.5;     // key off position (fraction of the width) for OFF-IN / OFF-OUT
var TIME_SPAN = 0.45;  // delay 127 or fade time 127 = this fraction of the width
var state = { wave: 0, rate: 64, offset: 2, delay: 0, fademode: 0, fadetime: 0 };

if (typeof mgraphics !== "undefined") {
	mgraphics.init();
	mgraphics.relative_coords = 0;
	mgraphics.autofill = 0;
}

function set(key, v) {
	state[key] = Math.round(v);
	if (typeof mgraphics !== "undefined") {
		mgraphics.redraw();
	}
}

function wave(v) { set("wave", v); }
function rate(v) { set("rate", v); }
function offset(v) { set("offset", v); }
function delay(v) { set("delay", v); }
function fademode(v) { set("fademode", v); }
function fadetime(v) { set("fadetime", v); }

// deterministic "random" values so the picture doesn't change on every redraw
function noise(i) {
	var x = Math.sin(i * 12.9898 + 78.233) * 43758.5453;
	return (x - Math.floor(x)) * 2 - 1;
}

// wave value in -1..1 at phase p (cycles, may exceed 1)
function shape(w, p) {
	var f = p - Math.floor(p);
	var c = Math.floor(p);
	switch (w) {
	case 0: return f < 0.25 ? 4 * f : (f < 0.75 ? 2 - 4 * f : 4 * f - 4);        // TRI
	case 1: return Math.sin(2 * Math.PI * f);                                       // SIN
	case 2: return 2 * f - 1;                                                       // SAW
	case 3: return f < 0.5 ? 1 : -1;                                                // SQR
	case 4: return Math.max(-1, Math.min(1, 2 * shape(0, p)));                     // TRP
	case 5: return noise(Math.floor(p * 2));                                        // S&H: two steps per cycle
	case 6: {                                                                       // RND: smooth random
		var a = noise(c), b = noise(c + 1), t = (1 - Math.cos(Math.PI * f)) / 2;
		return a + (b - a) * t;
	}
	default: return 0.6 * Math.sin(2 * Math.PI * f) + 0.4 * noise(Math.floor(p * 8)); // CHS
	}
}

// amplitude 0..1 at x (0..1 across the window) from delay, fade mode and fade time
function envelope(x) {
	var d = state.delay / 127 * TIME_SPAN;
	var ft = state.fadetime / 127 * TIME_SPAN;
	var off = state.fademode >= 2;
	var start = (off ? KEY_OFF : 0) + d;
	var fadeIn = state.fademode === 0 || state.fademode === 2;
	if (x < start) {
		return fadeIn ? 0 : 1;
	}
	var k = ft > 0 ? Math.min(1, (x - start) / ft) : 1;
	return fadeIn ? k : 1 - k;
}

// the curve as values -1..1 for n points
function curve(n) {
	var cycles = 0.75 + state.rate / 127 * 11;
	var shift = (state.offset - 2) / 2;   // -1 .. +1
	var ys = [];
	for (var i = 0; i < n; i++) {
		var x = i / (n - 1);
		ys.push((shape(state.wave, x * cycles) + shift) / 2 * envelope(x));
	}
	return ys;
}

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var mid = h / 2;
	var amp = h / 2 - 2;
	mgraphics.set_source_rgba(0.1, 0.1, 0.1, 1);
	mgraphics.rectangle(0, 0, w, h);
	mgraphics.fill();
	mgraphics.set_source_rgba(0.35, 0.35, 0.35, 1);
	mgraphics.set_line_width(1);
	mgraphics.move_to(0, mid);
	mgraphics.line_to(w, mid);
	mgraphics.stroke();
	if (state.fademode >= 2) {
		var kx = Math.round(KEY_OFF * w) + 0.5;
		for (var y = 0; y < h; y += 4) {
			mgraphics.move_to(kx, y);
			mgraphics.line_to(kx, y + 2);
		}
		mgraphics.stroke();
	}
	var ys = curve(Math.max(2, Math.round(w)));
	mgraphics.set_source_rgba(1.0, 0.71, 0.2, 1);
	mgraphics.set_line_width(1.25);
	mgraphics.move_to(0, mid - ys[0] * amp);
	for (var i = 1; i < ys.length; i++) {
		mgraphics.line_to(i, mid - ys[i] * amp);
	}
	mgraphics.stroke();
}
