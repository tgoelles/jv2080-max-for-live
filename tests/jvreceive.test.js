// Run: node tests/jvreceive.test.js  (mocks the Max js globals and the patcher scripting API)
const fs = require("fs"), vm = require("vm"), path = require("path"), assert = require("assert");
const dir = path.join(__dirname, "../device");

const set = {};   // "Pitch_4/live.dial" -> last value sent to that control
const out = [];
const patcher = {
	getnamed: p => ({ subpatcher: () => ({ getnamed: v => ({ message: (sel, val) => { set[p + "/" + v] = val; } }) }) })
};
const ctx = { inlet: 0, outlet: (n, ...a) => out.push([n, ...a]), post: m => { throw new Error(m); },
	setinletassist() {}, setoutletassist() {}, arrayfromargs: a => Array.from(a), patcher };
vm.createContext(ctx);
ctx.include = f => vm.runInContext(fs.readFileSync(path.join(dir, f), "utf8"), ctx);
vm.runInContext(fs.readFileSync(path.join(dir, "jvreceive.js"), "utf8"), ctx);
const feed = bytes => bytes.forEach(b => ctx.msg_int(b));

// "get" sends the 5 requests for the temporary patch
ctx.get();
const req = out.filter(o => o[0] === 0).map(o => o[1]);
assert.strictEqual(req.filter(b => b === 0xF0).length, 5);
assert.deepStrictEqual(req.slice(0, 15), [0xF0, 0x41, 0x10, 0x6A, 0x11, 3, 0, 0, 0, 0, 0, 0, 0x4A, 0x33, 0xF7]);
out.length = 0;

// replay the real dump as replies from the temporary patch (address 11 00 -> 03 00, checksum recomputed)
const hex = s => s.trim().split(/\s+/).map(h => parseInt(h, 16));
const dump = fs.readFileSync(path.join(__dirname, "fixtures/jv2080_user_patch_dump.txt"), "utf8")
	.split("\n").filter(l => l && !l.startsWith("#")).map(hex);
const asTemp = m => {
	const body = [3, 0, ...m.slice(7, m.length - 2)];
	return [0xF0, 0x41, 0x10, 0x6A, 0x12, ...body, (128 - body.reduce((a, b) => a + b, 0) % 128) % 128, 0xF7];
};

// a reply for a user patch (not what the device edits) changes nothing
feed(dump[1]);
assert.deepStrictEqual(set, {});

dump.map(asTemp).forEach(feed);

// queue muted around every block
const mutes = out.filter(o => o[0] === 1).map(o => o[2]);
assert.deepStrictEqual(mutes, [1, 0, 1, 0, 1, 0, 1, 0, 1, 0]);
// patch name shown, trailing spaces trimmed
assert.deepStrictEqual(out.filter(o => o[0] === 2)[0], [2, "set", "2  0  8  1"]);

// values land on the right controls, converted to control values
assert.strictEqual(set["Pitch_4/live.dial"], -12, "tone 4 coarse tune");
assert.strictEqual(set["TVF_3/live.dial"], 70, "tone 3 cutoff");
assert.strictEqual(set["TVF_3/live.menu"], 1, "tone 3 filter LPF");
assert.strictEqual(set["WG_1/live.dial"], 37, "tone 1 wave number 37");
assert.strictEqual(set["WG_2/live.menu"], 1, "tone 2 wave group INT-B");
assert.strictEqual(set["WG_1/live.menu"], 0, "tone 1 wave group INT-A");
assert.strictEqual(set["Pitch_1/live.numbox[5]"], 12, "keyfollow +100 = index 12");
assert.strictEqual(set["ToneMix/live.toggle[3]"], 1, "tone 1 switch on");
assert.strictEqual(set["ToneMix/live.toggle[2]"], 0, "tone 2 switch off");
assert.strictEqual(set["ToneMix/live.numbox"], 127, "tone 1 level");

// every bound control of every tone got a value
const B = require("../device/jv2080_bindings.js");
for (const b of B) {
	for (const t of b.tones) {
		assert.ok(b.path[0].replace("{n}", t) + "/" + b.varname in set, `${b.id} tone ${t} not set`);
	}
}

console.log("jvreceive: all tests passed");
