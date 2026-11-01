// Which sections and page buttons are visible: the tone tabs, the page buttons and the mode switch (Patch /
// Perform) feed this; it sends "script show/hide <varname>" to thispatcher and keeps the page buttons in step.
//
// Patch mode: the tone's four sections (Pitch, TVF, WG, VCA), or a page instead: LFO and Ctrl (per tone),
// FX and Patch (patch-wide). Perform mode: the Parts page, the Keys page, or the Part page of the part chosen with the part
// buttons (PartSel1-16, the selected one lit). Library and Setup work in both modes.
// One page at a time: switching one on switches the others off; switching it off shows the mode's main view.
// A tone tab click leaves LFO / Ctrl on (they follow the tone) and switches the other pages off.
//
// inlet 0: "mode 0/1", "tone 0-3", "part 0-15" (opens that part's Part page), "page <name> 0/1", "refresh" (at load)
// outlet 0: "script show <varname>" / "script hide <varname>" for thispatcher
// outlet 1: "<page> set 0/1" for the page buttons, "p<n> set 0/1" for the part buttons (route by name)

autowatch = 1;
inlets = 1;
outlets = 2;
setinletassist(0, "mode, tone, page <name> 0/1, refresh");
setoutletassist(0, "script show/hide for thispatcher");
setoutletassist(1, "<page> set 0/1 for the page buttons");

var PAGES = ["lfo", "ctrl", "fx", "patch", "library", "setup", "part", "keys"];
var GLOBAL = { library: "LibraryPage", setup: "Settings" };    // in both modes
var PATCH_PAGES = { lfo: 1, ctrl: 1, patch: 1 };   // fx: both modes (patch FX / performance FX)
var PERFORM_PAGES = { part: 1, keys: 1 };
// controls that only exist in Patch mode: the tone tabs, the patch page buttons and the tone switches / levels
var PATCH_CONTROLS = ["ToneTabs", "LFOButton", "CtrlButton", "PatchButton", "ToneMix", "FXButton"];
var PERFORM_CONTROLS = ["PartButton", "KeysButton", "FXButton"];
for (var pb = 1; pb <= 16; pb++) {
	PERFORM_CONTROLS.push("PartSel" + pb);
}

var mode = 0;      // 0 Patch, 1 Perform
var tone = 0;      // 0-3
var part = 0;      // 0-15
var page = null;   // null = the mode's main view
var shown = {};    // varname -> true / false as last sent
var states = {};   // page -> button state as last sent

function sections() {
	var all = ["CtrlCommon", "FX", "PatchPage", "LibraryPage", "Settings", "PerformPage", "KeysPage", "PerfFX"];
	for (var t = 1; t <= 4; t++) {
		all.push("Pitch_" + t, "TVF_" + t, "WG_" + t, "VCA_" + t, "LFO_" + t, "CTRL_" + t);
	}
	for (var p = 1; p <= 16; p++) {
		all.push("PartEdit_" + p);
	}
	var both = PATCH_CONTROLS.concat(PERFORM_CONTROLS);
	for (var i = 0; i < both.length; i++) {
		if (all.indexOf(both[i]) < 0) {
			all.push(both[i]);   // FXButton is in both modes
		}
	}
	return all;
}

function visible() {
	var v = [], t = tone + 1;
	v = v.concat(mode === 1 ? PERFORM_CONTROLS : PATCH_CONTROLS);
	if (GLOBAL[page]) {
		v.push(GLOBAL[page]);
	} else if (mode === 1) {
		v.push(page === "part" ? "PartEdit_" + (part + 1) : page === "keys" ? "KeysPage" : page === "fx" ? "PerfFX" : "PerformPage");
	} else if (page === "lfo") {
		v.push("LFO_" + t);
	} else if (page === "ctrl") {
		v.push("CTRL_" + t, "CtrlCommon");
	} else if (page === "fx") {
		v.push("FX");
	} else if (page === "patch") {
		v.push("PatchPage");
	} else {
		v.push("Pitch_" + t, "TVF_" + t, "WG_" + t, "VCA_" + t);
	}
	return v;
}

function render(all) {
	var v = visible(), names = sections(), on = {};
	for (var i = 0; i < v.length; i++) {
		on[v[i]] = true;
	}
	// hide first, so two pages never overlap
	for (i = 0; i < names.length; i++) {
		if (!on[names[i]] && (all || shown[names[i]] !== false)) {
			outlet(0, "script", "hide", names[i]);
			shown[names[i]] = false;
		}
	}
	for (i = 0; i < names.length; i++) {
		if (on[names[i]] && (all || shown[names[i]] !== true)) {
			outlet(0, "script", "show", names[i]);
			shown[names[i]] = true;
		}
	}
	for (i = 0; i < PAGES.length; i++) {
		var s = page === PAGES[i] ? 1 : 0;
		if (all || states[PAGES[i]] !== s) {
			outlet(1, PAGES[i], "set", s);
			states[PAGES[i]] = s;
		}
	}
	for (i = 0; i < 16; i++) {
		var ps = i === part ? 1 : 0;
		if (all || states["p" + (i + 1)] !== ps) {
			outlet(1, "p" + (i + 1), "set", ps);
			states["p" + (i + 1)] = ps;
		}
	}
}

function msg_int(v) {
	// a bare number: ignore (the patch sends tagged messages)
}

function anything() {
	var a = arrayfromargs(arguments);
	if (messagename === "mode") {
		var m = Math.round(a[0]) === 1 ? 1 : 0;
		if (m !== mode) {
			mode = m;
			if (!GLOBAL[page]) {
				page = null;
			}
		}
	} else if (messagename === "tone") {
		tone = Math.max(0, Math.min(3, Math.round(a[0])));
		if (page !== "lfo" && page !== "ctrl") {
			page = null;
		}
	} else if (messagename === "page") {
		var name = String(a[0]), on = Math.round(a[1]) === 1;
		if (PAGES.indexOf(name) < 0) {
			return;
		}
		states[name] = on ? 1 : 0;   // the button's state now; render corrects it if the click is refused
		if (on && (mode === 0 ? !PERFORM_PAGES[name] : !PATCH_PAGES[name])) {
			page = name;
		} else if (!on && page === name) {
			page = null;
		}
	} else if (messagename === "part") {
		part = Math.max(0, Math.min(15, Math.round(a[0])));
		delete states["p" + (part + 1)];   // a click on the lit button switched it off: light it again
		if (mode === 1 && !GLOBAL[page]) {
			page = "part";
		}
	} else if (messagename === "refresh") {
		render(true);
		return;
	} else {
		return;
	}
	render(false);
}

if (typeof module !== "undefined") {
	module.exports = { visible: visible };
}
