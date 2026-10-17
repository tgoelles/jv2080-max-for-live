// Run: node tests/jvlfoplot.test.js  (no mgraphics: only the curve math is tested)
const fs = require('fs'), vm = require('vm'), assert = require('assert');
const ctx = { setinletassist() {} };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(require('path').join(__dirname, '../device/jvlfoplot.js'), 'utf8'), ctx);
const N = 201;
const min = ys => Math.min(...ys), max = ys => Math.max(...ys);

// defaults: TRI, offset 0, no delay -> swings -0.5..+0.5 from the start
let ys = ctx.curve(N);
assert.ok(Math.abs(max(ys) - 0.5) < 0.02 && Math.abs(min(ys) + 0.5) < 0.02, 'TRI around 0');
assert.ok(ys.every(y => y >= -1 && y <= 1));

// offset +100 / -100 keep the swing on one side of 0
ctx.offset(4); ys = ctx.curve(N); assert.ok(min(ys) >= -1e-9 && max(ys) > 0.9, 'offset +100 is positive');
ctx.offset(0); ys = ctx.curve(N); assert.ok(max(ys) <= 1e-9 && min(ys) < -0.9, 'offset -100 is negative');
ctx.offset(2);

// ON-IN with delay: flat until the delay, then fades in
ctx.delay(127); ctx.fadetime(64); ctx.fademode(0); ys = ctx.curve(N);
assert.ok(ys.slice(0, 85).every(y => y === 0), 'silent during the delay');
assert.ok(max(ys.slice(170)) > 0.4, 'full swing after the fade');

// ON-OUT: full at first, gone after delay + fade
ctx.delay(20); ctx.fadetime(20); ctx.fademode(1); ys = ctx.curve(N);
assert.ok(max(ys.slice(0, 14).map(Math.abs)) > 0.3, 'swings before the delay');
assert.ok(ys.slice(60).every(y => Math.abs(y) < 1e-9), 'faded out');

// OFF-IN: silent until key off (middle) + delay
ctx.delay(0); ctx.fadetime(0); ctx.fademode(2); ys = ctx.curve(N);
assert.ok(ys.slice(0, 99).every(y => y === 0) && max(ys.slice(101).map(Math.abs)) > 0.3, 'starts at key off');

// more rate = more zero crossings; every wave stays in range
ctx.fademode(0);
const crossings = () => ctx.curve(N).filter((y, i, a) => i && (a[i - 1] < 0) !== (y < 0)).length;
ctx.rate(0); const slow = crossings(); ctx.rate(127); const fast = crossings();
assert.ok(fast > slow * 4, `rate: ${slow} -> ${fast} crossings`);
for (let w = 0; w < 8; w++) {
	ctx.wave(w); assert.ok(ctx.curve(N).every(y => y >= -1 && y <= 1 && !isNaN(y)), 'wave ' + w);
}
console.log('jvlfoplot: all tests passed');
