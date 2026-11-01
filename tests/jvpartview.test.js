// Run: node tests/jvpartview.test.js  (mocks the Max js globals and the Part page's controls)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const ui = {};
const patcher = { getnamed: v => ({ message: m => (ui[v] = ui[v] || []).push(Array.from(m)) }) };
let out = [];
const ctx = { messagename: '', inlet: 0, outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {},
	arrayfromargs: a => Array.from(a) };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvpartview.js'), 'utf8'), ctx);
ctx.jsthis.patcher = patcher;
const send = (name, ...args) => { out = []; ctx.inlet = 0; ctx.messagename = name; ctx.anything(...args); };

// before its part is known (at load) nothing happens
send('edit', 'Level', 10);
assert.deepStrictEqual(out, []);
// part 3 (address 0x12): asks for the strip's state
out = []; ctx.inlet = 1; ctx.msg_int(0x12);
assert.deepStrictEqual(out, [[0, 'refresh', 3]]);
// the copies' own values at load don't reach the strip before its state came in
send('edit', 'Level', 0);
assert.deepStrictEqual(out, []);
// only its own part's state is shown
send('part', 4, 'Level', 'set', 50);
assert.strictEqual(ui.ViewLevel, undefined);
send('part', 3, 'Level', 'set', 50);
send('part', 3, 'Name', 'set', 'Strobe Pad 1');
assert.deepStrictEqual(ui.ViewLevel, [['set', 50]]);
assert.deepStrictEqual(ui.ViewName, [['set', 'Strobe Pad 1']]);
// an edit goes to jvparts.js with the part number
send('edit', 'Level', 64);
assert.deepStrictEqual(out, [[0, 'edit', 3, 'Level', 64]]);
console.log('jvpartview: all tests passed');
