// Run: node tests/jvsysex.test.js
const fs = require("fs");
const path = require("path");
const assert = require("assert");
const JV = require("../device/jvsysex.js");
const P = JV.params;

const hex = s => s.trim().split(/\s+/).map(h => parseInt(h, 16));
const dump = fs.readFileSync(path.join(__dirname, "fixtures/jv2080_user_patch_dump.txt"), "utf8")
	.split("\n").filter(l => l && !l.startsWith("#")).map(hex);

// --- table sanity -------------------------------------------------------------------------------
for (const [block, size] of [["common", 0x4A], ["tone", 0x81], ["perf", 0x44], ["part", 0x1A]]) {
	const covered = [];
	for (const p of P[block]) {
		for (let i = 0; i < (p.bytes || 1); i++) covered.push(p.off + i);
		if (p.display && p.display.enum && p.id !== "category") {
			assert.strictEqual(P.enums[p.display.enum].length, p.max + 1, `${block}.${p.id} enum length`);
		}
	}
	assert.deepStrictEqual(covered, [...Array(size).keys()], `${block} covers every byte once`);
}

// --- addressing and checksum --------------------------------------------------------------------
assert.deepStrictEqual(JV.addOffset([3, 0, 0x10, 0], 0x80), [3, 0, 0x11, 0], "7-bit carry");
assert.strictEqual(JV.checksum([3, 0, 0x10, 0x51, 28]), 0, "sum of 128 gives checksum 0, not 128");

// RQ1 bytes match what the diagnostic monitor sent and the JV answered (#6)
assert.deepStrictEqual(JV.rq1(0x10, [3, 0, 0x10, 0], 0x81), hex("F0 41 10 6A 11 03 00 10 00 00 00 01 01 6B F7"));
assert.deepStrictEqual(JV.rq1(0x10, [3, 0, 0, 0], 0x4A), hex("F0 41 10 6A 11 03 00 00 00 00 00 00 4A 33 F7"));
assert.strictEqual(JV.requestPatch(0x10).length, 5);

// DT1 bytes match the device's existing sxformat senders
assert.deepStrictEqual(JV.setParam(0x10, "tone", 2, "cutoff", 100), hex("F0 41 10 6A 12 03 00 12 51 64 36 F7"));
assert.deepStrictEqual(JV.setParam(0x10, "tone", 1, "wave_number", 102), hex("F0 41 10 6A 12 03 00 10 03 06 06 5E F7"));
assert.deepStrictEqual(JV.setParam(0x10, "tone", 4, "reverb_send", 127).slice(5, 9), [3, 0, 0x17, 0], "tone offset 0x80 lands on a3+1");

// system settings are not patch data
assert.strictEqual(JV.locate([0, 0, 0, 8]), null, "System EFX switch is not patch common");
assert.deepStrictEqual(JV.locate([0x11, 0, 0x14, 0x51]), { patch: [0x11, 0], block: "tone", tone: 3, index: 0x51 });

// performances (p.189): temporary 01 00, USER 10 00-1F; common at a3 = 00, part p at a3 = 0F + p
assert.deepStrictEqual(JV.locate([1, 0, 0, 0x0D]), { perf: [1, 0], block: "perf", part: null, index: 0x0D });
assert.deepStrictEqual(JV.locate([0x10, 5, 0x1F, 4]), { perf: [0x10, 5], block: "part", part: 16, index: 4 });
assert.strictEqual(JV.locate([0x10, 0x40, 0, 0]), null, "user rhythm setup is not a performance");
assert.deepStrictEqual(JV.rq1(0x10, JV.perfAddress("part", 3), 0x1A).slice(5, 13), [1, 0, 0x12, 0, 0, 0, 0, 0x1A]);
assert.strictEqual(JV.requestPerformance(0x10).length, 17);
{
	const v = JV.decode(JV.parse(JV.dt1(0x10, [1, 0, 0x11, 0], [1, 2, 0, 3, 0, 4])));   // part 2: on, ch 3, PR-A 005
	const get = id => v.find(x => x.id === id);
	assert.deepStrictEqual([get("receive_switch").raw, get("midi_channel").raw, get("patch_group_id").raw, get("patch_number").raw, get("patch_number").part],
		[1, 2, 3, 4, 2]);
	assert.strictEqual(JV.display("part", "midi_channel", 2), 3);
}

// --- the real JV dump ---------------------------------------------------------------------------
const msgs = dump.map(JV.parse);
assert.ok(msgs.every(m => m && m.command === "DT1" && m.valid), "all fixture messages parse with valid checksums");
assert.deepStrictEqual(msgs.map(m => m.data.length), [74, 129, 129, 129, 129]);

const common = JV.decode(msgs[0]);
assert.strictEqual(common.length, P.common.length, "every common parameter decoded");
assert.strictEqual(JV.patchName(common), "2  0  8  1  ");
const tempo = common.find(v => v.id === "patch_tempo").raw;
assert.ok(tempo >= 20 && tempo <= 250, "patch tempo in range: " + tempo);

const tones = msgs.slice(1).map(JV.decode);
assert.deepStrictEqual(tones.map(t => t[0].tone), [1, 2, 3, 4]);
const val = (t, id) => tones[t - 1].find(v => v.id === id).raw;
const shown = (t, id) => JV.display("tone", id, val(t, id));
assert.strictEqual(shown(1, "wave_number"), 37);
assert.strictEqual(shown(1, "wave_group_type"), "INT");
assert.strictEqual(val(2, "wave_group_id"), 2, "tone 2 on INT-B");
assert.strictEqual(shown(3, "filter_type"), "LPF");
assert.strictEqual(val(3, "cutoff"), 70);
assert.strictEqual(shown(4, "coarse_tune"), -12);
for (let t = 1; t <= 4; t++) {
	assert.strictEqual(shown(t, "pitch_keyfollow"), "+100", "tone " + t + " keyfollow");
	assert.strictEqual(tones[t - 1].length, P.tone.length, "every tone parameter decoded");
	for (const v of tones[t - 1]) {
		const p = JV.find("tone", v.id);
		assert.ok(v.raw >= p.min && v.raw <= p.max, `tone ${t} ${v.id} = ${v.raw} outside ${p.min}..${p.max}`);
	}
}

// partial write: a single-parameter DT1 decodes to just that parameter
const one = JV.decode(JV.parse(JV.setParam(0x10, "tone", 3, "resonance", 42)));
assert.deepStrictEqual(one, [{ block: "tone", tone: 3, id: "resonance", raw: 42 }]);
assert.deepStrictEqual(JV.decode(JV.parse(JV.setParam(0x10, "tone", 1, "wave_number", 200))).map(v => v.raw), [200]);

// --- bindings: every traced control converts both ways -----------------------------------------
const B = require("../device/jv2080_bindings.js");
for (const b of B) {
	if (b.ops.length && b.ops[0][0] === "wave_group") continue;
	const p = JV.find(b.block, b.id);
	for (let v = b.range[0]; v <= b.range[1]; v++) {
		const raw = JV.fromControl(b, v);
		assert.ok(raw >= p.min && raw <= p.max, `${b.section} ${b.id}: control ${v} -> raw ${raw} outside ${p.min}..${p.max}`);
		assert.strictEqual(JV.fromControl(b, JV.toControl(b, raw)), raw, `${b.section} ${b.id}: raw ${raw} round trip`);
	}
}
// values decoded from the real dump land on valid control values
const coarse = B.find(b => b.id === "coarse_tune");
assert.strictEqual(JV.toControl(coarse, val(4, "coarse_tune")), -12);
const sens = B.find(b => b.id === "aenv_vel_sens");
assert.strictEqual(JV.toControl(sens, 50), 0, "raw 50 = sensitivity 0");
for (let i = 0; i <= 20; i++) {
	const g = JV.waveGroupFromMenu(i);
	assert.strictEqual(JV.waveGroupToMenu(g.type, g.id), i, "wave group menu " + i);
}
assert.strictEqual(JV.waveGroupToMenu(val(2, "wave_group_type"), val(2, "wave_group_id")), 1, "tone 2 = INT-B");

console.log("jvsysex: all tests passed");
