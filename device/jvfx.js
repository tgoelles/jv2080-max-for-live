// EFX page helper (one instance, in JV_FX.maxpat): labels the 12 EFX parameter dials for the selected EFX type,
// converts between dial (0-127, the stored Live parameter) and the JV's raw value, shows the value under each
// dial, and names the type for the routing graphic. The table is jv2080_efx.js.
//
// inlet 0: int EFX type 0-39 (from the EFX Type menu); "dial <0-11> <value>" from the parameter dials
// outlets 0-11:  to dial n: "_parameter_shortname <label>", "active 0/1"
// outlets 12-23: to the value comment under dial n: "set <text>"
// outlets 24-35: raw value for EFX Parameter n's sender (js jvparam.js 3 0 0 13+n)
// outlet 36:     "efxname <name>" for the routing graphic

autowatch = 1;
inlets = 1;
outlets = 37;
setinletassist(0, "EFX type 0-39; dial n value");
setoutletassist(36, "efxname for the routing graphic");
include("jv2080_efx.js");

var type = -1;
var dials = [64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64];

function msg_int(t) {
	if (t < 0 || t >= JV2080_EFX.TYPES.length) {
		return;
	}
	type = t;
	var names = JV2080_EFX.labels(t);
	for (var i = 0; i < 12; i++) {
		var used = names[i] !== "-";
		outlet(i, "_parameter_shortname", names[i]);
		outlet(i, "active", used ? 1 : 0);
		show(i);
		outlet(24 + i, JV2080_EFX.toRaw(type, i, dials[i]));   // the new type's parameters follow the dials
	}
	outlet(36, "efxname", (t + 1) + " " + JV2080_EFX.TYPES[t][0]);
}

function msg_float(t) {
	msg_int(Math.round(t));
}

function dial(i, v) {
	if (i < 0 || i > 11) {
		return;
	}
	dials[i] = Math.round(v);
	show(i);
	if (type >= 0) {
		outlet(24 + i, JV2080_EFX.toRaw(type, i, dials[i]));
	}
}

function show(i) {
	outlet(12 + i, "set", type < 0 ? "" : JV2080_EFX.format(type, i, JV2080_EFX.toRaw(type, i, dials[i])));
}
