// Run: node tests/jvtracks.test.js  (mocks the Max js globals and the Live API)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
// a Live set like the maintainer's: the device's track (to the UltraLite, Ch. 1), a KeyStep track straight to the
// UltraLite on Ch. 2, a track routed into the device's track (plays on Ch. 1 there: not counted), an audio track
const port = name => '{"output_routing_type": {"display_name": "' + name + '", "identifier": 7}}';
const chan = c => '{"output_routing_channel": {"display_name": "' + c + '", "identifier": 3}}';
const tracks = [
	{ id: '1', name: 'JV 2080 Midi', out: 'UltraLite mk3 Hybrid', ch: 'Ch. 1', midi: 1 },
	{ id: '2', name: 'Keystep 2', out: 'UltraLite mk3 Hybrid', ch: 'Ch. 2', midi: 1 },
	{ id: '3', name: 'Testing', out: 'JV 2080 Midi', ch: 'Track In', midi: 1 },
	{ id: '4', name: 'Arp', out: 'UltraLite mk3 Hybrid', ch: 'Ch. 2', midi: 1 },
	{ id: '5', name: 'Audio', out: 'Master', ch: '', midi: 0 }];
const observers = [];
function LiveAPI(a, b) {
	const cb = typeof a === 'function' ? a : null, p = cb ? b : a;
	const t = p === 'this_device canonical_parent' ? tracks[0] : p === 'live_set' ? null : tracks[+p.split(' ')[2]];
	this.id = t ? t.id : '0';
	this.getcount = () => tracks.length;
	this.get = k => k === 'name' ? [t.name] : k === 'has_midi_output' ? [t.midi] :
		k === 'output_routing_type' ? [port(t.out)] : [chan(t.ch)];
	if (cb) { this.cb = cb; this.track = t; observers.push(this); }
}
function Task(fn) { this.repeat = () => {}; this.cancel = () => {}; this.freepeer = () => {}; }
const ui = {}, colors = {}, posts = [];
const channels = { 3: 2 };   // part 3 also listens on channel 2
const patcher = { getnamed: v => ({ getvalueof: () => { const m = /^P(\d+)Channel$/.exec(v); return channels[m[1]] || +m[1]; },
	message: (...a) => { const m = Array.isArray(a[0]) ? a[0] : a; if (m[0] === 'set') ui[v] = m[1]; else colors[v] = m.slice(1); } }) };
const ctx = { LiveAPI, Task, patcher, post: s => posts.push(s), setinletassist() {} };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvtracks.js'), 'utf8'), ctx);

ctx.start();
assert.strictEqual(ui.P2Track, 'Keystep ', 'channel 2: Keystep 2 + Arp, cut to 8 characters');
assert.strictEqual(ui.P3Track, 'Keystep ', 'part 3 listens on channel 2 too');
assert.strictEqual(ui.P1Track, '', 'the device\'s own track and the one routed into it are not counted');
assert.ok(posts[0].includes('Testing -> JV 2080 Midi / Track In'), 'what Live reports goes to the console');
// activity: the KeyStep track plays -> parts 2 and 3 light up; stops -> back to grey
const keystep = observers.find(o => o.track.name === 'Keystep 2');
assert.strictEqual(keystep.property, 'output_meter_level');
keystep.cb(['output_meter_level', 0.6]);
assert.deepStrictEqual([colors.P2Track[0], colors.P3Track[0], colors.P1Track], [1.0, 1.0, undefined]);
keystep.cb(['output_meter_level', 0]);
assert.strictEqual(colors.P2Track[0], 0.647);
// re-routed: Arp moves to channel 5 -> part 5 shows it, and a second scan doesn't post again unless something changed
tracks[3].ch = 'Ch. 5'; ctx.scan();
assert.strictEqual(ui.P5Track, 'Arp');
assert.strictEqual(ui.P2Track, 'Keystep ');
const n = posts.length; ctx.scan();
assert.strictEqual(posts.length, n);
console.log('jvtracks: all tests passed');
