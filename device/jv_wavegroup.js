// Short Wave group menu for one tone: INT-A, INT-B and only the expansion boards
// set up on the Setup page, labelled with the JV's slot letter ("XP-A Techno").
//
// The visible menu is a live.menu set to a Hidden parameter (parameter_invisible 2:
// not stored, not automatable), so its list can be replaced at runtime with
// _parameter_range. (A live.menu with parameter_enable 0 has no item list at all.) The stored Live parameter stays the full, fixed list (0 INT-A, 1 INT-B,
// 2..20 = SR-JV80 board 1..19), so saved sets and automation keep their meaning
// when the board setup changes. This script only translates between that value
// and the short visible menu.
//
// inlet 0: wave group value (0-20) from the live.menu parameter, or
//          "boards a b c d e f g h" (board number per slot A-H, 0 = empty)
// inlet 1: index chosen in the visible menu
// outlet 0: commands for the visible menu (_parameter_range / set)
// outlet 1: wave group value (0-20) for the live.menu parameter

autowatch = 1;
inlets = 2;
outlets = 2;
setinletassist(0, "wave group value 0-20, or boards a..h");
setinletassist(1, "visible menu index");
setoutletassist(0, "to visible menu");
setoutletassist(1, "wave group value 0-20");

var BOARDS = ["Pop", "Orchestral", "Piano", "Vintage Synth", "World", "Dance", "Super Sound Set",
	"Keys 60s-70s", "Session", "Bass & Drum", "Techno", "Hip Hop", "Vocal", "Asia", "Special FX",
	"Orchestral II", "Country", "Latin", "House"];
var SLOTS = "ABCDEFGH";

var slots = [0, 0, 0, 0, 0, 0, 0, 0];
var current = 0;
var items = [];   // wave group value for each visible menu entry, in menu order

function loadbang() {
	rebuild();
}

function boards() {
	var a = arrayfromargs(arguments);
	for (var i = 0; i < 8; i++) {
		var b = Math.round(a[i] || 0);
		slots[i] = (b >= 1 && b <= BOARDS.length) ? b : 0;
	}
	rebuild();
}

function msg_int(v) {
	if (inlet === 0) {
		current = v;
		if (items.indexOf(current) < 0) {
			rebuild();
		} else {
			show();
		}
		return;
	}
	var value = items[v];
	if (value !== undefined) {
		current = value;
		outlet(1, value);
	}
}

function msg_float(v) {
	msg_int(Math.round(v));
}

function pad2(n) {
	return (n < 10 ? "0" : "") + n;
}

function rebuild() {
	items = [0, 1];
	var labels = ["INT-A", "INT-B"];
	for (var s = 0; s < 8; s++) {
		if (slots[s] > 0 && items.indexOf(slots[s] + 1) < 0) {
			items.push(slots[s] + 1);
			labels.push("XP-" + SLOTS.charAt(s) + " " + BOARDS[slots[s] - 1]);
		}
	}
	if (items.indexOf(current) < 0 && current >= 2) {
		// the patch uses a board that isn't set up: keep it selectable instead of losing it
		items.push(current);
		labels.push("SR-" + pad2(current - 1) + " (not set up)");
	}
	outlet(0, ["_parameter_range"].concat(labels));
	show();
}

function show() {
	var i = items.indexOf(current);
	if (i >= 0) {
		outlet(0, "set", i);
	}
}
