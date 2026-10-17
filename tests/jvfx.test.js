// Run: node tests/jvfx.test.js  (mocks the Max js globals)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const load = f => {
	const out = [];
	const ctx = { outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {}, arrayfromargs: a => Array.from(a) };
	vm.createContext(ctx);
	vm.runInContext(fs.readFileSync(path.join(__dirname, '../device', f), 'utf8'), ctx);
	return [ctx, out];
};

// jvfx.js: 40 types, at most 12 parameters each; dial labels and greyed-out unused slots
const [fx, out] = load('jvfx.js');
const TYPES = vm.runInContext('TYPES', fx);
assert.strictEqual(TYPES.length, 40);
TYPES.forEach(([name, ps], i) => {
	assert.ok(ps.length >= 5 && ps.length <= 12, `${i + 1} ${name}: ${ps.length} parameters`);
	assert.strictEqual(ps[ps.length - 1], 'Level', `${i + 1} ${name} ends with Level`);
	ps.forEach(p => assert.ok(p.length <= 10, `label too long for a dial: ${p}`));
});
fx.msg_int(16);   // 17 STEREO-DELAY: 11 parameters
assert.deepStrictEqual(out.filter(o => o[0] === 0), [[0, '_parameter_shortname', 'Delay L'], [0, 'active', 1]]);
assert.deepStrictEqual(out.filter(o => o[0] === 11), [[11, '_parameter_shortname', '-'], [11, 'active', 0]]);
assert.deepStrictEqual(out.filter(o => o[0] === 12), [[12, 'efxname', '17 STEREO-DELAY']]);
out.length = 0; fx.msg_int(40); assert.deepStrictEqual(out, [], 'out of range ignored');

// jvfxroute.js: which connections the graphic draws
const [r] = load('jvfxroute.js');
const conns = () => JSON.parse(JSON.stringify(r.connections().map(c => c.slice(0, 2).join('>'))));
assert.deepStrictEqual(conns(), ['T1>MIX', 'T2>MIX', 'T3>MIX', 'T4>MIX'], 'defaults: tones to MIX, EFX unused');
r.tone(1, 'out', 1); r.tone(1, 'rev', 80); r.reverb('level', 100);
r.tone(2, 'out', 2); r.tone(2, 'cho', 90);   // DIR1: no chorus/reverb from this tone
r.chorus('level', 50); r.chorus('out', 2);
r.tone(3, 'mix', 0);                          // level 0: not drawn
assert.deepStrictEqual(conns(), ['T1>EFX', 'T1>REV', 'T2>DIR1', 'T4>MIX', 'EFX>MIX', 'REV>MIX'], 'nothing reaches chorus: its outputs are not drawn');
r.tone(4, 'cho', 40);
assert.ok(conns().includes('T4>CHO') && conns().includes('CHO>REV'));
r.efx('out', 1); r.efx('rev', 60);            // EFX to DIR1: its sends aren't used
assert.ok(conns().includes('EFX>DIR1') && !conns().includes('EFX>REV'));
r.efxname(17, 'STEREO-DELAY');
assert.strictEqual(vm.runInContext('state.efx.name', r), '17 STEREO-DELAY');
// global Effects On/Off switches
r.efx('on', 0); r.chorus('on', 0);
assert.strictEqual(vm.runInContext('state.efx.on + state.chorus.on + state.reverb.on', r), 1);
// long names shrink, then get shortened, to fit the EFX box
const fit = vm.runInContext('fit', r), measure = (s, size) => s.length * size * 0.55;
assert.deepStrictEqual(JSON.parse(JSON.stringify(fit('1 STEREO-EQ', 8, 88, measure))), ['1 STEREO-EQ', 8]);
const [s, size] = fit('20 QUADRUPLE-TAP-DELAY', 8, 88, measure);
assert.ok(size >= 6 && measure(s, size) <= 88, `${s} @ ${size}`);
console.log('jvfx: all tests passed');
