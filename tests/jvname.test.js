// Run: node tests/jvname.test.js  (mocks the Max js globals)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const out = [];
const ctx = { inlet: 0, messagename: '', outlet: (n, ...a) => out.push([n, ...(Array.isArray(a[0]) ? a[0] : a)]),
	setinletassist() {}, setoutletassist() {}, arrayfromargs: a => Array.from(a) };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvname.js'), 'utf8'), ctx);
const sent = () => out.filter(o => o[0] < 12).map(o => [o[0], o[1]]);
const shown = () => out.filter(o => o[0] === 12).pop().slice(2).join(' ');   // [12, 'set', words...]

// the JV's name arrives (Get): stored in the numboxes and shown, nothing sent
ctx.inlet = 0; ctx.fromjv('Tron', 'Str');
assert.deepStrictEqual(sent(), [], 'a name from the JV is not sent back');
assert.strictEqual(shown(), 'Tron Str');
assert.deepStrictEqual(out.filter(o => o[0] === 13), [[13, 'set', 84]], 'T stored in numbox 1');

// typing a new name sends only the changed characters, padded with spaces to 12
out.length = 0; ctx.text('Tron', 'Pad');
assert.deepStrictEqual(sent(), [[5, 80], [6, 97], [7, 100]]);
assert.strictEqual(shown(), 'Tron Pad');
out.length = 0; ctx.text('A', 'very', 'long', 'patch', 'name');
assert.strictEqual(sent().length, 11, 'cut to 12 characters');
assert.strictEqual(shown(), 'A very long');

// characters the JV can't show become spaces
assert.deepStrictEqual(JSON.parse(JSON.stringify(ctx.codes('ä~}'))).slice(0, 3), [32, 32, 125]);

// stored values at load: shown, not sent
out.length = 0; ctx.inlet = 1; ctx.ch(0, 66); ctx.ch(1, 0);
assert.deepStrictEqual(sent(), []);
assert.ok(shown().startsWith('B'), shown());
// Perform mode: the field shows the performance name; typing sends it as one DT1 to 01 00 00 00, not to the patch senders
out.length = 0; ctx.inlet = 0; ctx.perfname('Seq:Template'); ctx.mode(1);
assert.strictEqual(shown(), 'Seq:Template');
assert.deepStrictEqual(out.filter(o => o[0] === 25), [[25, 'set', 83]], 'S stored in perf numbox 1');
out.length = 0; ctx.text('Live', 'Set');
assert.deepStrictEqual(sent(), [], 'the patch name is untouched');
const dt1 = out.filter(o => o[0] === 37).map(o => o[1]);
assert.deepStrictEqual(dt1.slice(0, 9), [0xF0, 0x41, 0x10, 0x6A, 0x12, 1, 0, 0, 0]);
assert.strictEqual(String.fromCharCode(...dt1.slice(9, 21)), 'Live Set    ');
assert.strictEqual(dt1.slice(5, -1).reduce((a, b) => a + b, 0) % 128, 0, 'checksum');
assert.strictEqual(shown(), 'Live Set');
out.length = 0; ctx.text('Live', 'Set');
assert.strictEqual(out.filter(o => o[0] === 37).length, 0, 'unchanged: nothing sent');
// back in Patch mode the patch name shows again; stored perf characters at load are shown in Perform mode only
ctx.mode(0); assert.ok(shown().startsWith('B'), shown());
ctx.inlet = 1; ctx.pch(0, 90); ctx.inlet = 0; ctx.mode(1); assert.strictEqual(shown(), 'Zive Set');
console.log('jvname: all tests passed');
