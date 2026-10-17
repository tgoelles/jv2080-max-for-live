// Bank select for the program block: the stored Bank parameter, the short visible bank menu, and the
// bank-select messages to the JV.
//
// The stored Bank parameter is a hidden live.menu with a fixed list (index = position in BANKS below), so
// saved sets keep their meaning. The visible menu is a Hidden live.menu whose list is rebuilt from the
// expansion boards set up on the Setup page: the fixed banks plus "XP-A1"/"XP-A2" (patches 1-128 /
// 129-255) for every slot that has a board.
//
// inlet 0: bank index (0-22) from the stored menu -> send bank select, then bang the program number;
//          "boards a b c d e f g h" (board number per slot, 0 = empty);
//          "msb n" / "lsb n": bank select received from the JV (Follow JV patch changes)
// inlet 1: index chosen in the visible menu
// outlet 0: commands for the visible menu (_parameter_range / set)
// outlet 1: bank index for the stored menu (plain = user choice, "set n" = silently follow the JV)
// outlet 2: MIDI bytes (bank select CC 0 and CC 32 on channel 1) for midiout
// outlet 3: bang -> program number, so the program change follows the bank select

autowatch = 1;
inlets = 2;
outlets = 4;
setinletassist(0, "bank index 0-22, boards, msb/lsb from the JV");
setinletassist(1, "visible menu index");
setoutletassist(0, "to visible menu");
setoutletassist(1, "to stored Bank menu");
setoutletassist(2, "MIDI bytes");
setoutletassist(3, "bang: resend program change");

// Bank select MSB/LSB per bank (manual p.184)
var BANKS = [["USER", 80, 0], ["PR-A", 81, 0], ["PR-B", 81, 1], ["PR-C", 81, 2], ["PR-GM", 81, 3], ["PR-E", 81, 4], ["CARD", 82, 0]];
var SLOTS = "ABCDEFGH";
var FIXED = BANKS.length;
for (var s = 0; s < 8; s++) {
	BANKS.push(["XP-" + SLOTS.charAt(s) + "1", 84, 2 * s]);
	BANKS.push(["XP-" + SLOTS.charAt(s) + "2", 84, 2 * s + 1]);
}

var slots = [0, 0, 0, 0, 0, 0, 0, 0];
var current = 0;
var items = [];      // bank index for each visible menu entry
var msbIn = null;

function loadbang() {
	rebuild();
}

function msg_int(v) {
	if (inlet === 1) {
		if (items[v] !== undefined) {
			outlet(1, items[v]);   // the stored menu outputs it back to inlet 0, which sends
		}
		return;
	}
	if (v < 0 || v >= BANKS.length) {
		return;
	}
	current = v;
	if (items.indexOf(current) < 0) {
		rebuild();
	} else {
		show();
	}
	var b = BANKS[current];
	var bytes = [0xB0, 0, b[1], 0xB0, 32, b[2]];
	for (var i = 0; i < bytes.length; i++) {
		outlet(2, bytes[i]);
	}
	outlet(3, "bang");
}

function msg_float(v) {
	msg_int(Math.round(v));
}

function boards() {
	var a = arrayfromargs(arguments);
	for (var i = 0; i < 8; i++) {
		var n = Math.round(a[i] || 0);
		slots[i] = n >= 1 && n <= 19 ? n : 0;
	}
	rebuild();
}

function msb(v) {
	msbIn = v;
}

// The JV sends CC 0 then CC 32 before its program change: follow silently, without sending anything back
function lsb(v) {
	if (msbIn === null) {
		return;
	}
	for (var i = 0; i < BANKS.length; i++) {
		if (BANKS[i][1] === msbIn && BANKS[i][2] === v) {
			if (i !== current) {
				current = i;
				outlet(1, "set", i);
				if (items.indexOf(current) < 0) {
					rebuild();
				} else {
					show();
				}
			}
			return;
		}
	}
}

function rebuild() {
	items = [];
	var labels = [];
	for (var i = 0; i < BANKS.length; i++) {
		var slot = i >= FIXED ? Math.floor((i - FIXED) / 2) : -1;
		if (i < FIXED || slots[slot] > 0 || i === current) {
			items.push(i);
			labels.push(BANKS[i][0] + (slot >= 0 && slots[slot] === 0 ? " (not set up)" : ""));
		}
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
