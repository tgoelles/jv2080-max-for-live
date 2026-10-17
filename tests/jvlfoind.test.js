// Run: node tests/jvlfoind.test.js  (no mgraphics: only the range logic is tested)
const fs = require('fs'), vm = require('vm'), assert = require('assert');
const load = args => {
	const ctx = { setinletassist() {}, jsarguments: ['jvlfoind.js', ...args] };
	vm.createContext(ctx);
	vm.runInContext(fs.readFileSync(require('path').join(__dirname, '../device/jvlfoind.js'), 'utf8'), ctx);
	return ctx;
};
const near = (a, b) => assert.ok(Math.abs(a[0] - b[0]) < 1e-9 && Math.abs(a[1] - b[1]) < 1e-9, `${a} vs ${b}`);

const cutoff = load([1, 0, 127]);                 // filter target, dial 0..127
cutoff.lfodepth(18, 1, 1, 63);                    // tone 2's depth arrives before our address
cutoff.addr(16);
assert.strictEqual(cutoff.range(), null, 'tone 1: not modulated');
cutoff.addr(18); cutoff.msg_int(63.5);
near(cutoff.range(), [0.25, 0.75]);                // full LFO1 depth: a quarter either side
cutoff.lfodepth(18, 1, 2, -63);                   // LFO2 full negative depth adds to the swing
near(cutoff.range(), [0, 1]);
cutoff.lfodepth(18, 0, 1, 0);                     // another target: ignored
near(cutoff.range(), [0, 1]);
cutoff.lfodepth(18, 1, 1, 0); cutoff.lfodepth(18, 1, 2, 0);
assert.strictEqual(cutoff.range(), null, 'depth 0: ring hidden');

const pan = load([3, -64, 63]);                   // pan dial -64..63, value at the left edge clips
pan.addr(22); pan.msg_int(-64); pan.lfodepth(22, 3, 1, 31);
const r = pan.range(); assert.strictEqual(r[0], 0); assert.ok(r[1] > 0.1 && r[1] < 0.15);
console.log('jvlfoind: all tests passed');
