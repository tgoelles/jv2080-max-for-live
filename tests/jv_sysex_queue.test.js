// Run: node tests/jv_sysex_queue.test.js  (mocks the Max js globals)
const fs = require("fs"), vm = require("vm"), path = require("path"), assert = require("assert");
let now = 0, timers = [], out = [], posts = [];
const ctx = { inlet: 0, outlet: (i, b) => out.push([now, b]), setinletassist() {}, setoutletassist() {},
	arrayfromargs: a => Array.from(a), post: m => posts.push(m.trim()),
	Task: function (fn) { this.schedule = ms => timers.push([now + ms, fn]); this.cancel = () => {}; this.freepeer = () => {}; } };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, "../device/jv_sysex_queue.js"), "utf8"), ctx);
const dt1 = (a, v) => { const s = (128 - (a.reduce((x, y) => x + y, 0) + v) % 128) % 128; return [0xF0, 0x41, 0x10, 0x6A, 0x12, ...a, v, s, 0xF7]; };
const send = m => { ctx.inlet = 1; m.forEach(b => ctx.msg_int(b)); };
const run = () => { while (timers.length) { timers.sort((a, b) => a[0] - b[0]); const [t, f] = timers.shift(); now = t; f(); } };
const messages = () => { const r = []; let cur = []; out.forEach(([t, b]) => { cur.push(b); if (b === 0xF7) { r.push([t, cur]); cur = []; } }); return r; };
const reset = () => { out = []; now = 0; };

// 1. a burst is paced at the default 10 ms; repeats of a queued address are merged
for (let i = 0; i < 200; i++) send(dt1([3, 0, 16, i % 128], i % 100));
run();
let starts = messages().map(([t]) => t);
assert.strictEqual(starts.length, 129, "128 distinct addresses + the first one sent right away");
assert.strictEqual(Math.min(...starts.slice(1).map((t, i) => t - starts[i])), 10, "10 ms between messages");

// 2. a fast knob sweep on one address collapses to the first and the last value
reset();
for (let v = 0; v <= 127; v++) send(dt1([3, 0, 16, 81], v));
run();
const sweep = messages();
assert.strictEqual(sweep.length, 2);
assert.strictEqual(sweep[1][1][9], 127, "last value wins");

// 3. MIDI from midiin passes straight through while SysEx is queued
reset();
send(dt1([3, 0, 16, 1], 1)); send(dt1([3, 0, 16, 2], 2));
ctx.inlet = 0; ctx.msg_int(0x90);
assert.strictEqual(out.findIndex(([t, b]) => b === 0x90), 12, "note goes out after message 1, before message 2");
run();

// 4. device ID rewrite (17-32 -> 0x10-0x1F); out-of-range values are rejected
reset(); ctx.deviceid(20); send(dt1([3, 0, 16, 81], 5)); run();
assert.strictEqual(out[2][1], 0x13);
ctx.deviceid(99);
assert.ok(posts.some(p => p.includes("device ID must be 17-32")));
ctx.deviceid(17); reset(); send(dt1([3, 0, 16, 81], 6)); run();
assert.strictEqual(out[2][1], 0x10);

console.log("jv_sysex_queue: all tests passed");
