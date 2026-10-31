// Run: node tests/jvparts.test.js  (mocks the Max js globals and the page's controls)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const ui = {};   // varname -> list of messages received
const stored = {};
const patcher = { getnamed: v => ({ message: (...a) => {
	const m = Array.isArray(a[0]) ? a[0] : a;
	(ui[v] = ui[v] || []).push(m);
	if (/^P\d+Bank$/.test(v) && m[0] === 'int') { stored[v] = m[1]; }
} }) };
let out = [];
const ctx = { messagename: '', outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {},
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
assert.deepStrictEqual(JSON.parse(JSON.stringify(out)), [[0, 'askname', 12]]);
send('username', 12, 'My', 'Pad');
assert.strictEqual(label(5), 'My Pad');
// a board that isn't set up stays selectable, marked
send('boards', 0, 0, 0, 0, 0, 0, 0, 0);
assert.deepStrictEqual(range(4), ['USER', 'PR-A', 'PR-B', 'PR-C', 'PR-GM', 'PR-E', 'CARD', 'SR-11 (n/a)']);
// JV-1080: no PR-E, GM bank is PR-D, slots A-D only
send('model', 1);
assert.deepStrictEqual(range(1), ['USER', 'PR-A', 'PR-B', 'PR-C', 'PR-D', 'CARD']);
console.log('jvparts: all tests passed');
