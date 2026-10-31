// Run: node tests/jvvoices.test.js  (mocks the Max js globals)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
let now = 0, timers = [];
function Task(fn) { this.schedule = ms => { this.cancel(); this.t = [now + ms, fn]; timers.push(this.t); };
	this.cancel = () => { timers = timers.filter(x => x !== this.t); }; this.freepeer = () => {}; }
const run = () => { while (timers.length) { timers.sort((a, b) => a[0] - b[0]); const [t, f] = timers.shift(); now = t; f(); } };
const sent = {};
let out = [];
const ctx = { Task, outlet: (n, ...a) => out.push([n, ...a]), setinletassist() {}, setoutletassist() {},
	patcher: { getnamed: v => ({ message: (sel, x) => { sent[v] = x; ctx.voice(+v.match(/\d+/)[0], x); } }) } };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvvoices.js'), 'utf8'), ctx);
const rest = () => out.filter(o => o[0] === 0).pop()[2];

// a read from the JV (captured "LateAutumnSP"): 64 in all, arriving one by one -> nothing changed, rest 0
[8, 8, 18, 18, 8, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0].forEach((v, i) => ctx.voice(i + 1, v));
run();
assert.deepStrictEqual(sent, {});
assert.strictEqual(rest(), 0);
// lowering part 3 frees voices
ctx.voice(3, 10); run();
assert.strictEqual(rest(), 8);
// raising part 12 to 20 would make 76: part 12 gets the 8 that are left
ctx.voice(12, 20); run();
assert.deepStrictEqual(sent, { P12Voices: 8 });
assert.strictEqual(rest(), 0);
console.log('jvvoices: all tests passed');
