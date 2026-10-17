// EFX page helper: labels the 12 EFX parameter dials for the selected EFX type and tells the routing graphic
// the type's name. One instance, in JV_FX.maxpat.
//
// inlet 0: int EFX type 0-39 (from the EFX Type menu)
// outlets 0-11: per dial: "_parameter_shortname <label>" and "active 0/1" (unused slots are greyed out)
// outlet 12: "efxname <name>" for the routing graphic
//
// Parameter order per type follows the EFX parameter list (owner's manual pp.168-172), which is the order of
// EFX Parameter 1-12 in the address map. Values are shown raw (0-127): the manual doesn't document how the
// raw values map to Hz, ms or dB.

autowatch = 1;
inlets = 1;
outlets = 13;
setinletassist(0, "EFX type 0-39");
setoutletassist(12, "efxname for the routing graphic");

var OD = ["Drive", "Amp Type", "Low Gain", "High Gain", "Pan", "Level"];
var CHO_DLY = ["Cho PreDly", "Cho Rate", "Cho Depth", "Cho Bal", "Dly Time", "Dly Fbk", "Dly HF", "Dly Bal", "Level"];
var FL_DLY = ["Fl PreDly", "Fl Rate", "Fl Depth", "Fl Fbk", "Fl Bal", "Dly Time", "Dly Fbk", "Dly HF", "Dly Bal", "Level"];
var CHO_FL = ["Cho PreDly", "Cho Rate", "Cho Depth", "Cho Bal", "Fl PreDly", "Fl Rate", "Fl Depth", "Fl Fbk", "Fl Bal", "Level"];

var TYPES = [
	["STEREO-EQ", ["Low Freq", "Low Gain", "P1 Freq", "P1 Gain", "P1 Q", "High Freq", "High Gain", "P2 Freq", "P2 Gain", "P2 Q", "Level"]],
	["OVERDRIVE", OD],
	["DISTORTION", OD],
	["PHASER", ["Manual", "Rate", "Depth", "Resonance", "Mix", "Pan", "Level"]],
	["SPECTRUM", ["Band 1", "Band 2", "Band 3", "Band 4", "Band 5", "Band 6", "Band 7", "Band 8", "Q", "Pan", "Level"]],
	["ENHANCER", ["Sens", "Mix", "Low Gain", "High Gain", "Level"]],
	["AUTO-WAH", ["Filter", "Sens", "Manual", "Peak", "Rate", "Depth", "Level"]],
	["ROTARY", ["Lo Slow", "Lo Fast", "Lo Accel", "Lo Level", "Speed", "Hi Slow", "Hi Fast", "Hi Accel", "Hi Level", "Separation", "Level"]],
	["COMPRESSOR", ["Attack", "Sustain", "Post Gain", "Low Gain", "High Gain", "Pan", "Level"]],
	["LIMITER", ["Threshold", "Ratio", "Release", "Post Gain", "Low Gain", "High Gain", "Pan", "Level"]],
	["HEXA-CHORUS", ["Pre Delay", "Rate", "Depth", "PreDly Dev", "Depth Dev", "Pan Dev", "Balance", "Level"]],
	["TREMOLO-CHORUS", ["Pre Delay", "Cho Rate", "Cho Depth", "Trem Phase", "Trem Rate", "Trem Sep", "Balance", "Level"]],
	["SPACE-D", ["Pre Delay", "Rate", "Depth", "Phase", "Low Gain", "High Gain", "Balance", "Level"]],
	["STEREO-CHORUS", ["Pre Delay", "Rate", "Depth", "Phase", "Filter", "Cutoff", "Low Gain", "High Gain", "Balance", "Level"]],
	["STEREO-FLANGER", ["Pre Delay", "Rate", "Depth", "Feedback", "Phase", "Filter", "Cutoff", "Low Gain", "High Gain", "Balance", "Level"]],
	["STEP-FLANGER", ["Pre Delay", "Rate", "Depth", "Feedback", "Phase", "Step Rate", "Low Gain", "High Gain", "Balance", "Level"]],
	["STEREO-DELAY", ["Delay L", "Delay R", "Phase L", "Phase R", "Feedback", "Fbk Mode", "HF Damp", "Low Gain", "High Gain", "Balance", "Level"]],
	["MODULATION-DELAY", ["Delay L", "Delay R", "Feedback", "Fbk Mode", "Rate", "Depth", "Phase", "HF Damp", "Low Gain", "High Gain", "Balance", "Level"]],
	["TRIPLE-TAP-DELAY", ["Delay C", "Delay L", "Delay R", "Level C", "Level L", "Level R", "Feedback", "HF Damp", "Low Gain", "High Gain", "Balance", "Level"]],
	["QUADRUPLE-TAP-DELAY", ["Delay 1", "Delay 2", "Delay 3", "Delay 4", "Feedback", "HF Damp", "Level 1", "Level 2", "Level 3", "Level 4", "Balance", "Level"]],
	["TIME-CONTROL-DELAY", ["Delay", "Accel", "Feedback", "HF Damp", "Pan", "Low Gain", "High Gain", "Balance", "Level"]],
	["2VOICE-PITCH-SHIFTER", ["Coarse A", "Fine A", "Pan A", "PreDly A", "Lvl Bal", "Mode", "Coarse B", "Fine B", "Pan B", "PreDly B", "Balance", "Level"]],
	["FBK-PITCH-SHIFTER", ["Coarse", "Fine", "Pan", "Pre Delay", "Mode", "Feedback", "Low Gain", "High Gain", "Balance", "Level"]],
	["REVERB", ["Type", "Pre Delay", "Time", "HF Damp", "Low Gain", "High Gain", "Balance", "Level"]],
	["GATE-REVERB", ["Type", "Pre Delay", "Gate Time", "Low Gain", "High Gain", "Balance", "Level"]],
	["OVERDRIVE>CHORUS", ["OD Drive", "OD Pan", "Cho PreDly", "Cho Rate", "Cho Depth", "Cho Bal", "Level"]],
	["OVERDRIVE>FLANGER", ["OD Drive", "OD Pan", "Fl PreDly", "Fl Rate", "Fl Depth", "Fl Fbk", "Fl Bal", "Level"]],
	["OVERDRIVE>DELAY", ["OD Drive", "OD Pan", "Dly Time", "Dly Fbk", "Dly HF", "Dly Bal", "Level"]],
	["DISTORTION>CHORUS", ["Dist Drive", "Dist Pan", "Cho PreDly", "Cho Rate", "Cho Depth", "Cho Bal", "Level"]],
	["DISTORTION>FLANGER", ["Dist Drive", "Dist Pan", "Fl PreDly", "Fl Rate", "Fl Depth", "Fl Fbk", "Fl Bal", "Level"]],
	["DISTORTION>DELAY", ["Dist Drive", "Dist Pan", "Dly Time", "Dly Fbk", "Dly HF", "Dly Bal", "Level"]],
	["ENHANCER>CHORUS", ["Enh Sens", "Enh Mix", "Cho PreDly", "Cho Rate", "Cho Depth", "Cho Bal", "Level"]],
	["ENHANCER>FLANGER", ["Enh Sens", "Enh Mix", "Fl PreDly", "Fl Rate", "Fl Depth", "Fl Fbk", "Fl Bal", "Level"]],
	["ENHANCER>DELAY", ["Enh Sens", "Enh Mix", "Dly Time", "Dly Fbk", "Dly HF", "Dly Bal", "Level"]],
	["CHORUS>DELAY", CHO_DLY],
	["FLANGER>DELAY", FL_DLY],
	["CHORUS>FLANGER", CHO_FL],
	["CHORUS/DELAY", CHO_DLY],
	["FLANGER/DELAY", FL_DLY],
	["CHORUS/FLANGER", CHO_FL]
];

var current = -1;

function msg_int(t) {
	if (t < 0 || t >= TYPES.length) {
		return;
	}
	current = t;
	var names = TYPES[t][1];
	for (var i = 0; i < 12; i++) {
		var used = i < names.length;
		outlet(i, "_parameter_shortname", used ? names[i] : "-");
		outlet(i, "active", used ? 1 : 0);
	}
	outlet(12, "efxname", (t + 1) + " " + TYPES[t][0]);
}

function msg_float(t) {
	msg_int(Math.round(t));
}

function bang() {
	if (current >= 0) {
		msg_int(current);
	}
}

if (typeof module !== "undefined") {
	module.exports = TYPES;
}
