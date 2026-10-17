// Effects routing graphic for the FX page (jsui), after the JV's PATCH -> Effects General page: where each
// tone's sound goes (MIX, EFX, DIR1, DIR2) and its chorus/reverb sends, the EFX block and its output, chorus
// and reverb. Display only; the page's controls feed it. Brighter lines = higher levels; a level of 0 isn't drawn.
//
//   tone <1-4> out <0-3>        Output Assign: MIX EFX DIR1 DIR2
//   tone <1-4> mix|cho|rev <v>  Mix/EFX, Chorus and Reverb Send Level
//   efxname <words...>          "17 STEREO-DELAY"
//   efx out <0-2>               EFX Output Assign: MIX DIR1 DIR2
//   efx mix|cho|rev <v>         EFX Mix Out, Chorus and Reverb Send Level
//   chorus level <v> / chorus out <0-2>   Chorus Level, Output: MIX REVERB MIX+REV
//   reverb level <v> / reverb type <0-7>
//   efx|chorus|reverb on <0/1>   the JV-wide Effects On/Off switches (s ---fxsw): an unit that's off is drawn
//                                with a dashed outline, like on the JV

autowatch = 1;
inlets = 1;
outlets = 0;
setinletassist(0, "tone / efx / efxname / chorus / reverb messages");

var REVERB_TYPES = ["ROOM1", "ROOM2", "STAGE1", "STAGE2", "HALL1", "HALL2", "DELAY", "PAN-DLY"];
var state = {
	tones: [],
	efx: { out: 0, mix: 127, cho: 0, rev: 0, name: "", on: 1 },
	chorus: { level: 0, out: 0, on: 1 },
	reverb: { level: 0, type: 4, on: 1 }
};
for (var t = 0; t < 4; t++) {
	state.tones.push({ out: 0, mix: 127, cho: 0, rev: 0 });
}

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

function tone(n, key, v) {
	var t = state.tones[Math.round(n) - 1];
	if (t && t[key] !== undefined) {
		t[key] = Math.round(v);
		redraw();
	}
}

function efx(key, v) {
	if (state.efx[key] !== undefined && key !== "name") {
		state.efx[key] = Math.round(v);
		redraw();
	}
}

function efxname() {
	state.efx.name = arrayfromargs(arguments).join(" ");
	redraw();
}

function chorus(key, v) {
	if (state.chorus[key] !== undefined) {
		state.chorus[key] = Math.round(v);
		redraw();
	}
}

function reverb(key, v) {
	if (state.reverb[key] !== undefined) {
		state.reverb[key] = Math.round(v);
		redraw();
	}
}

// Every connection to draw: [from, to, level 0-127, "main" | "send"]. Exposed for the tests.
function connections() {
	var c = [];
	var outs = ["MIX", "EFX", "DIR1", "DIR2"];
	for (var i = 0; i < 4; i++) {
		var t = state.tones[i], from = "T" + (i + 1);
		c.push([from, outs[t.out] || "MIX", t.mix, "main"]);
		if (t.out <= 1) {   // DIR1/2 bypass chorus and reverb
			c.push([from, "CHO", t.cho, "send"]);
			c.push([from, "REV", t.rev, "send"]);
		}
	}
	var e = state.efx;
	c.push(["EFX", ["MIX", "DIR1", "DIR2"][e.out] || "MIX", e.mix, "main"]);
	if (e.out === 0) {
		c.push(["EFX", "CHO", e.cho, "send"]);
		c.push(["EFX", "REV", e.rev, "send"]);
	}
	var ch = state.chorus;
	if (ch.out === 0 || ch.out === 2) {
		c.push(["CHO", "MIX", ch.level, "main"]);
	}
	if (ch.out === 1 || ch.out === 2) {
		c.push(["CHO", "REV", ch.level, "main"]);
	}
	c.push(["REV", "MIX", state.reverb.level, "main"]);
	// a block's outputs only count when something reaches it
	var live = c.filter(function (x) { return x[2] > 0; });
	var fed = function (to, list) { return list.some(function (x) { return x[1] === to; }); };
	live = live.filter(function (x) { return x[0] !== "EFX" || fed("EFX", live); });
	live = live.filter(function (x) { return x[0] !== "CHO" || fed("CHO", live); });
	return live.filter(function (x) { return x[0] !== "REV" || fed("REV", live); });
}

// Block positions for a w x h graphic: [x, y, width, height]
function layout(w, h) {
	var row = (h - 4) / 4;
	var L = {};
	for (var i = 0; i < 4; i++) {
		L["T" + (i + 1)] = [2, 2 + i * row + 2, 22, row - 4];
	}
	L.EFX = [w * 0.24, 4, w * 0.42, h * 0.3];
	L.CHO = [w * 0.42, h * 0.42, w * 0.2, h * 0.16];
	L.REV = [w * 0.42, h * 0.68, w * 0.2, h * 0.16];
	L.MIX = [w - 26, 4, 24, h * 0.62];
	L.DIR1 = [w - 26, h * 0.7, 24, h * 0.13];
	L.DIR2 = [w - 26, h * 0.85, 24, h * 0.13];
	return L;
}

// switchedOff: the JV-wide switch for this unit is off -> dashed outline
function block(r, label, sub, on, switchedOff) {
	mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
	mgraphics.rectangle(r[0], r[1], r[2], r[3]);
	mgraphics.fill();
	var a = on && !switchedOff ? 0.65 : 0.35;
	mgraphics.set_source_rgba(a, a, a, 1);
	mgraphics.set_line_width(1);
	if (switchedOff) {
		dashedRect(r[0] + 0.5, r[1] + 0.5, r[2] - 1, r[3] - 1);
	} else {
		mgraphics.rectangle(r[0] + 0.5, r[1] + 0.5, r[2] - 1, r[3] - 1);
		mgraphics.stroke();
	}
	var lit = on && !switchedOff;
	text(switchedOff ? label + " off" : label, r[0] + r[2] / 2, r[1] + (sub ? r[3] / 2 - 2 : r[3] / 2 + 3), 9, lit, r[2] - 4);
	if (sub) {
		text(sub, r[0] + r[2] / 2, r[1] + r[3] / 2 + 9, 8, lit, r[2] - 4);
	}
}

function dashedRect(x, y, w, h) {
	var pts = [[x, y], [x + w, y], [x + w, y + h], [x, y + h], [x, y]];
	for (var i = 0; i < 4; i++) {
		var a = pts[i], b = pts[i + 1];
		var len = Math.abs(b[0] - a[0]) + Math.abs(b[1] - a[1]);
		for (var s = 0; s < len; s += 5) {
			var e = Math.min(len, s + 3);
			mgraphics.move_to(a[0] + (b[0] - a[0]) * s / len, a[1] + (b[1] - a[1]) * s / len);
			mgraphics.line_to(a[0] + (b[0] - a[0]) * e / len, a[1] + (b[1] - a[1]) * e / len);
		}
	}
	mgraphics.stroke();
}

// Text centred at cx; shrinks down to 6 pt, then shortens with "..", to fit maxWidth.
function fit(s, size, maxWidth, measure) {
	while (size > 6 && measure(s, size) > maxWidth) {
		size -= 0.5;
	}
	if (measure(s, size) > maxWidth) {
		while (s.length > 2 && measure(s + "..", size) > maxWidth) {
			s = s.slice(0, -1);
		}
		s += "..";
	}
	return [s, size];
}

function text(s, cx, y, size, on, maxWidth) {
	mgraphics.select_font_face("Arial");
	var f = fit(s, size, maxWidth, function (t, sz) {
		mgraphics.set_font_size(sz);
		return mgraphics.text_measure(t)[0];
	});
	mgraphics.set_font_size(f[1]);
	var m = mgraphics.text_measure(f[0]);
	var a = on ? 0.9 : 0.45;
	mgraphics.set_source_rgba(a, a, a, 1);
	mgraphics.move_to(cx - m[0] / 2, y);
	mgraphics.show_text(f[0]);
}

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];
	var L = layout(w, h);
	var used = {};
	var c = connections();
	for (var i = 0; i < c.length; i++) {
		used[c[i][0]] = used[c[i][1]] = true;
	}
	for (i = 0; i < c.length; i++) {
		var a = L[c[i][0]], b = L[c[i][1]];
		var x1 = a[0] + a[2], y1 = a[1] + a[3] / 2;
		var x2 = b[0], y2 = b[1] + b[3] / 2;
		var k = 0.25 + 0.75 * c[i][2] / 127;
		if (c[i][3] === "main") {
			mgraphics.set_source_rgba(1.0, 0.71, 0.2, k);
			mgraphics.set_line_width(1.5);
		} else {
			mgraphics.set_source_rgba(0.45, 0.78, 0.95, k);
			mgraphics.set_line_width(1);
		}
		var xm = x1 + Math.max(4, (x2 - x1) / 2);
		mgraphics.move_to(x1, y1);
		mgraphics.line_to(xm, y1);
		mgraphics.line_to(xm, y2);
		mgraphics.line_to(x2, y2);
		mgraphics.stroke();
	}
	for (var t = 1; t <= 4; t++) {
		block(L["T" + t], "T" + t, null, true);
	}
	block(L.EFX, "EFX", state.efx.name, !!used.EFX, !state.efx.on);
	block(L.CHO, "Cho", null, !!used.CHO, !state.chorus.on);
	block(L.REV, "Rev", REVERB_TYPES[state.reverb.type] || null, !!used.REV, !state.reverb.on);
	block(L.MIX, "Mix", null, true);
	block(L.DIR1, "D1", null, !!used.DIR1);
	block(L.DIR2, "D2", null, !!used.DIR2);
}
