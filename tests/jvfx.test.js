// Run: node tests/jvfx.test.js  (mocks the Max js globals)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
const load = f => {
	const out = [];
	const ctx = { outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {}, arrayfromargs: a => Array.from(a) };
	vm.createContext(ctx);
	ctx.include = g => vm.runInContext(fs.readFileSync(path.join(__dirname, '../device', g), 'utf8'), ctx);
	ctx.include(f);
	return [ctx, out];
};
const E = require('../device/jv2080_efx.js');

// jv2080_efx.js: 40 types, at most 12 parameters each, every kind known
assert.strictEqual(E.TYPES.length, 40);
E.TYPES.forEach(([name, ps], i) => {
	assert.ok(ps.length >= 5 && ps.length <= 12, `${i + 1} ${name}: ${ps.length} parameters`);
	assert.strictEqual(ps[ps.length - 1][0], 'Level', `${i + 1} ${name} ends with Level`);
	ps.forEach(([label, kind]) => {
		assert.ok(label.length <= 10, `label too long for a dial: ${label}`);
		assert.ok(E.KINDS[kind], `${name} ${label}: unknown kind ${kind}`);
	});
});
// measured on a JV-2080: Stereo-EQ Low Freq 400 Hz = raw 1, Low Gain +15 dB = raw 30
assert.strictEqual(E.format(0, 0, 1), '400 Hz');
// STEREO-EQ wire order (measured): Low Freq, Low Gain, High Freq, High Gain, P1 Freq, P1 Q, P1 Gain, P2 Freq, P2 Q, P2 Gain, Level
assert.deepStrictEqual(E.TYPES[0][1].map(x => x[0]).join(','), 'Low Freq,Low Gain,High Freq,High Gain,P1 Freq,P1 Q,P1 Gain,P2 Freq,P2 Q,P2 Gain,Level');
assert.strictEqual(E.format(0, 1, 30), '+15 dB');
assert.strictEqual(E.format(0, 1, 15), '0 dB');
assert.strictEqual(E.format(0, 1, 0), '-15 dB');
// dial 0-127 covers the whole range; raw -> dial -> raw round-trips
for (let ty = 0; ty < 40; ty++) for (let s = 0; s < 12; s++) {
	const m = E.maxRaw(ty, s);
	assert.strictEqual(E.toRaw(ty, s, 0), 0); assert.strictEqual(E.toRaw(ty, s, 127), m);
	for (let r = 0; r <= m; r++) assert.strictEqual(E.toRaw(ty, s, E.toDial(ty, s, r)), r, `type ${ty + 1} slot ${s + 1} raw ${r}`);
}
assert.strictEqual(E.format(1, 4, 0), 'L64'); assert.strictEqual(E.format(1, 4, 64), '0'); assert.strictEqual(E.format(1, 4, 127), '63R');
assert.strictEqual(E.format(16, 6, 17), 'BYPASS'); assert.strictEqual(E.format(16, 6, 7), '1000 Hz');
assert.strictEqual(E.format(21, 0, 36), '+12 st');
assert.strictEqual(E.format(3, 1, 80), '(80)', 'undocumented steps shown raw');

// jvfx.js: labels, value text and raw values per dial
const [fx, out] = load('jvfx.js');
fx.msg_int(16);   // 17 STEREO-DELAY: 11 parameters
assert.deepStrictEqual(out.filter(o => o[0] === 0), [[0, '_parameter_shortname', 'Delay L'], [0, 'active', 1]]);
assert.deepStrictEqual(out.filter(o => o[0] === 11), [[11, '_parameter_shortname', '-'], [11, 'active', 0]]);
assert.deepStrictEqual(out.filter(o => o[0] === 36), [[36, 'efxname', '17 STEREO-DELAY']]);
assert.strictEqual(out.filter(o => o[0] >= 24 && o[0] < 36).length, 12, 'type change sends all 12 parameters');
out.length = 0; fx.dial(6, 127);   // HF Damp to the end: BYPASS, raw 17
assert.deepStrictEqual(out, [[18, 'set', 'BYPASS'], [30, 17]]);
out.length = 0; fx.msg_int(0); fx.dial(1, 127);
assert.deepStrictEqual(out.slice(-2), [[13, 'set', '+15 dB'], [25, 30]], 'Stereo-EQ Low Gain at the top = +15 dB = 30');
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
