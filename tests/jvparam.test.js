// Run: node tests/jvparam.test.js  (mocks the Max js globals, include() loads the real files)
const fs = require("fs"), vm = require("vm"), path = require("path"), assert = require("assert");
const dir = path.join(__dirname, "../device");

function sender(...args) {
	const out = [];
	const ctx = { inlet: 0, jsarguments: ["jvparam.js", ...args], outlet: (n, b) => out.push(b),
		setinletassist() {}, setoutletassist() {} };
	vm.createContext(ctx);
	ctx.include = f => vm.runInContext(fs.readFileSync(path.join(dir, f), "utf8"), ctx);
	vm.runInContext(fs.readFileSync(path.join(dir, "jvparam.js"), "utf8"), ctx);
	return { ctx, out, value(v) { ctx.inlet = 0; ctx.msg_int(v); }, tone(a3) { ctx.inlet = 1; ctx.msg_int(a3); },
		bang() { ctx.inlet = 0; ctx.bang(); }, take() { return out.splice(0); } };
}

// What the old sxformat senders sent: F0 41 10 6A 12 a1 a2 a3 a4 v sum F7
const old = (a, v) => [0xF0, 0x41, 0x10, 0x6A, 0x12, ...a, v, (128 - (a.reduce((x, y) => x + y, 0) + v) % 128) % 128, 0xF7];

// tone section sender: silent until the tone address is known
const cutoff = sender(3, 0, -1, 0x51);
cutoff.value(100);
assert.deepStrictEqual(cutoff.take(), [], "no tone address yet -> nothing sent (old sxformat sent to patch common)");
cutoff.tone(18);
assert.deepStrictEqual(cutoff.take(), [], "address alone doesn't send");
cutoff.bang();
assert.deepStrictEqual(cutoff.take(), old([3, 0, 18, 0x51], 100), "push resends the stored value");
cutoff.value(28);
assert.deepStrictEqual(cutoff.take(), old([3, 0, 18, 0x51], 28), "same bytes as the old sender (sum 128 -> checksum 0)");
cutoff.value(200);
assert.strictEqual(cutoff.take()[9], 127, "clamped to the parameter range");

// alternate pan: range starts at 1
const alt = sender(3, 0, -1, 0x7A);
alt.tone(16); alt.value(0);
assert.strictEqual(alt.take()[9], 1);

// wave number: nibble split, wave 103 -> value 102 -> 06 06
const wave = sender(3, 0, -1, 3);
wave.tone(16); wave.value(102);
assert.deepStrictEqual(wave.take(), [0xF0, 0x41, 0x10, 0x6A, 0x12, 3, 0, 16, 3, 6, 6, 0x5E, 0xF7]);

// fixed address in the main patch: Tone 3 level
const level = sender(3, 0, 20, 0x65);
level.value(80);
assert.deepStrictEqual(level.take(), old([3, 0, 20, 0x65], 80));

// system setting (not patch data): raw byte, not checked against the patch map
const efx = sender(0, 0, 0, 8);
efx.value(1);
assert.deepStrictEqual(efx.take(), old([0, 0, 0, 8], 1));

// floats from live.* objects are rounded
const res = sender(3, 0, 22, 0x53);
res.ctx.inlet = 0; res.ctx.msg_float(41.6);
assert.strictEqual(res.take()[9], 42);

console.log("jvparam: all tests passed");
