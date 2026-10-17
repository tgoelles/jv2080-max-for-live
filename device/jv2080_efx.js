// The 40 EFX types: parameter labels and value formats for EFX Parameter 1-12 (owner's manual pp.168-172;
// the list order is the parameter order). Shared by jvfx.js (labels, display, dial <-> raw) and jvreceive.js
// (raw -> dial for Get), and the Node tests.
//
// The JV sends each parameter as an index into its value list, e.g. Low Gain -15..+15 dB = 0..30 and
// Low Freq 200/400 Hz = 0/1 (measured on a JV-2080). Kinds whose step sizes the manual doesn't give
// (Hz rates, ms times, %, degrees, balance) are "raw" for now: 0-127 shown as is, until measured.

var JV2080_EFX = (function () {
	var FREQ = ["200", "250", "315", "400", "500", "630", "800", "1000", "1250", "1600", "2000", "2500", "3150", "4000", "5000", "6300", "8000"];
	var KINDS = {
		lvl: { max: 127 },                                         // 0-127
		db: { max: 30, add: -15, unit: " dB", sign: true },        // -15..+15 dB
		pan: { max: 127, pan: true },                              // L64..0..63R
		lowf: { list: ["200 Hz", "400 Hz"] },
		highf: { list: ["4000 Hz", "8000 Hz"] },
		freq: { list: FREQ, unit: " Hz" },
		hf: { list: FREQ.concat(["BYPASS"]), unit: " Hz" },
		q: { list: ["0.5", "1.0", "2.0", "4.0", "8.0"] },
		amp: { list: ["SMALL", "BUILT-IN", "2-STACK", "3-STACK"] },
		speed: { list: ["SLOW", "FAST"] },
		wah: { list: ["LPF", "BPF"] },
		filt: { list: ["OFF", "LPF", "HPF"] },
		inv: { list: ["NORMAL", "INVERT"] },
		fbmode: { list: ["NORMAL", "CROSS"] },
		post: { list: ["0 dB", "+6 dB", "+12 dB", "+18 dB"] },
		ratio: { list: ["1.5:1", "2:1", "4:1", "100:1"] },
		mode: { list: ["1", "2", "3", "4", "5"] },
		revtype: { list: ["ROOM1", "ROOM2", "STAGE1", "STAGE2", "HALL1", "HALL2"] },
		gatetype: { list: ["NORMAL", "REVERSE", "SWEEP1", "SWEEP2"] },
		accel: { max: 15 },                                        // 0-15
		dev: { max: 20 },                                          // 0-20
		dev2: { max: 40, add: -20, sign: true },                   // -20..+20
		coarse: { max: 36, add: -24, unit: " st", sign: true },    // -24..+12 semitones
		raw: { max: 127, raw: true }                               // step size not documented yet
	};
	function p(label, kind) {
		return [label, kind];
	}
	var R = "raw";
	var OD = [p("Drive", "lvl"), p("Amp Type", "amp"), p("Low Gain", "db"), p("High Gain", "db"), p("Pan", "pan"), p("Level", "lvl")];
	var CHO_DLY = [p("Cho PreDly", R), p("Cho Rate", R), p("Cho Depth", "lvl"), p("Cho Bal", R), p("Dly Time", R), p("Dly Fbk", R),
		p("Dly HF", "hf"), p("Dly Bal", R), p("Level", "lvl")];
	var FL_DLY = [p("Fl PreDly", R), p("Fl Rate", R), p("Fl Depth", "lvl"), p("Fl Fbk", R), p("Fl Bal", R), p("Dly Time", R),
		p("Dly Fbk", R), p("Dly HF", "hf"), p("Dly Bal", R), p("Level", "lvl")];
	var CHO_FL = [p("Cho PreDly", R), p("Cho Rate", R), p("Cho Depth", "lvl"), p("Cho Bal", R), p("Fl PreDly", R), p("Fl Rate", R),
		p("Fl Depth", "lvl"), p("Fl Fbk", R), p("Fl Bal", R), p("Level", "lvl")];
	function drive(a) {
		return [p(a + " Drive", "lvl"), p(a + " Pan", "pan")];
	}
	function enh() {
		return [p("Enh Sens", "lvl"), p("Enh Mix", "lvl")];
	}
	var CHO = [p("Cho PreDly", R), p("Cho Rate", R), p("Cho Depth", "lvl"), p("Cho Bal", R), p("Level", "lvl")];
	var FL = [p("Fl PreDly", R), p("Fl Rate", R), p("Fl Depth", "lvl"), p("Fl Fbk", R), p("Fl Bal", R), p("Level", "lvl")];
	var DLY = [p("Dly Time", R), p("Dly Fbk", R), p("Dly HF", "hf"), p("Dly Bal", R), p("Level", "lvl")];
	var GAINS = [p("Low Gain", "db"), p("High Gain", "db")];
	var BAL_LVL = [p("Balance", R), p("Level", "lvl")];

	var TYPES = [
		["STEREO-EQ", [p("Low Freq", "lowf"), p("Low Gain", "db"), p("P1 Freq", "freq"), p("P1 Gain", "db"), p("P1 Q", "q"),
			p("High Freq", "highf"), p("High Gain", "db"), p("P2 Freq", "freq"), p("P2 Gain", "db"), p("P2 Q", "q"), p("Level", "lvl")]],
		["OVERDRIVE", OD],
		["DISTORTION", OD],
		["PHASER", [p("Manual", R), p("Rate", R), p("Depth", "lvl"), p("Resonance", "lvl"), p("Mix", "lvl"), p("Pan", "pan"), p("Level", "lvl")]],
		["SPECTRUM", [p("Band 1", "db"), p("Band 2", "db"), p("Band 3", "db"), p("Band 4", "db"), p("Band 5", "db"), p("Band 6", "db"),
			p("Band 7", "db"), p("Band 8", "db"), p("Q", "q"), p("Pan", "pan"), p("Level", "lvl")]],
		["ENHANCER", [p("Sens", "lvl"), p("Mix", "lvl")].concat(GAINS, [p("Level", "lvl")])],
		["AUTO-WAH", [p("Filter", "wah"), p("Sens", "lvl"), p("Manual", "lvl"), p("Peak", "lvl"), p("Rate", R), p("Depth", "lvl"), p("Level", "lvl")]],
		["ROTARY", [p("Lo Slow", R), p("Lo Fast", R), p("Lo Accel", "accel"), p("Lo Level", "lvl"), p("Speed", "speed"), p("Hi Slow", R),
			p("Hi Fast", R), p("Hi Accel", "accel"), p("Hi Level", "lvl"), p("Separation", "lvl"), p("Level", "lvl")]],
		["COMPRESSOR", [p("Attack", "lvl"), p("Sustain", "lvl"), p("Post Gain", "post")].concat(GAINS, [p("Pan", "pan"), p("Level", "lvl")])],
		["LIMITER", [p("Threshold", "lvl"), p("Ratio", "ratio"), p("Release", "lvl"), p("Post Gain", "post")].concat(GAINS,
			[p("Pan", "pan"), p("Level", "lvl")])],
		["HEXA-CHORUS", [p("Pre Delay", R), p("Rate", R), p("Depth", "lvl"), p("PreDly Dev", "dev"), p("Depth Dev", "dev2"),
			p("Pan Dev", "dev")].concat(BAL_LVL)],
		["TREMOLO-CHORUS", [p("Pre Delay", R), p("Cho Rate", R), p("Cho Depth", "lvl"), p("Trem Phase", R), p("Trem Rate", R),
			p("Trem Sep", "lvl")].concat(BAL_LVL)],
		["SPACE-D", [p("Pre Delay", R), p("Rate", R), p("Depth", "lvl"), p("Phase", R)].concat(GAINS, BAL_LVL)],
		["STEREO-CHORUS", [p("Pre Delay", R), p("Rate", R), p("Depth", "lvl"), p("Phase", R), p("Filter", "filt"), p("Cutoff", "freq")]
			.concat(GAINS, BAL_LVL)],
		["STEREO-FLANGER", [p("Pre Delay", R), p("Rate", R), p("Depth", "lvl"), p("Feedback", R), p("Phase", R), p("Filter", "filt"),
			p("Cutoff", "freq")].concat(GAINS, BAL_LVL)],
		["STEP-FLANGER", [p("Pre Delay", R), p("Rate", R), p("Depth", "lvl"), p("Feedback", R), p("Phase", R), p("Step Rate", R)]
			.concat(GAINS, BAL_LVL)],
		["STEREO-DELAY", [p("Delay L", R), p("Delay R", R), p("Phase L", "inv"), p("Phase R", "inv"), p("Feedback", R),
			p("Fbk Mode", "fbmode"), p("HF Damp", "hf")].concat(GAINS, BAL_LVL)],
		["MODULATION-DELAY", [p("Delay L", R), p("Delay R", R), p("Feedback", R), p("Fbk Mode", "fbmode"), p("Rate", R),
			p("Depth", "lvl"), p("Phase", R), p("HF Damp", "hf")].concat(GAINS, BAL_LVL)],
		["TRIPLE-TAP-DELAY", [p("Delay C", R), p("Delay L", R), p("Delay R", R), p("Level C", "lvl"), p("Level L", "lvl"),
			p("Level R", "lvl"), p("Feedback", R), p("HF Damp", "hf")].concat(GAINS, BAL_LVL)],
		["QUADRUPLE-TAP-DELAY", [p("Delay 1", R), p("Delay 2", R), p("Delay 3", R), p("Delay 4", R), p("Feedback", R), p("HF Damp", "hf"),
			p("Level 1", "lvl"), p("Level 2", "lvl"), p("Level 3", "lvl"), p("Level 4", "lvl")].concat(BAL_LVL)],
		["TIME-CONTROL-DELAY", [p("Delay", R), p("Accel", "accel"), p("Feedback", R), p("HF Damp", "hf"), p("Pan", "pan")]
			.concat(GAINS, BAL_LVL)],
		["2VOICE-PITCH-SHIFTER", [p("Coarse A", "coarse"), p("Fine A", R), p("Pan A", "pan"), p("PreDly A", R), p("Lvl Bal", R),
			p("Mode", "mode"), p("Coarse B", "coarse"), p("Fine B", R), p("Pan B", "pan"), p("PreDly B", R)].concat(BAL_LVL)],
		["FBK-PITCH-SHIFTER", [p("Coarse", "coarse"), p("Fine", R), p("Pan", "pan"), p("Pre Delay", R), p("Mode", "mode"),
			p("Feedback", R)].concat(GAINS, BAL_LVL)],
		["REVERB", [p("Type", "revtype"), p("Pre Delay", R), p("Time", "lvl"), p("HF Damp", "hf")].concat(GAINS, BAL_LVL)],
		["GATE-REVERB", [p("Type", "gatetype"), p("Pre Delay", R), p("Gate Time", R)].concat(GAINS, BAL_LVL)],
		["OVERDRIVE>CHORUS", drive("OD").concat(CHO)],
		["OVERDRIVE>FLANGER", drive("OD").concat(FL)],
		["OVERDRIVE>DELAY", drive("OD").concat(DLY)],
		["DISTORTION>CHORUS", drive("Dist").concat(CHO)],
		["DISTORTION>FLANGER", drive("Dist").concat(FL)],
		["DISTORTION>DELAY", drive("Dist").concat(DLY)],
		["ENHANCER>CHORUS", enh().concat(CHO)],
		["ENHANCER>FLANGER", enh().concat(FL)],
		["ENHANCER>DELAY", enh().concat(DLY)],
		["CHORUS>DELAY", CHO_DLY],
		["FLANGER>DELAY", FL_DLY],
		["CHORUS>FLANGER", CHO_FL],
		["CHORUS/DELAY", CHO_DLY],
		["FLANGER/DELAY", FL_DLY],
		["CHORUS/FLANGER", CHO_FL]
	];

	function kind(type, slot) {
		var t = TYPES[type];
		var ps = t ? t[1] : null;
		return ps && slot < ps.length ? KINDS[ps[slot][1]] : null;
	}

	// highest raw value of a parameter (127 for unused slots)
	function maxRaw(type, slot) {
		var k = kind(type, slot);
		return !k ? 127 : (k.list ? k.list.length - 1 : k.max);
	}

	// dial 0-127 <-> raw: the dial's whole travel covers the parameter's values
	function toRaw(type, slot, dial) {
		var m = maxRaw(type, slot);
		return Math.max(0, Math.min(m, Math.round(dial * m / 127)));
	}

	function toDial(type, slot, raw) {
		var m = maxRaw(type, slot);
		return Math.max(0, Math.min(127, Math.round(Math.min(raw, m) * 127 / m)));
	}

	function format(type, slot, raw) {
		var k = kind(type, slot);
		if (!k) {
			return "";
		}
		if (k.list) {
			var s = k.list[Math.min(raw, k.list.length - 1)];
			return k.unit && /^\d/.test(s) ? s + k.unit : s;
		}
		if (k.pan) {
			return raw < 64 ? "L" + (64 - raw) : (raw === 64 ? "0" : (raw - 64) + "R");
		}
		if (k.raw) {
			return "(" + raw + ")";
		}
		var v = raw + (k.add || 0);
		return (k.sign && v > 0 ? "+" : "") + v + (k.unit || "");
	}

	return { TYPES: TYPES, KINDS: KINDS, maxRaw: maxRaw, toRaw: toRaw, toDial: toDial, format: format };
})();

if (typeof module !== "undefined") {
	module.exports = JV2080_EFX;
}
