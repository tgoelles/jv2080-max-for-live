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
// as on the JV (photos, corrected by the maintainer): R drawn filled in Types 6-10; Types 8 and 10 also send
// Tone 2 past the R block (WG2 -> TVF2, TVF2 -> TVA2)
assert.ok(TYPES[4].blocks.some(b => b[0] === 'R'), 'type 5: plain R');
[5, 6, 7, 8, 9].forEach(i => assert.ok(TYPES[i].blocks.some(b => b[0] === 'R+'), `type ${i + 1}: filled R`));
const t8 = TYPES[7], wg2 = t8.blocks.findIndex(b => b[0] === 'WG2'), tvf2 = t8.blocks.findIndex(b => b[0] === 'TVF2');
assert.ok(t8.links.some(l => l[0] === wg2 && l[1] === tvf2) && !TYPES[6].links.some(l => l[0] === wg2 && l[1] === tvf2), 'type 8 bypass');
const t10 = TYPES[9], f2 = t10.blocks.findIndex(b => b[0] === 'TVF2'), a2 = t10.blocks.findIndex(b => b[0] === 'TVA2');
assert.ok(t10.links.some(l => l[0] === f2 && l[1] === a2) && !TYPES[8].links.some(l => l[0] === f2 && l[1] === a2), 'type 10 bypass');
// the filters run TVF1 -> TVF2 when both are in one chain (Types 2-6)
[1, 2, 3, 4, 5].forEach(i => {
	const k1 = TYPES[i].blocks.findIndex(b => b[0] === 'TVF1'), k2 = TYPES[i].blocks.findIndex(b => b[0] === 'TVF2');
	assert.ok(TYPES[i].links.some(l => l[0] === k1) && k1 < k2, `type ${i + 1}: TVF1 before TVF2`);
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
// velocity bars: vertical, 127 at the top; full height when the velocity range switch is off
const vb = (...a) => JSON.parse(JSON.stringify(z.velBar(...a)));
z.velsw(1);
assert.deepStrictEqual(vb({ vello: 1, velhi: 127 }, 127), [0, 127], 'all velocities');
assert.deepStrictEqual(vb({ vello: 1, velhi: 64 }, 127), [63, 64], 'soft half at the bottom');
assert.deepStrictEqual(vb({ vello: 81, velhi: 127 }, 127), [0, 47], 'hard notes at the top');
assert.strictEqual(z.velBar({ vello: 90, velhi: 80 }, 127), null, 'empty range');
z.velsw(0);
assert.deepStrictEqual(vb({ vello: 100, velhi: 127 }, 127), [0, 127], 'switch off: full height');
console.log('jvpatch: all tests passed');
