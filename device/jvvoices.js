// Voice reserve on the Parts page (one instance): all 16 parts together can reserve at most 64 voices. The JV accepts
// more without complaint (its display shows the rest), so the device keeps the total at 64: when a change pushes it
// over, the part changed last is lowered to what is left. Values from the JV (Get, panel edits) arrive one by one, so
// the check waits until a burst is over: a read never leaves more than 64, and isn't changed.
//
// inlet 0: "voice <part> <0-64>" from each part's voice reserve control
// The voices left ("rest", like the JV's display) are shown in the hint and Info View text of every voice reserve
// control: P<n>Voices here and the Part pages' copies (PartEdit_<n> ViewVoices).
// outlet 0: "rest <n>": voices not reserved (s ---voicesrest; nothing listens at the moment)

autowatch = 1;
inlets = 1;
outlets = 1;
setinletassist(0, "voice part n");
setoutletassist(0, "rest n");

var MAX = 64;
var jsthis = this;
var voices = [];
for (var i = 0; i < 16; i++) {
	voices.push(0);
}
var last = -1;   // the part changed last
var task = new Task(check, this);

function voice(part, v) {
	part = Math.round(part) - 1;
	if (part < 0 || part > 15) {
		return;
	}
	voices[part] = Math.max(0, Math.round(v));
	last = part;
	task.schedule(50);
}

function total() {
	var t = 0;
	for (var i = 0; i < 16; i++) {
		t += voices[i];
	}
	return t;
}

function check() {
	var t = total();
	if (t > MAX && last >= 0) {
		var allowed = Math.max(0, voices[last] - (t - MAX));
		var ctl = jsthis.patcher.getnamed("P" + (last + 1) + "Voices");
		voices[last] = allowed;
		if (ctl) {
			ctl.message("int", allowed);   // sends the lowered value to the JV and reports back here
		}
		t = total();
	}
	outlet(0, "rest", MAX - t);
	describe(MAX - t);
}

var described = -1;
function describe(rest) {
	if (rest === described) {
		return;
	}
	described = rest;
	var text = "Voice reserve: voices kept free for this part. All 16 parts together at most " + MAX + "; " +
		rest + " not reserved now.";
	var top = jsthis.patcher.parentpatcher;
	for (var p = 1; p <= 16; p++) {
		var page = top ? top.getnamed("PartEdit_" + p) : null;
		var sub = page && page.subpatcher ? page.subpatcher() : null;
		var list = [jsthis.patcher.getnamed("P" + p + "Voices"), sub ? sub.getnamed("ViewVoices") : null];
		for (var k = 0; k < list.length; k++) {
			if (list[k]) {
				list[k].hint = text;
				list[k].message("annotation", text);   // Live's Info View
			}
		}
	}
}

function notifydeleted() {
	task.cancel();
	task.freepeer();
}
