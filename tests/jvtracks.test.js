// Run: node tests/jvtracks.test.js  (mocks the Max js globals and the Live API)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
// a Live set like the maintainer's: the device's track (to the UltraLite, Ch. 1), a KeyStep track straight to the
// UltraLite on Ch. 2, a track routed into the device's track (plays on Ch. 1 there: not counted), an audio track
const port = name => '{"output_routing_type": {"display_name": "' + name + '", "identifier": 7}}';
const chan = c => '{"output_routing_channel": {"display_name": "' + c + '", "identifier": 3}}';
const tracks = [
	{ id: '1', name: 'JV 2080 Midi', out: 'UltraLite mk3 Hybrid', ch: 'Ch. 1', midi: 1 },
	{ id: '2', name: 'Keystep 2', out: 'UltraLite mk3 Hybrid', ch: 'Ch. 2', midi: 1, color: 0xFF8000 },
	{ id: '3', name: 'Testing', out: 'JV 2080 Midi', ch: 'Track In', midi: 1 },
	{ id: '4', name: 'Arp', out: 'UltraLite mk3 Hybrid', ch: 'Ch. 2', midi: 1 },
	{ id: '5', name: 'Audio', out: 'Master', ch: '', midi: 0 }];
function LiveAPI(a, b) {
	const cb = typeof a === 'function' ? a : null, p = cb ? b : a;
	const t = p === 'this_device canonical_parent' ? tracks[0] : p === 'live_set' ? null : tracks[+p.split(' ')[2]];
	this.id = t ? t.id : '0';
	this.getcount = () => tracks.length;
	this.get = k => k === 'output_meter_level' ? [t.meter || 0] : k === 'name' ? [t.name] : k === 'has_midi_output' ? [t.midi] : k === 'color' ? [t.color || 0] :
		k === 'output_routing_type' ? [port(t.out)] : [chan(t.ch)];
}
const tasks = [];
function Task(fn) { this.fn = fn; tasks.push(this); this.repeat = () => {}; this.cancel = () => {}; this.freepeer = () => {}; }
const tick = () => tasks.forEach(t => t.fn.name === 'readMeters' && t.fn());
const ui = {}, colors = {}, posts = [];
const channels = { 3: 2 };   // part 3 also listens on channel 2
const patcher = { getnamed: v => ({ getvalueof: () => { const m = /^P(\d+)Channel$/.exec(v); return channels[m[1]] || +m[1]; },
	message: (...a) => { const m = Array.isArray(a[0]) ? a[0] : a; if (m[0] === 'set') ui[v] = m[1]; else if (m[0] === 'bgcolor') { colors[v] = Array.from(m.slice(1)); lit[v.replace('Bg', '')] = m[4] ? 1 : 0; } } }) };
const lit = {};
const ctx = { LiveAPI, Task, patcher, post: s => posts.push(s), setinletassist() {} };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvtracks.js'), 'utf8'), ctx);

ctx.start();
assert.strictEqual(ui.P2Track, 'Keystep 2+A', 'channel 2: Keystep 2 + Arp, cut to 11 characters');
assert.strictEqual(ui.P3Track, 'Keystep 2+A', 'part 3 listens on channel 2 too');
assert.deepStrictEqual(colors.P2TrackBg, [0, 0, 0, 0], 'not lit: transparent');
assert.strictEqual(ui.P1Track, '', 'the device\'s own track and the one routed into it are not counted');
assert.ok(posts[0].includes('Testing -> JV 2080 Midi / Track In'), 'what Live reports goes to the console');
// activity: the KeyStep track plays -> parts 2 and 3 light up; stops -> back to grey
tracks[1].meter = 0.6; tick();
assert.deepStrictEqual([lit.P2Track, lit.P3Track, lit.P1Track], [1, 1, 0]);
assert.deepStrictEqual(colors.P2TrackBg, [1, 128 / 255, 0, 1], 'lit in the first track\'s Live colour');
assert.ok(posts.some(p => p.includes('Keystep 2 plays')), 'first activity posted once');
tracks[1].meter = 0; tick();
assert.strictEqual(lit.P2Track, 0);
// re-routed: Arp moves to channel 5 -> part 5 shows it, and a second scan doesn't post again unless something changed
tracks[3].ch = 'Ch. 5'; ctx.scan();
assert.strictEqual(ui.P5Track, 'Arp');
assert.strictEqual(ui.P2Track, 'Keystep 2');
const n = posts.length; ctx.scan();
assert.strictEqual(posts.length, n);
console.log('jvtracks: all tests passed');
