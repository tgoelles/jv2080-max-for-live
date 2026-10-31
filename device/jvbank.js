// Bank select for the program block: the stored Bank parameter, the short visible bank menu, and the
// bank-select messages to the JV.
//
// The stored Bank parameter is a hidden live.menu with a fixed list (index = position in BANKS below), so
// saved sets keep their meaning. The visible menu is a Hidden live.menu whose list is rebuilt from the
// expansion boards set up on the Setup page: the fixed banks plus "XP-A1"/"XP-A2" (patches 1-128 /
// 129-255) for every slot that has a board.
//
// inlet 0: bank index (0-23) from the stored menu -> send bank select, then bang the program number;
//          "boards a b c d e f g h" (board number per slot, 0 = empty);
//          "msb n" / "lsb n": bank select received as MIDI (e.g. from a JV-1080);
//          "jvpatch type id number": the JV-2080 reports a patch picked on its panel (System Common 02-05);
//          "follow 0/1": follow patches picked on the JV (Setup -> Follow JV patch changes);
//          "model 0/1/2": JV-2080, JV-1080, XP-50/80 decides which banks exist
// inlet 1: index chosen in the visible menu
// outlet 0: commands for the visible menu (_parameter_range / set)
// outlet 1: bank index for the stored menu (plain = user choice, "set n" = silently follow the JV)
// outlet 2: MIDI bytes (bank select CC 0 and CC 32 on channel 1) for midiout
// outlet 3: bang -> program number, so the program change follows the bank select
// outlet 4: "set n" for the program number (follow the JV silently)
// outlet 5: bang when following the JV, to read the newly selected patch (s ---bangpgm)
//
// Perform mode ("mode 1"): the visible menu lists the performance banks (USER, PR-A, PR-B, CARD; p.184) and the
// performance number (1-32) replaces the program number. A performance is selected with System Common 01
// Performance Number (USER 0-31, CARD 32-63, PR-A 64-95, PR-B 96-127; p.188), so it doesn't depend on the JV's
// control channel. Bank select and program changes for patches are not sent in Perform mode.
// inlet 0 also takes: "mode 0/1"; "perfbank n" (stored Performance Bank menu); "perfnum n" (Performance Number);
//          "jvperf n" (the JV's System Common 01: follow silently); "perfselect" (send the selection again)
// outlet 6: bank index for the stored Performance Bank menu (plain = user choice, "set n" = follow the JV)
// outlet 7: "set n" for the Performance Number
// outlet 8: SysEx bytes (the performance select) for s ---sysex
// outlet 9: "script show/hide" for the program block's thispatcher (program number vs performance number)

autowatch = 1;
inlets = 2;
outlets = 10;
setinletassist(0, "bank index 0-23, boards, msb/lsb, jvpatch, follow, model");
setinletassist(1, "visible menu index");
setoutletassist(0, "to visible menu");
setoutletassist(1, "to stored Bank menu");
setoutletassist(2, "MIDI bytes");
setoutletassist(3, "bang: resend program change");
setoutletassist(4, "set program number");
setoutletassist(5, "bang: read the new patch");
setoutletassist(6, "to stored Performance Bank menu");
setoutletassist(7, "set performance number");
setoutletassist(8, "SysEx bytes: performance select");
setoutletassist(9, "script show/hide");

// Bank select MSB/LSB per bank (manual p.184)
var BANKS = [["USER", 80, 0], ["PR-A", 81, 0], ["PR-B", 81, 1], ["PR-C", 81, 2], ["PR-GM", 81, 3], ["PR-E", 81, 4], ["CARD", 82, 0]];
var SLOTS = "ABCDEFGH";
var FIXED = BANKS.length;
for (var s = 0; s < 8; s++) {
	BANKS.push(["XP-" + SLOTS.charAt(s) + "1", 84, 2 * s]);
	BANKS.push(["XP-" + SLOTS.charAt(s) + "2", 84, 2 * s + 1]);
}
BANKS.push(["PCM", 83, 0]);   // JV-1080 PCM card; appended so stored indices keep their meaning

// Which banks exist per model (#9): 0 JV-2080, 1 JV-1080, 2 XP-50/80
var MODEL_BANKS = [
	{ fixed: [0, 1, 2, 3, 4, 5, 6], slots: 8, gm: "PR-GM" },
	{ fixed: [0, 1, 2, 3, 4, 6, 23], slots: 4, gm: "PR-D" },
	{ fixed: [0, 1, 2, 3, 4], slots: 4, gm: "PR-D" }
];
var currentModel = 0;

var slots = [0, 0, 0, 0, 0, 0, 0, 0];
var current = 0;
var items = [];      // bank index for each visible menu entry
var msbIn = null;
var following = true;

// Performance banks (p.184) and their first value of System Common 01 Performance Number (p.188)
var PERF_BANKS = [["USER", 0], ["PR-A", 64], ["PR-B", 96], ["CARD", 32]];
var perform = false;
var perfBank = 0;
var perfNumber = 1;

// JV-2080 patch groups as reported in System Common (type 0 = USER & PRESET, id below; type 2 = EXP, id = board).
// Confirmed on hardware: 1 USER, 3 PR-A, 7 PR-E; 2 CARD and 4-6 PR-B/C/D(GM) by the JV's order.
var GROUP_TO_BANK = { 1: 0, 2: 6, 3: 1, 4: 2, 5: 3, 6: 4, 7: 5 };

function loadbang() {
	rebuild();
}

function msg_int(v) {
	if (inlet === 1) {
		if (perform) {
			if (v >= 0 && v < PERF_BANKS.length) {
				outlet(6, v);      // the stored Performance Bank menu outputs it back to "perfbank"
			}
		} else if (items[v] !== undefined) {
			outlet(1, items[v]);   // the stored menu outputs it back to inlet 0, which sends
		}
		return;
	}
	if (v < 0 || v >= BANKS.length) {
		return;
	}
	current = v;
	if (perform) {
		return;   // stored, but no bank select for patches in Perform mode
	}
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
	if (msbIn === null || perform) {
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

// "model 0/1/2" from the Setup page
function model(m) {
	currentModel = MODEL_BANKS[m] ? m : 0;
	rebuild();
}

function follow(on) {
	following = !!on;
}

// "mode 0/1" (Patch / Perform)
function mode(m) {
	var p = Math.round(m) === 1;
	if (p === perform) {
		return;
	}
	perform = p;
	outlet(9, "script", perform ? "hide" : "show", "ProgramChange[1]");
	outlet(9, "script", perform ? "show" : "hide", "PerfNumber");
	rebuild();
}

function perfbank(v) {
	v = Math.round(v);
	if (v < 0 || v >= PERF_BANKS.length) {
		return;
	}
	perfBank = v;
	if (perform) {
		show();
		perfselect();
	}
}

function perfnum(v) {
	perfNumber = Math.max(1, Math.min(32, Math.round(v)));
	if (perform) {
		perfselect();
	}
}

// select the device's performance on the JV: System Common 01 = Performance Number
function perfselect() {
	if (!perform) {
		return;
	}
	var body = [0, 0, 0, 1, PERF_BANKS[perfBank][1] + perfNumber - 1];
	var sum = 0;
	for (var i = 0; i < body.length; i++) {
		sum += body[i];
	}
	var bytes = [0xF0, 0x41, 0x10, 0x6A, 0x12].concat(body, [(128 - sum % 128) % 128, 0xF7]);
	for (i = 0; i < bytes.length; i++) {
		outlet(8, bytes[i]);
	}
}

// The JV reports its performance number (System Common 01): follow silently, then read it (in Perform mode)
function jvperf(n) {
	if (!following) {
		return;
	}
	n = Math.round(n);
	var bank = 0;
	for (var i = 0; i < PERF_BANKS.length; i++) {
		if (n >= PERF_BANKS[i][1] && n < PERF_BANKS[i][1] + 32) {
			bank = i;
		}
	}
	perfBank = bank;
	perfNumber = n - PERF_BANKS[bank][1] + 1;
	outlet(6, "set", perfBank);
	outlet(7, "set", perfNumber);
	if (perform) {
		show();
		outlet(5, "bang");
	}
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
		if (perform) {
			// shown again when back in Patch mode
		} else if (items.indexOf(current) < 0) {
			rebuild();
		} else {
			show();
		}
	}
	outlet(4, "set", (number % 128) + 1);
	if (!perform) {
		outlet(5, "bang");
	}
}

function rebuild() {
	if (perform) {
		var names = [];
		for (var p = 0; p < PERF_BANKS.length; p++) {
			names.push(PERF_BANKS[p][0]);
		}
		outlet(0, ["_parameter_range"].concat(names));
		show();
		return;
	}
	var m = MODEL_BANKS[currentModel];
	items = [];
	var labels = [];
	for (var i = 0; i < BANKS.length; i++) {
		var xp = i >= FIXED && i < FIXED + 16;
		var slot = xp ? Math.floor((i - FIXED) / 2) : -1;
		var available = xp ? (slot < m.slots && slots[slot] > 0) : m.fixed.indexOf(i) >= 0;
		if (available || i === current) {
			items.push(i);
			var label = i === 4 ? m.gm : BANKS[i][0];
			if (!available) {
				label += xp && slot < m.slots ? " (not set up)" : " (n/a)";
			}
			labels.push(label);
		}
	}
	outlet(0, ["_parameter_range"].concat(labels));
	show();
}

function show() {
	if (perform) {
		outlet(0, "set", perfBank);
		return;
	}
	var i = items.indexOf(current);
	if (i >= 0) {
		outlet(0, "set", i);
	}
}
