// Run: node tests/jvkeys.test.js  (the Keys page graphic's geometry and dragging, without mgraphics)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const out = [];
const ctx = { outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, box: { rect: [0, 0, 970, 140] } };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvkeys.js'), 'utf8'), ctx);
const L = ctx.layout(970, 140);
const x = k => L.left + k / 128 * L.keysW;
assert.strictEqual(ctx.note(60), 'C4', 'JV note names: 60 = C4');
// part 3 plays C2-B3 (36-59): grab its upper end, drag to C5 -> "P3KeyHi 72"
ctx.part(3, 'lo', 36); ctx.part(3, 'hi', 59);
const row3 = 2.5 * L.row;
assert.deepStrictEqual(JSON.parse(JSON.stringify(ctx.hit(x(60) - 1, row3, L))), { part: 2, field: 'hi' });
ctx.onclick(x(60) - 1, row3); ctx.ondrag(x(72) + 1, row3, 0);
assert.deepStrictEqual(out.pop(), [0, 'P3KeyHi', 72]);
// the lower end can't pass the upper one
ctx.onclick(x(36), row3); ctx.ondrag(x(100), row3, 0);
assert.deepStrictEqual(out.pop(), [0, 'P3KeyLo', 59]);
// the part number column and the octave labels are not draggable
assert.strictEqual(ctx.hit(5, row3, L), null);
assert.strictEqual(ctx.hit(x(60), 139, L), null);
console.log('jvkeys: all tests passed');
