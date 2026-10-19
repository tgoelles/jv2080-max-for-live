// Run: node tests/jvpatch.test.js  (the Patch page's graphics: structure diagrams and zones; no mgraphics)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const load = (f, args = []) => {
	const out = [];
	const ctx = { outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {}, jsarguments: [f, ...args] };
	vm.createContext(ctx);
	vm.runInContext(fs.readFileSync(path.join(__dirname, '../device', f), 'utf8'), ctx);
	return [ctx, out];
};

// jvstruct.js: 10 types, every link between existing blocks, every block connected, one output (the last TVA)
const [s, out] = load('jvstruct.js', [2]);
const TYPES = vm.runInContext('TYPES', s);
assert.strictEqual(TYPES.length, 10);
TYPES.forEach((t, i) => {
	const n = t.blocks.length;
	t.links.forEach(([a, b]) => assert.ok(a < n && b < n && a !== b, `type ${i + 1}: link ${a}->${b}`));
	t.blocks.forEach((_, k) => assert.ok(t.links.some(l => l[0] === k || l[1] === k), `type ${i + 1}: block ${k} unconnected`));
	const ends = t.blocks.map((_, k) => k).filter(k => !t.links.some(l => l[0] === k));
	assert.ok(ends.every(k => /^TVA/.test(t.blocks[k][0])), `type ${i + 1}: every output is a TVA`);
	assert.strictEqual(t.blocks.filter(b => b[0] === 'B').length > 0, i === 2 || i === 3, `type ${i + 1}: booster only in 3 and 4`);
});
// the Booster menu is active only for Types 3 and 4; labels use the pair's tone numbers
for (let v = 0; v < 10; v++) {
	out.length = 0; s.type(v);
	assert.deepStrictEqual(out, [[0, 'active', v === 2 || v === 3 ? 1 : 0]]);
}
assert.strictEqual(s.label('WG1'), 'WG3'); assert.strictEqual(s.label('TVF2'), 'TVF4'); assert.strictEqual(s.label('B'), 'B');
out.length = 0; s.type(10); assert.deepStrictEqual(out, [], 'out of range ignored');

// jvzones.js: ranges as fractions of the width
const [z] = load('jvzones.js');
const spans = (...a) => JSON.parse(JSON.stringify(z.spans(...a)));
assert.deepStrictEqual(spans(0, 127, 0), [[0, 1]], 'full keyboard');
assert.deepStrictEqual(spans(60, 60, 0), [[60 / 128, 61 / 128]], 'one key');
assert.deepStrictEqual(spans(1, 127, 1), [[0, 1]], 'full velocity range');
assert.deepStrictEqual(spans(70, 60, 0), [], 'lower above upper: nothing');
z.tone(2, 'keylo', 48); z.velsw(1);
assert.strictEqual(vm.runInContext('tones[1].keylo + velOn', z), 49);
console.log('jvpatch: all tests passed');
