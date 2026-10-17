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
//          "msb n" / "lsb n": bank select received as MIDI (e.g. from a JV-1080);
//          "jvpatch type id number": the JV-2080 reports a patch picked on its panel (System Common 02-05);
//          "follow 0/1": follow patches picked on the JV (Setup -> Follow JV patch changes)
// inlet 1: index chosen in the visible menu
// outlet 0: commands for the visible menu (_parameter_range / set)
// outlet 1: bank index for the stored menu (plain = user choice, "set n" = silently follow the JV)
// outlet 2: MIDI bytes (bank select CC 0 and CC 32 on channel 1) for midiout
// outlet 3: bang -> program number, so the program change follows the bank select
// outlet 4: "set n" for the program number (follow the JV silently)
// outlet 5: bang when following the JV, to read the newly selected patch (s ---bangpgm)

autowatch = 1;
inlets = 2;
outlets = 6;
setinletassist(0, "bank index 0-22, boards, msb/lsb from the JV");
setinletassist(1, "visible menu index");
setoutletassist(0, "to visible menu");
setoutletassist(1, "to stored Bank menu");
setoutletassist(2, "MIDI bytes");
setoutletassist(3, "bang: resend program change");
setoutletassist(4, "set program number");
setoutletassist(5, "bang: read the new patch");

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
var following = true;

// JV-2080 patch groups as reported in System Common (type 0 = USER & PRESET, id below; type 2 = EXP, id = board).
// Confirmed on hardware: 1 USER, 3 PR-A, 7 PR-E; 2 CARD and 4-6 PR-B/C/D(GM) by the JV's order.
var GROUP_TO_BANK = { 1: 0, 2: 6, 3: 1, 4: 2, 5: 3, 6: 4, 7: 5 };

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

function follow(on) {
	following = !!on;
}

// The JV-2080 sends this when a patch is picked on its panel. Follow silently (no program change back, the
// JV already has it), then ask for a read-back of the new patch.
function jvpatch(type, id, number) {
	if (!following) {
		return;
	}
	var bank = null;
	if (type === 0 && GROUP_TO_BANK[id] !== undefined) {
		bank = GROUP_TO_BANK[id];
	} else if (type === 2) {
		var slot = slots.indexOf(id);
		if (slot < 0) {
			post("jvbank: the JV switched to expansion board SR-" + (id < 10 ? "0" : "") + id + ", which isn't set up on the Setup page\n");
		} else {
			bank = FIXED + 2 * slot + (number >= 128 ? 1 : 0);
		}
	}
	if (bank !== null && bank !== current) {
		current = bank;
		outlet(1, "set", bank);
		if (items.indexOf(current) < 0) {
			rebuild();
		} else {
			show();
		}
	}
	outlet(4, "set", (number % 128) + 1);
	outlet(5, "bang");
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
