// Run: node tests/jvpages.test.js  (mocks the Max js globals)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
let out = [];
const ctx = { messagename: '', outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {},
	arrayfromargs: a => Array.from(a) };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvpages.js'), 'utf8'), ctx);
const send = (name, ...args) => { out = []; ctx.messagename = name; ctx.anything(...args); };
const shows = () => out.filter(o => o[0] === 0 && o[2] === 'show').map(o => o[3]).sort();
const hides = () => out.filter(o => o[0] === 0 && o[2] === 'hide').map(o => o[3]);
const buttons = () => Object.fromEntries(out.filter(o => o[0] === 1).map(o => [o[1], o[3]]));

// at load: everything is shown or hidden once; Patch mode, Tone 1
send('refresh');
assert.deepStrictEqual(shows(), ['CtrlButton', 'FXButton', 'LFOButton', 'PatchButton', 'Pitch_1', 'TVF_1', 'ToneMix', 'ToneTabs', 'VCA_1', 'WG_1']);
assert.ok(hides().includes('PerformPage') && hides().includes('LFO_1') && hides().includes('Settings'));
assert.deepStrictEqual(buttons(), { lfo: 0, ctrl: 0, fx: 0, patch: 0, library: 0, setup: 0 });

// a tone tab: only the changes go out
send('tone', 2);
assert.deepStrictEqual(shows(), ['Pitch_3', 'TVF_3', 'VCA_3', 'WG_3']);
assert.deepStrictEqual(hides(), ['Pitch_1', 'TVF_1', 'WG_1', 'VCA_1']);

// LFO follows the tone; Ctrl switches LFO off
send('page', 'lfo', 1);
assert.deepStrictEqual(shows(), ['LFO_3']);
assert.deepStrictEqual(buttons(), {}, 'the clicked button is already on');
send('tone', 0);
assert.deepStrictEqual(shows(), ['LFO_1']);
send('page', 'ctrl', 1);
assert.deepStrictEqual(shows(), ['CTRL_1', 'CtrlCommon']);
assert.deepStrictEqual(buttons(), { lfo: 0 }, 'the other page button goes off');
// switching a page off shows the tone again
send('page', 'ctrl', 0);
assert.deepStrictEqual(shows(), ['Pitch_1', 'TVF_1', 'VCA_1', 'WG_1']);

// FX / Patch / Setup are switched off by a tone tab
send('page', 'fx', 1);
assert.deepStrictEqual(shows(), ['FX']);
send('page', 'setup', 1);
assert.deepStrictEqual(shows(), ['Settings']);
assert.deepStrictEqual(buttons(), { fx: 0 });
send('tone', 1);
assert.deepStrictEqual(shows(), ['Pitch_2', 'TVF_2', 'VCA_2', 'WG_2']);
assert.deepStrictEqual(buttons(), { setup: 0 });

// Perform mode: the tone pages, their buttons and the tone switches go; the performance page shows
send('page', 'lfo', 1);
send('mode', 1);
assert.deepStrictEqual(shows(), ['PerformPage']);
for (const name of ['LFO_2', 'ToneTabs', 'LFOButton', 'CtrlButton', 'FXButton', 'PatchButton', 'ToneMix']) {
	assert.ok(hides().includes(name), name + ' hidden');
}
assert.deepStrictEqual(buttons(), { lfo: 0 });
// Library and Setup work in both modes, and stay open across a mode change
send('page', 'library', 1);
assert.deepStrictEqual(shows(), ['LibraryPage']);
send('mode', 0);
assert.ok(!shows().includes('PerformPage') && hides().includes('PerformPage') === false, 'Library stays');
assert.deepStrictEqual(shows(), ['CtrlButton', 'FXButton', 'LFOButton', 'PatchButton', 'ToneMix', 'ToneTabs']);
send('page', 'library', 0);
assert.deepStrictEqual(shows(), ['Pitch_2', 'TVF_2', 'VCA_2', 'WG_2']);
// a Patch-mode page can't be opened in Perform mode (its button is hidden anyway)
send('mode', 1); send('page', 'fx', 1);
assert.deepStrictEqual(shows(), []);
assert.deepStrictEqual(buttons(), { fx: 0 });
// the same mode again changes nothing
send('mode', 1);
assert.deepStrictEqual(out, []);
console.log('jvpages: all tests passed');
