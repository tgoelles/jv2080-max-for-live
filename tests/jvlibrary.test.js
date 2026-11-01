// Run: node tests/jvlibrary.test.js  (mocks the Max js globals, File and a JV that answers RQ1 requests)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');

let now = 0, timers = [];
function Task(fn) {
	this.schedule = ms => { this.cancel(); this.t = [now + ms, fn]; timers.push(this.t); };
	this.cancel = () => { timers = timers.filter(x => x !== this.t); };
	this.freepeer = () => {};
}
const files = {};   // path -> bytes
function File(p, mode) {
	this.isopen = true; this.position = 0;
	if (mode === 'read') {
		if (!files[p]) { this.isopen = false; return; }
		this.data = files[p]; this.eof = this.data.length;
		this.readbytes = n => { const c = this.data.slice(this.position, this.position + n); this.position += c.length; return c; };
	} else {
		files[p] = []; this.writebytes = a => { files[p].push(...a); };
	}
	this.close = () => {};
}

const status = [], wire = [], dialogs = [];
let cur = [];
const ctx = { Task, File, Date, outlet: (n, ...a) => {
	if (n === 0) { cur.push(a[0]); if (a[0] === 0xF7) { wire.push(cur); jv(cur); cur = []; } }
	if (n === 1) status.push(a.slice(1).join(' '));
	if (n === 3) dialogs.push(a);
}, setinletassist() {}, setoutletassist() {}, arrayfromargs: a => Array.from(a) };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvlibrary.js'), 'utf8'), ctx);
const run = () => { while (timers.length) { timers.sort((a, b) => a[0] - b[0]); const [t, f] = timers.shift(); now = t; f(); } };

// the JV: remembers DT1 writes, answers RQ1 with a DT1 of the requested size (filled with its memory or 0x20)
const memory = {};   // address number -> byte
let silent = new Set();   // addresses it doesn't answer (to test timeouts)
const sum = b => (128 - b.reduce((x, y) => x + y, 0) % 128) % 128;
const num = a => (a[0] << 21) | (a[1] << 14) | (a[2] << 7) | a[3];
const addr = n => [(n >> 21) & 0x7F, (n >> 14) & 0x7F, (n >> 7) & 0x7F, n & 0x7F];
function jv(m) {
	const body = m.slice(5, m.length - 2), a = num(body.slice(0, 4));
	if (m[4] === 0x12) { body.slice(4).forEach((v, i) => { memory[a + i] = v; }); return; }
	if (m[4] !== 0x11 || silent.has(a)) return;
	const size = num(body.slice(4, 8)), data = [];
	for (let i = 0; i < size; i++) data.push(memory[a + i] !== undefined ? memory[a + i] : 0x20);
	const reply = [...body.slice(0, 4), ...data];
	timers.push([now + 5, () => [0xF0, 0x41, 0x10, 0x6A, 0x12, ...reply, sum(reply), 0xF7].forEach(b => ctx.msg_int(b))]);
}

// the plan covers the whole user memory: system 18 blocks, 32 performances x 17, 2 rhythm sets x 65, 128 patches x 5
const plan = vm.runInContext('memoryPlan(0x4A)', ctx);
assert.strictEqual(plan.length, 18 + 32 * 17 + 2 * 65 + 128 * 5);
assert.deepStrictEqual(Array.from(plan[plan.length - 1][0]), [0x11, 127, 0x16, 0], 'last: USER:128 tone 4');

// backup: every block requested once, every reply written to the file in order
silent = new Set([num([0x11, 5, 0x12, 0])]);   // USER:006 tone 2 never answers
ctx.askbackup();
assert.strictEqual(dialogs.pop()[0], 'savedialog', 'Backup asks for a file first');
ctx.saved('lib/backup.syx'); run();
const saved = ctx.messages(files['lib/backup.syx']);
assert.strictEqual(saved.length, plan.length - 1, 'all blocks but the silent one');
assert.ok(/Saved backup.syx: 1331 blocks, 1 without reply/.test(status.pop()), 'status names the missing block');
assert.strictEqual(wire.filter(m => m[4] === 0x11 && num(m.slice(5, 9)) === num([0x11, 5, 0x12, 0])).length, 2, 'asked twice, then skipped');
silent = new Set();

// restore: confirmation first, then an automatic backup next to the file, then the file's blocks are written
const file = [];
const dt1 = (a, data) => { const b = [...a, ...data]; return [0xF0, 0x41, 0x10, 0x6A, 0x12, ...b, sum(b), 0xF7]; };
file.push(...dt1([0x11, 0, 0, 0], Array(12).fill(0x41)));            // USER:001 name "AAAAAAAAAAAA"
file.push(...dt1([0x03, 0, 0, 0], [1, 2, 3]));                        // temporary patch: not user memory, skipped
file.push(0xF0, 0x41, 0x10, 0x42, 0x12, 0x40, 0, 0x7F, 0, 0x41, 0xF7); // GS reset: other model, skipped
const bad = dt1([0x11, 1, 0, 0], [0x42]); bad[bad.length - 2] ^= 1;   // wrong checksum: skipped
file.push(...bad);
files['lib/mine.syx'] = file;
wire.length = 0; ctx.restore('lib/mine.syx');
assert.ok(/Restore mine.syx \(1 blocks\)\?/.test(status.pop()));
assert.deepStrictEqual(dialogs.pop(), ['confirm', 1]);
assert.strictEqual(wire.length, 0, 'nothing sent before confirming');
memory[num([0x11, 0, 0, 0])] = 0x5A;   // the JV's current USER:001 starts with "Z"
ctx.confirm(); run();
const auto = Object.keys(files).find(k => /lib\/JV-2080_auto_backup_.*\.syx/.test(k));
assert.ok(auto, 'auto backup written next to the restored file');
assert.strictEqual(ctx.messages(files[auto]).find(m => num(m.slice(5, 9)) === num([0x11, 0, 0, 0]))[9], 0x5A, 'auto backup has the old name');
assert.strictEqual(memory[num([0x11, 0, 0, 0])], 0x41, 'restored');
assert.strictEqual(wire.filter(m => m[4] === 0x12).length, 1, 'only the one valid user memory block was written');
assert.ok(/Restored 1 blocks/.test(status.pop()));

// cancel before confirming: nothing happens
ctx.restore('lib/mine.syx'); wire.length = 0; ctx.cancel(); run();
assert.strictEqual(wire.length, 0); assert.deepStrictEqual(dialogs.pop(), ['confirm', 0]);

// recording a bulk dump started on the JV: user memory blocks are kept, then saved where the user says
ctx.record(1);
dt1([0x11, 2, 0, 0], [0x43]).forEach(b => ctx.msg_int(b));
dt1([0x10, 0, 0, 0], [0x44]).forEach(b => ctx.msg_int(b));
dt1([0x03, 0, 0x10, 0], [1]).forEach(b => ctx.msg_int(b));   // an edit, not part of the dump
ctx.record(0);
assert.strictEqual(dialogs.pop()[0], 'savedialog');
ctx.saved('lib/dump.syx');
assert.strictEqual(ctx.messages(files['lib/dump.syx']).length, 2);

// write: the temporary patch (Patch mode) is read and, once complete, written to USER:n
const fill = (a, size, v) => { for (let i = 0; i < size; i++) memory[num(a) + i] = v; };
fill([0x03, 0, 0, 0], 0x4A, 0x51);              // temporary patch common
fill([0x03, 0, 0x16, 0], 0x81, 0x52);           // temporary tone 4
wire.length = 0; ctx.writeuser(129);
assert.ok(/USER slots are 1-128/.test(status.pop()));
ctx.writeuser(7);
assert.ok(/current patch to USER 7\?/.test(status.pop()));
assert.deepStrictEqual(dialogs.pop(), ['confirm', 1]);
assert.strictEqual(wire.length, 0, 'nothing sent before confirming');
ctx.confirm(); run();
assert.strictEqual(wire.filter(m => m[4] === 0x11).length, 5, 'common + 4 tones read');
assert.strictEqual(memory[num([0x11, 6, 0, 0])], 0x51, 'USER:007 common');
assert.strictEqual(memory[num([0x11, 6, 0, 0x49])], 0x51, 'the whole common');
assert.strictEqual(memory[num([0x11, 6, 0x16, 0x80])], 0x52, 'USER:007 tone 4');
assert.ok(/Wrote the patch to USER 7/.test(status.pop()));
// Perform mode: the temporary performance (common + 16 parts) to 10 nn; USER 1-32 only
ctx.devmode(1);
assert.deepStrictEqual(dialogs.pop(), ['slotmax', 32], 'the slot box: USER 1-32 in Perform mode');
fill([0x01, 0, 0, 0], 0x44, 0x61);
fill([0x01, 0, 0x1F, 0], 0x1A, 0x62);
ctx.writeuser(33);
assert.ok(/USER slots are 1-32/.test(status.pop()));
wire.length = 0; ctx.writeuser(32); ctx.confirm(); run();
assert.strictEqual(wire.filter(m => m[4] === 0x11).length, 17);
assert.strictEqual(wire.filter(m => m[4] === 0x12).length, 17);
assert.strictEqual(memory[num([0x10, 31, 0, 0x43])], 0x61, 'USER 32 common');
assert.strictEqual(memory[num([0x10, 31, 0x1F, 0x19])], 0x62, 'USER 32 part 16');
// a block that doesn't come back: nothing is written
silent = new Set([num([0x01, 0, 0x15, 0])]);
wire.length = 0; ctx.writeuser(3); ctx.confirm(); run();
assert.strictEqual(wire.filter(m => m[4] === 0x12).length, 0, 'nothing written');
assert.ok(/No reply from the JV: nothing written/.test(status.pop()));
silent = new Set();
// a restore asked after Write was asked replaces it
ctx.writeuser(4); ctx.restore('lib/mine.syx'); wire.length = 0; ctx.confirm(); run();
assert.strictEqual(wire.filter(m => m[4] === 0x12 && m[5] === 0x10).length, 0, 'the write was dropped');
console.log('jvlibrary: all tests passed');
