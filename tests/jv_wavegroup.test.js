// Run: node tests/jv_wavegroup.test.js  (mocks the Max js globals)
const fs = require('fs'), vm = require('vm'), assert = require('assert');
let out = [];
const ctx = { inlet: 0, outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {},
  arrayfromargs: a => Array.from(a) };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(require('path').join(__dirname, '../device/jv_wavegroup.js'), 'utf8'), ctx);
const menu = () => out.filter(o => o[0] === 0 && o[1] === 'append').map(o => o[2]);
const sel = () => out.filter(o => o[0] === 0 && o[1] === 'set').map(o => o[2]).pop();
const param = () => out.filter(o => o[0] === 1).map(o => o[1]).pop();

ctx.loadbang();
assert.deepStrictEqual(menu(), ['INT-A', 'INT-B']);

out = []; ctx.boards(11, 0, 0, 0, 0, 0, 0, 0);            // Techno in slot A
assert.deepStrictEqual(menu(), ['INT-A', 'INT-B', 'XP-A Techno']);

out = []; ctx.inlet = 1; ctx.msg_int(2);                    // user picks XP-A Techno
assert.strictEqual(param(), 12, 'SR-11 is wave group value 12');

out = []; ctx.inlet = 0; ctx.msg_int(12);                   // parameter echoes back -> display only
assert.strictEqual(sel(), 2); assert.strictEqual(param(), undefined);

out = []; ctx.msg_int(4);                                   // set restores SR-03 (Piano), not set up
assert.deepStrictEqual(menu(), ['INT-A', 'INT-B', 'XP-A Techno', 'SR-03 (not set up)']); assert.strictEqual(sel(), 3);

out = []; ctx.boards(11, 0, 3, 0, 0, 0, 0, 0);            // Piano added in slot C
assert.deepStrictEqual(menu(), ['INT-A', 'INT-B', 'XP-A Techno', 'XP-C Piano']); assert.strictEqual(sel(), 3);

out = []; ctx.msg_int(1);
assert.strictEqual(sel(), 1);
console.log('jv_wavegroup: all tests passed');
