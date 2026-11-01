// The Part page's copies of a part's strip controls (JV_PARTEDIT, one instance per part): on/off, channel, bank,
// patch, name, level, pan and voice reserve, bigger than on the Parts page. The strip's controls stay the stored
// parameters; jvparts.js (Parts page) keeps these copies (Hidden parameters, varnames View<Var>) in step and moves
// the strip's control when a copy is edited.
//
// inlet 0: "part <n> <Var> <message...>" (r ---partmirror; only this page's part is applied to View<Var>),
//          "edit <Var> <v>" (a copy was edited)
// inlet 1: the part's address byte (0x10-0x1F); then this page asks for its part's state
// outlet 0: "edit <n> <Var> <v>", "refresh <n>" (s ---partedit -> jvparts.js)

autowatch = 1;
inlets = 2;
outlets = 1;
setinletassist(0, "part n Var message; edit Var v");
setinletassist(1, "part address byte");
setoutletassist(0, "edit n Var v; refresh n (to jvparts.js)");

var jsthis = this;
var part = 0;        // 1-16 once known
var ready = false;   // edits go out only once the strip's state came in (not the copies' values at load)

function msg_int(v) {
	if (inlet === 1 && v >= 0x10 && v <= 0x1F) {
		part = v - 0x0F;
		outlet(0, "refresh", part);
	}
}

function anything() {
	var a = arrayfromargs(arguments);
	if (!part) {
		return;
	}
	if (messagename === "part" && Math.round(a[0]) === part) {
		ready = true;
		var ctl = jsthis.patcher.getnamed("View" + a[1]);
		if (ctl) {
			ctl.message(a.slice(2));
		}
	} else if (messagename === "edit" && ready) {
		outlet(0, "edit", part, a[0], a[1]);
	}
}
