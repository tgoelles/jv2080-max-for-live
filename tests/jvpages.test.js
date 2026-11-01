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
const buttons = () => Object.fromEntries(out.filter(o => o[0] === 1 && !/^p\d/.test(o[1])).map(o => [o[1], o[3]]));
const lit = () => out.filter(o => o[0] === 1 && /^p\d/.test(o[1]) && o[3] === 1).map(o => o[1]);

// at load: everything is shown or hidden once; Patch mode, Tone 1
send('refresh');
assert.deepStrictEqual(shows(), ['CtrlButton', 'FXButton', 'LFOButton', 'PatchButton', 'Pitch_1', 'TVF_1', 'ToneMix', 'ToneTabs', 'VCA_1', 'WG_1']);
assert.ok(hides().includes('PerformPage') && hides().includes('LFO_1') && hides().includes('Settings'));
assert.deepStrictEqual(buttons(), { lfo: 0, ctrl: 0, fx: 0, patch: 0, library: 0, setup: 0, part: 0, keys: 0 });

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
assert.deepStrictEqual(shows(), ['KeysButton', 'PartButton'].concat([...Array(16).keys()].map(i => 'PartSel' + (i + 1)).sort(), ['PerformPage']).sort());
for (const name of ['LFO_2', 'ToneTabs', 'LFOButton', 'CtrlButton', 'PatchButton', 'ToneMix']) {
	assert.ok(hides().includes(name), name + ' hidden');
}
assert.deepStrictEqual(buttons(), { lfo: 0 });
// Library and Setup work in both modes, and stay open across a mode change
send('page', 'library', 1);
assert.deepStrictEqual(shows(), ['LibraryPage']);
send('mode', 0);
assert.ok(!shows().includes('PerformPage') && hides().includes('PerformPage') === false, 'Library stays');
assert.deepStrictEqual(shows(), ['CtrlButton', 'LFOButton', 'PatchButton', 'ToneMix', 'ToneTabs']);
assert.ok(hides().includes('PartSel16') && hides().includes('PartButton'), 'part controls hidden in Patch mode');
send('page', 'library', 0);
assert.deepStrictEqual(shows(), ['Pitch_2', 'TVF_2', 'VCA_2', 'WG_2']);
// a Patch-mode page can't be opened in Perform mode (its button is hidden anyway); FX opens the performance FX
send('mode', 1); send('page', 'lfo', 1);
assert.deepStrictEqual(shows(), []);
assert.deepStrictEqual(buttons(), { lfo: 0 });
send('page', 'fx', 1);
assert.deepStrictEqual(shows(), ['PerfFX']);
send('page', 'fx', 0);
// the same mode again changes nothing
send('mode', 1);
assert.deepStrictEqual(out, []);
// Perform mode: a part button opens that part's Part page; the Part button switches back to the Parts page
send('mode', 1);
send('part', 4);
assert.deepStrictEqual(shows(), ['PartEdit_5']);
assert.deepStrictEqual(buttons(), { part: 1 });
send('part', 6);
assert.deepStrictEqual(shows(), ['PartEdit_7']);
assert.deepStrictEqual(hides(), ['PartEdit_5']);
assert.deepStrictEqual(lit(), ['p7'], 'the selected part button lit');
assert.ok(out.some(o => o[1] === 'p5' && o[3] === 0), 'the previous one off');
send('part', 6);
assert.deepStrictEqual(lit(), ['p7'], 'clicking the lit button keeps it lit');
send('page', 'part', 0);
assert.deepStrictEqual(shows(), ['PerformPage']);
send('page', 'part', 1);
assert.deepStrictEqual(shows(), ['PartEdit_7'], 'the Part button shows the selected part');
// the Part page doesn't exist in Patch mode
send('mode', 0); send('page', 'part', 1);
assert.ok(!shows().some(s => s.startsWith('PartEdit')));
assert.deepStrictEqual(buttons(), { part: 0 });
// Keys page (Perform mode), switched off by the Part page and back
send('mode', 1); send('page', 'keys', 1);
assert.deepStrictEqual(shows(), ['KeysPage']);
send('part', 2);
assert.deepStrictEqual(shows(), ['PartEdit_3']);
assert.deepStrictEqual(buttons(), { part: 1, keys: 0 });
console.log('jvpages: all tests passed');
