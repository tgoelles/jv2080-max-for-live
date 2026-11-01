// Run: node tests/jvparts.test.js  (mocks the Max js globals and the page's controls)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const ui = {};   // varname -> list of messages received
const stored = {};
const top = { getnamed: v => ({ message: (...a) => { const m = Array.isArray(a[0]) ? a[0] : a; (ui['top:' + v] = ui['top:' + v] || []).push(m); } }) };
const patcher = { parentpatcher: top, getnamed: v => ({ message: (...a) => {
	const m = Array.isArray(a[0]) ? a[0] : a;
	(ui[v] = ui[v] || []).push(m);
	if (/^P\d+Bank$/.test(v) && m[0] === 'int') { stored[v] = m[1]; }
	if (m[0] === 'float') { stored[v] = m[1]; }
}, getvalueof: () => stored[v] !== undefined ? stored[v] : 0 }) };
let out = [];
const ctx = { messagename: '', outlet: (n, ...a) => out.push([n].concat(Array.isArray(a[0]) ? Array.from(a[0]) : a)), setinletassist() {}, setoutletassist() {},
	arrayfromargs: a => Array.from(a), patcher,
	// a names table as the importer would write it (placeholder names, not Roland's)
	include: () => vm.runInContext('var JV2080_PATCH_NAMES = { "PR-A": ["Name A1", "Name A2"], "SR-11": ["Board 11 First"] };', ctx) };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvparts.js'), 'utf8'), ctx);
const send = (name, ...args) => { out = []; ctx.messagename = name; ctx.anything(...args); };
const range = p => Array.from(ui['P' + p + 'BankView'].filter(m => m[0] === '_parameter_range').pop().slice(1));
const shown = p => ui['P' + p + 'BankView'].filter(m => m[0] === 'set').pop()[1];
const label = p => ui['P' + p + 'Name'].pop()[1];

// no boards: the JV-2080's own banks
ctx.loadbang();
assert.deepStrictEqual(range(1), ['USER', 'PR-A', 'PR-B', 'PR-C', 'PR-GM', 'PR-E', 'CARD']);
// boards from the Setup page: SR-JV80-11 in slot A, 02 in slot C
send('boards', 11, 0, 2, 0, 0, 0, 0, 0);
assert.deepStrictEqual(range(16), ['USER', 'PR-A', 'PR-B', 'PR-C', 'PR-GM', 'PR-E', 'CARD', 'XP-A', 'XP-C']);
// a part on board 11 (stored value 7 + 11 - 1 = 17) shows "XP-A"; picking "XP-C" stores board 2 (value 8)
send('bank', 3, 17);
assert.strictEqual(shown(3), 7);
send('pick', 3, 8);
assert.strictEqual(stored.P3Bank, 8, 'the stored menu gets the full-list value');
// names: presets and boards from the table
send('bank', 2, 1); send('patch', 2, 2);
assert.strictEqual(label(2), 'Name A2');
send('bank', 4, 17); send('patch', 4, 1);
assert.strictEqual(label(4), 'Board 11 First');
send('patch', 4, 200);
assert.strictEqual(label(4), '', 'no name known: empty');
// USER patches: asked from the JV, shown when the answer comes
send('bank', 5, 0); send('patch', 5, 12);
assert.deepStrictEqual(JSON.parse(JSON.stringify(out.filter(o => o[0] === 0))), [[0, 'askname', 12]]);
send('username', 12, 'My', 'Pad');
assert.strictEqual(label(5), 'My Pad');
// a board that isn't set up stays selectable, marked
send('boards', 0, 0, 0, 0, 0, 0, 0, 0);
assert.deepStrictEqual(range(4), ['USER', 'PR-A', 'PR-B', 'PR-C', 'PR-GM', 'PR-E', 'CARD', 'SR-11 (n/a)']);
// JV-1080: no PR-E, GM bank is PR-D, slots A-D only
send('model', 1);
assert.deepStrictEqual(range(1), ['USER', 'PR-A', 'PR-B', 'PR-C', 'PR-D', 'CARD']);

// the Part page's copies: a strip control's output is passed on, bank list, bank and name too
const mirrored = p => out.filter(o => o[0] === 1 && o[2] === p).map(o => Array.from(o.slice(3)));
send('show', 6, 'Level', 90);
assert.deepStrictEqual(mirrored(6), [['Level', 'set', 90]]);
send('model', 0);
send('bank', 2, 1); send('patch', 2, 1);
assert.deepStrictEqual(mirrored(2).pop(), ['Name', 'set', 'Name A1']);
// an edit on the Part page moves the strip's control (which sends it and reports back with "show")
send('edit', 6, 'Pan', -10);
assert.strictEqual(stored.P6Pan, -10);
send('edit', 6, 'BankView', 1);
assert.strictEqual(stored.P6Bank, 1, 'picking on the Part page stores the full-list value');
send('edit', 6, 'Name', 'x');
assert.strictEqual(stored.P6Name, undefined, 'only the copied controls');
// the Part page asks for everything once it knows its part
stored.P7Channel = 3;
send('refresh', 7);
const r = mirrored(7);
assert.deepStrictEqual(r.find(m => m[0] === 'Channel'), ['Channel', 'set', 3]);
assert.strictEqual(r.find(m => m[0] === 'BankView' && m[1] === '_parameter_range')[2], 'USER');
assert.ok(r.find(m => m[0] === 'BankView' && m[1] === 'set'));
assert.ok(r.find(m => m[0] === 'Name'));
// the device's part buttons: a part switched off is drawn faint
send('show', 9, 'On', 0);
assert.deepStrictEqual(Array.from(ui['top:PartSel9'].find(m => m[0] === 'textcolor')), ['textcolor', 0.45, 0.45, 0.45, 0.6]);
send('show', 9, 'On', 1);
assert.strictEqual(ui['top:PartSel9'].filter(m => m[0] === 'textcolor').pop()[4], 1.0);
console.log('jvparts: all tests passed');
