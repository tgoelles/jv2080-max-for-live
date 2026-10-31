// Run: node tests/jvtracks.test.js  (mocks the Max js globals and the Live API)
const fs = require('fs'), vm = require('vm'), path = require('path'), assert = require('assert');
// a Live set: the device's track (to the JV), KeyStep tracks on channels 1, 2 and 2, a track to another port
const port = name => '{"output_routing_type": {"display_name": "' + name + '", "identifier": 7}}';
const chan = c => '{"output_routing_channel": {"display_name": "' + c + '", "identifier": 3}}';
const tracks = [
	{ id: '1', name: 'JV Control', out: 'UltraLite', ch: 'Ch. 1', midi: 1 },
	{ id: '2', name: 'Bass', out: 'UltraLite', ch: 'Ch. 1', midi: 1 },
	{ id: '3', name: 'Lead', out: 'UltraLite', ch: 'Ch. 2', midi: 1 },
	{ id: '4', name: 'Arp', out: 'UltraLite', ch: 'Ch. 2', midi: 1 },
	{ id: '5', name: 'Synth', out: 'Other Port', ch: 'Ch. 3', midi: 1 },
	{ id: '6', name: 'Audio', out: 'Master', ch: '', midi: 0 }];
function LiveAPI(p) {
	const t = p === 'this_device canonical_parent' ? tracks[0] : p === 'live_set' ? null : tracks[+p.split(' ')[2]];
	this.id = t ? t.id : '0';
	this.getcount = () => tracks.length;
	this.get = k => k === 'name' ? [t.name] : k === 'has_midi_output' ? [t.midi] :
		k === 'output_routing_type' ? [port(t.out)] : [chan(t.ch)];
}
const ui = {};
const channels = { 1: 1, 2: 2, 3: 3, 4: 2 };   // part 4 also listens on channel 2
const patcher = { getnamed: v => ({ getvalueof: () => { const m = /^P(\d+)(Channel|On)$/.exec(v); return m[2] === 'Channel' ? (channels[m[1]] || +m[1]) : (ui[v] === undefined ? 1 : ui[v]); },
	message: (sel, x) => { ui[v] = x; } }) };
const ctx = { LiveAPI, patcher, setinletassist() {} };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, '../device/jvtracks.js'), 'utf8'), ctx);

ctx.scan(0);
assert.strictEqual(ui.P1Track, 'Bass', 'channel 1: Bass (not the device\'s own track)');
assert.strictEqual(ui.P2Track, 'Lead+Arp', 'two tracks on channel 2 (at most 8 characters)');
assert.strictEqual(ui.P4Track, 'Lead+Arp', 'a part on channel 2 too');
assert.strictEqual(ui.P3Track, '', 'channel 3 goes to another port');
assert.strictEqual(ui.P1On, undefined, 'names only: nothing switched');
ctx.scan(1);
assert.deepStrictEqual([ui.P1On, ui.P2On, ui.P3On, ui.P4On, ui.P16On], [undefined, undefined, 0, undefined, 0], 'parts without a track off; on ones untouched');
console.log('jvtracks: all tests passed');
