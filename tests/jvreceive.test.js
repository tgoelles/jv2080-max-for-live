// Run: node tests/jvreceive.test.js  (mocks the Max js globals and the patcher scripting API)
const fs = require("fs"), vm = require("vm"), path = require("path"), assert = require("assert");
const dir = path.join(__dirname, "../device");

const set = {};   // "Pitch_4/live.dial" -> last value sent to that control
const out = [];
const patcher = {
	getnamed: p => ({ message: (sel, val) => { set[p] = val; },   // a control in the main patch (ModeSwitch)
		subpatcher: () => ({ getnamed: v => ({ message: (sel, val) => { set[p + "/" + v] = val; },
		getvalueof: () => set[p + "/" + v] || 0 }) }) })
};
let now = 0, timers = [], posts = [];
function Task(fn) { this.schedule = ms => { this.cancel(); this.t = [now + ms, fn]; timers.push(this.t); };
	this.cancel = () => { timers = timers.filter(x => x !== this.t); }; this.freepeer = () => {}; }
const run = (until = Infinity) => { while (timers.length) { timers.sort((a, b) => a[0] - b[0]); if (timers[0][0] > until) break; const [t, f] = timers.shift(); now = t; f(); } };
const ctx = { inlet: 0, outlet: (n, ...a) => out.push([n, ...a]), post: m => posts.push(m.trim()), Task,
	setinletassist() {}, setoutletassist() {}, arrayfromargs: a => Array.from(a), patcher };
vm.createContext(ctx);
ctx.include = f => vm.runInContext(fs.readFileSync(path.join(dir, f), "utf8"), ctx);
vm.runInContext(fs.readFileSync(path.join(dir, "jvreceive.js"), "utf8"), ctx);
const feed = bytes => bytes.forEach(b => ctx.msg_int(b));

const requests = () => out.filter(o => o[0] === 0).map(o => o[1]).filter(b => b === 0xF0).length;

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

// "get" sends one request at a time: the next only after the reply (+ a short gap)
ctx.get();
assert.strictEqual(requests(), 1, "only the first request goes out");
assert.deepStrictEqual(out.filter(o => o[0] === 0).map(o => o[1]), [0xF0, 0x41, 0x10, 0x6A, 0x11, 3, 0, 0, 0, 0, 0, 0, 0x4A, 0x33, 0xF7]);
run(now + 100);
assert.strictEqual(requests(), 1, "still waiting for the reply");
for (const [i, m] of dump.map(asTemp).entries()) {
	feed(m);
	assert.strictEqual(requests(), i + 1, "no new request right after reply " + i);
	run(now + 30);
	assert.strictEqual(requests(), Math.min(i + 2, 5), "next request after the gap");
}
run();
assert.strictEqual(requests(), 5);
assert.deepStrictEqual(posts, [], "no timeouts");

// queue muted around every block
const mutes = out.filter(o => o[0] === 1).map(o => o[2]);
assert.deepStrictEqual(mutes, [1, 0, 1, 0, 1, 0, 1, 0, 1, 0]);
// patch name shown, trailing spaces trimmed
const nameMsg = out.filter(o => o[0] === 2)[0][1];
assert.strictEqual(nameMsg[0], "fromjv");
assert.strictEqual(nameMsg.slice(1).join(" "), "2  0  8  1", "patch name, inner spaces kept, trailing trimmed");

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
	if (!b.tones.length) {
		assert.ok(b.path[0] + "/" + b.varname in set, `${b.id} (patch common) not set`);
	}
}
// FX page: patch common and the per-tone outputs, including the reverb send at tone offset 0x80
assert.ok(B.some(b => b.block === "common" && b.id === "efx_type"), "EFX type is bound");
assert.ok(Number.isInteger(set["FX/EFXType"]) && Number.isInteger(set["FX/T4RevSend"]));

// Send writes the patch back as a few DT1 blocks; after a Get of the real dump, every bound byte matches the dump
{
	posts.length = 0; out.length = 0; ctx.send(); run();
	assert.ok(/send: \d+ blocks, 0 of \d+ bytes differ/.test(posts.pop()), "Get -> Send changes nothing");
	const msgs = []; let cur = null;
	for (const o of out.filter(o => o[0] === 0)) {
		if (o[1] === 0xF0) cur = [];
		cur.push(o[1]);
		if (o[1] === 0xF7) msgs.push(cur);
	}
	assert.ok(msgs.length >= 5 && msgs.length <= 40, `send: ${msgs.length} messages`);
	const J = require("../device/jvsysex.js");
	const sent = {};   // "a1 a2 a3 a4" + offset -> byte
	for (const m of msgs) {
		assert.strictEqual(m[4], 0x12, "DT1");
		const body = m.slice(5, m.length - 2);
		assert.strictEqual((body.reduce((a, b) => a + b, 0) + m[m.length - 2]) % 128, 0, "checksum");
		const addr = J.toNumber(body.slice(0, 4));
		body.slice(4).forEach((v, i) => { sent[addr + i] = v; });
	}
	let compared = 0;
	for (const m of dump.map(asTemp)) {
		const body = m.slice(5, m.length - 2), addr = J.toNumber(body.slice(0, 4));
		body.slice(4).forEach((v, i) => { if (sent[addr + i] !== undefined) { compared++; assert.strictEqual(sent[addr + i], v, `byte at ${(addr + i).toString(16)}`); } });
	}
	assert.ok(compared > 400, `${compared} bytes compared`);
	if (process.env.VERBOSE) console.log("send:", msgs.length, "messages,", compared, "bytes match the dump");
}

// Get and Send take turns: a Send while a Get is still waiting for replies goes out when the Get is done
{
	out.length = 0; ctx.get(); ctx.send();
	const dt1s = () => out.filter(o => o[0] === 0 && o[1] === 0x12).length;
	assert.strictEqual(dt1s(), 0, "send waits for the get");
	for (const m of dump.map(asTemp)) { feed(m); run(now + 30); }
	run();
	assert.ok(dt1s() >= 5, "send went out after the get");
	posts.length = 0;
}

// a lost reply doesn't stall the read: after the timeout the next request goes out
out.length = 0; ctx.get();
const t0 = now;
run(t0 + 499);
assert.strictEqual(requests(), 1);
run(t0 + 501);
assert.strictEqual(requests(), 2);
assert.ok(posts[0].includes("no reply"));
run();

// the JV-2080's "patch picked on the panel" message (captured: Techno patch 2)
out.length = 0;
feed(hex("F0 41 10 6A 12 00 00 00 02 02 0B 00 01 70 F7"));
assert.deepStrictEqual(out, [[3, "jvpatch", 2, 11, 1]]);
feed(hex("F0 41 10 6A 12 00 00 00 02 00 01 01 03 79 F7"));
assert.deepStrictEqual(out[1], [3, "jvpatch", 0, 1, 0x13], "USER 020");

// panel edits are broadcast live (captured: turning Tone 1 Cutoff on the JV) and land on the control, muted
out.length = 0;
for (const v of ["10 0C", "11 0B", "12 0A", "13 09", "0F 0D"]) feed(hex("F0 41 10 6A 12 03 00 10 51 " + v + " F7"));
assert.strictEqual(set["TVF_1/live.dial"], 0x0F, "Tone 1 cutoff follows the JV's knob");
assert.deepStrictEqual(out.filter(o => o[0] === 1).map(o => o[2]), [1, 0, 1, 0, 1, 0, 1, 0, 1, 0], "muted around each update");

// EFX parameters are converted per EFX type (the device's EFX Type menu): Stereo-EQ Low Gain +15 dB = raw 30
const dt1 = (addr, data) => { const body = [...addr, ...data];
	return [0xF0, 0x41, 0x10, 0x6A, 0x12, ...body, (128 - body.reduce((a, b) => a + b, 0) % 128) % 128, 0xF7]; };
feed(dt1([3, 0, 0, 0x0C], [0]));            // EFX type 1 STEREO-EQ
feed(dt1([3, 0, 0, 0x0E], [30]));           // EFX Parameter 2 (Low Gain) = +15 dB
assert.strictEqual(set["FX/EFXType"], 0);
assert.strictEqual(set["FX/EFXParam2"], 127, "+15 dB is the top of the dial");
feed(dt1([3, 0, 0, 0x0C], [3, 0, 64]));     // type 4 PHASER, Manual and Rate in one message
assert.strictEqual(set["FX/EFXParam2"], 65, "Rate raw 64 of 0-125 on the 0-127 dial");
assert.strictEqual(set["FX/EFXParam1"], 0, "Manual");

// the JV's EFX / CHORUS / REVERB buttons (System Common 08-0A) move the Effects On/Off toggles, muted
out.length = 0;
feed(dt1([0, 0, 0, 0x09], [0]));
assert.strictEqual(set["EffectsSwitch/live.toggle[2]"], 0, "chorus off");
feed(dt1([0, 0, 0, 0x08], [1, 1, 0]));
assert.deepStrictEqual([set["EffectsSwitch/live.toggle[3]"], set["EffectsSwitch/live.toggle[2]"], set["EffectsSwitch/live.toggle[1]"]], [1, 1, 0]);
assert.deepStrictEqual(out.filter(o => o[0] === 1).map(o => o[2]), [1, 0, 1, 0]);

// a name edit on the JV's panel (one character) updates the name field
out.length = 0;
feed(dt1([3, 0, 0, 0x00], [0x41]));   // first character -> "A"
const edited = out.filter(o => o[0] === 2).pop()[1];
assert.strictEqual(edited.slice(1).join(" "), "A  0  8  1");

// while the Library talks to the JV, Get and Send don't
posts.length = 0; out.length = 0;
ctx.busy(1); ctx.get(); ctx.send(); run();
assert.strictEqual(out.filter(o => o[0] === 0).length, 0, "nothing sent while the library is busy");
assert.strictEqual(posts.length, 2);
ctx.busy(0);

// models (#9): Get asks for the model's patch common size
for (const [m, size] of [[1, 0x48], [2, 0x49], [0, 0x4A]]) {
	ctx.model(m); out.length = 0; ctx.get();
	const req = out.filter(o => o[0] === 0).map(o => o[1]).slice(0, 15);
	assert.strictEqual(req[12], size, "model " + m + " common size");
	assert.strictEqual((req.slice(5, 13).reduce((a, b) => a + b, 0) + req[13]) % 128, 0, "checksum");
	run();
}

// Perform mode (#10): a mode change asks the JV where it is (System Common 00-05), unless the set is still loading
out.length = 0; ctx.mode(1); run();
assert.strictEqual(out.filter(o => o[0] === 0).length, 0, "no question while the set loads");
ctx.mode(0); ctx.loadedAt = 0; out.length = 0; ctx.mode(1);
const t1 = now;
run(t1 + 499);
assert.strictEqual(out.filter(o => o[0] === 0).length, 0, "not while the JV is still switching");
run(t1 + 500);
const where = [0xF0, 0x41, 0x10, 0x6A, 0x11, 0, 0, 0, 0, 0, 0, 0, 6, 0x7A, 0xF7];
assert.deepStrictEqual(out.filter(o => o[0] === 0).map(o => o[1]), where);
// no answer (the JV said "Data error"): asked once more after the timeout (2 s in Perform mode)
run(now + 2000);
assert.deepStrictEqual(out.filter(o => o[0] === 0).map(o => o[1]), where.concat(where));
out.length = 0;
feed(dt1([0, 0, 0, 0], [0, 38, 0, 1, 0, 3]));   // PERFORM, CARD 07, USER 004
assert.deepStrictEqual(out.filter(o => o[0] === 3), [[3, "jvperf", 38], [3, "jvpatch", 0, 1, 3]]);
assert.strictEqual(set["ModeSwitch"], undefined, "already in Perform mode: the switch isn't touched");

// Get in Perform mode reads the temporary performance: common + 16 parts, one at a time; the name goes to the field
out.length = 0; ctx.get();
const asked = () => out.filter(o => o[0] === 0 && o[1] === 0xF0).length;
const rq = () => { const b = out.filter(o => o[0] === 0).map(o => o[1]); const i = b.lastIndexOf(0xF0); return b.slice(i + 5, i + 13); };
assert.strictEqual(asked(), 1);
assert.deepStrictEqual(rq(), [1, 0, 0, 0, 0, 0, 0, 0x44]);
feed(dt1([1, 0, 0, 0], [..."Seq:Template"].map(c => c.charCodeAt(0)).concat(Array(0x44 - 12).fill(0))));
assert.strictEqual(out.filter(o => o[0] === 2).pop()[1].join(" "), "perfname Seq:Template");
for (let p = 1; p <= 16; p++) {
	run(now + 30);
	assert.deepStrictEqual(rq(), [1, 0, 0x0F + p, 0, 0, 0, 0, 0x1A], "part " + p);
	feed(dt1([1, 0, 0x0F + p, 0], Array(0x1A).fill(0)));
}
run();
assert.strictEqual(asked(), 17);
assert.ok(!("FX/EFXType" in set) || set["FX/EFXType"] === 3, "performance EFX values don't land on the patch FX page");

// the JV answers slowly right after loading a performance (0.8 s, measured): the next request waits for the reply
out.length = 0; ctx.get();
const t2 = now;
run(t2 + 1999);
assert.strictEqual(asked(), 1, "no second request while the JV is still loading");
feed(dt1([1, 0, 0, 0], Array(0x44).fill(0x20)));
run(now + 30);
assert.strictEqual(asked(), 2);
run();

// Send in Perform mode selects the set's performance; the patch blocks are not sent
out.length = 0; ctx.send(); run();
assert.deepStrictEqual(out.filter(o => o[0] === 3), [[3, "perfselect"]]);
assert.strictEqual(out.filter(o => o[0] === 0).length, 0);

// the JV switched to Patch mode on its panel: the switch follows, muted
out.length = 0; feed(dt1([0, 0, 0, 0], [1]));
assert.strictEqual(set["ModeSwitch"], 0);
assert.deepStrictEqual(out.filter(o => o[0] === 1).map(o => o[2]), [1, 0]);
console.log("jvreceive: all tests passed");
