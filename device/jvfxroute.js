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

autowatch = 1;
inlets = 1;
outlets = 0;
setinletassist(0, "tone / efx / efxname / chorus / reverb messages");

var REVERB_TYPES = ["ROOM1", "ROOM2", "STAGE1", "STAGE2", "HALL1", "HALL2", "DELAY", "PAN-DLY"];
var state = {
	tones: [],
	efx: { out: 0, mix: 127, cho: 0, rev: 0, name: "" },
	chorus: { level: 0, out: 0 },
	reverb: { level: 0, type: 4 }
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

function block(r, label, sub, on) {
	mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
	mgraphics.rectangle(r[0], r[1], r[2], r[3]);
	mgraphics.fill();
	if (on) {
		mgraphics.set_source_rgba(0.65, 0.65, 0.65, 1);
	} else {
		mgraphics.set_source_rgba(0.35, 0.35, 0.35, 1);
	}
	mgraphics.set_line_width(1);
	mgraphics.rectangle(r[0] + 0.5, r[1] + 0.5, r[2] - 1, r[3] - 1);
	mgraphics.stroke();
	text(label, r[0] + r[2] / 2, r[1] + (sub ? r[3] / 2 - 2 : r[3] / 2 + 3), 9, on);
	if (sub) {
		text(sub, r[0] + r[2] / 2, r[1] + r[3] / 2 + 9, 8, on);
	}
}

function text(s, cx, y, size, on) {
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(size);
	var m = mgraphics.text_measure(s);
	var a = on ? 0.9 : 0.45;
	mgraphics.set_source_rgba(a, a, a, 1);
	mgraphics.move_to(cx - m[0] / 2, y);
	mgraphics.show_text(s);
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
	block(L.EFX, "EFX", state.efx.name, !!used.EFX);
	block(L.CHO, "Cho", null, !!used.CHO);
	block(L.REV, "Rev", REVERB_TYPES[state.reverb.type] || null, !!used.REV);
	block(L.MIX, "Mix", null, true);
	block(L.DIR1, "D1", null, !!used.DIR1);
	block(L.DIR2, "D2", null, !!used.DIR2);
}
