// Run: node tests/jvbank.test.js  (mocks the Max js globals)
const fs = require("fs"), vm = require("vm"), path = require("path"), assert = require("assert");
let out = [];
const posts = [];
const ctx = { post: m => posts.push(m), inlet: 0, outlet: (n, ...a) => out.push([n, ...(Array.isArray(a[0]) ? a[0] : a)]),
	setinletassist() {}, setoutletassist() {}, arrayfromargs: a => Array.from(a) };
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, "../device/jvbank.js"), "utf8"), ctx);
const menu = () => { const r = out.filter(o => o[0] === 0 && o[1] === "_parameter_range").pop(); return r ? r.slice(2) : null; };
const shown = () => out.filter(o => o[0] === 0 && o[1] === "set").map(o => o[2]).pop();
const midi = () => out.filter(o => o[0] === 2).map(o => o[1]);
const stored = () => out.filter(o => o[0] === 1).map(o => o.slice(1));
const bank = v => { ctx.inlet = 0; ctx.msg_int(v); };
const pick = i => { ctx.inlet = 1; ctx.msg_int(i); };

ctx.loadbang();
assert.deepStrictEqual(menu(), ["USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD"], "no boards: fixed banks only");

// stored PR-B (as from a saved set): bank select 81/1, then the program change
out = []; bank(2);
assert.deepStrictEqual(midi(), [0xB0, 0, 81, 0xB0, 32, 1]);
assert.ok(out.some(o => o[0] === 3 && o[1] === "bang"), "program number re-sent after the bank select");
assert.strictEqual(shown(), 2);

// Techno in slot A: XP-A1 / XP-A2 appear
out = []; ctx.boards(11, 0, 0, 0, 0, 0, 0, 0);
assert.deepStrictEqual(menu(), ["USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD", "XP-A1", "XP-A2"]);

// picking "XP-A2" in the visible menu sets the stored bank (index 8); it echoes back and sends 84/1
out = []; pick(8);
assert.deepStrictEqual(stored(), [[8]]);
out = []; bank(8);
assert.deepStrictEqual(midi(), [0xB0, 0, 84, 0xB0, 32, 1]);

// slot H, second half = LSB 15
out = []; bank(22);
assert.deepStrictEqual(midi(), [0xB0, 0, 84, 0xB0, 32, 15]);
assert.ok(menu().includes("XP-H2 (not set up)"), "a stored bank without a board stays selectable");

// following the JV: CC 0 = 81, CC 32 = 4 -> PR-E, set silently (nothing sent)
out = []; ctx.msb(81); ctx.lsb(4);
assert.deepStrictEqual(stored(), [["set", 5]]);
assert.deepStrictEqual(midi(), []);
// following onto XP-A1 from the JV
out = []; ctx.msb(84); ctx.lsb(0);
assert.deepStrictEqual(stored(), [["set", 7]]);
assert.strictEqual(shown(), 7, "visible menu shows XP-A1");

// the JV-2080 reports a patch picked on its panel (captured on hardware)
const prog = () => out.filter(o => o[0] === 4).map(o => o.slice(1)).pop();
const reads = () => out.filter(o => o[0] === 5).length;
out = []; ctx.jvpatch(0, 3, 0);                     // PR-A 001
assert.deepStrictEqual(stored(), [["set", 1]]); assert.deepStrictEqual(prog(), ["set", 1]); assert.strictEqual(reads(), 1);
assert.deepStrictEqual(midi(), [], "nothing sent back to the JV");
out = []; ctx.jvpatch(0, 7, 0);                     // PR-E 001
assert.deepStrictEqual(stored(), [["set", 5]]);
out = []; ctx.jvpatch(0, 1, 0x13);                  // USER 020
assert.deepStrictEqual(stored(), [["set", 0]]); assert.deepStrictEqual(prog(), ["set", 20]);
out = []; ctx.jvpatch(2, 11, 1);                    // Techno (SR-JV80-11, slot A) patch 2
assert.deepStrictEqual(stored(), [["set", 7]]); assert.deepStrictEqual(prog(), ["set", 2]);
out = []; ctx.jvpatch(2, 11, 200);                  // Techno patch 201 -> XP-A2, program 73
assert.deepStrictEqual(stored(), [["set", 8]]); assert.deepStrictEqual(prog(), ["set", 73]);
out = []; ctx.jvpatch(2, 5, 0);                     // a board that isn't set up: still read, bank unchanged
assert.deepStrictEqual(stored(), []); assert.strictEqual(reads(), 1); assert.ok(posts.pop().includes("SR-05"));
ctx.follow(0); out = []; ctx.jvpatch(0, 3, 0);
assert.deepStrictEqual(out, [], "not following when switched off");
ctx.follow(1);

// models (#9): which banks exist
ctx.boards(11, 3, 0, 0, 7, 0, 0, 0);                  // boards in slots A, B, E
out = []; ctx.model(0);                                // JV-2080: PR-E, PR-GM, 8 slots
assert.deepStrictEqual(menu().slice(0, 7), ["USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD"]);
assert.ok(menu().includes("XP-E1") && !menu().includes("PCM"));
out = []; ctx.inlet = 0; ctx.msg_int(0); out = []; ctx.model(1);   // JV-1080 (current bank USER)
assert.deepStrictEqual(menu(), ["USER", "PR-A", "PR-B", "PR-C", "PR-D", "CARD", "XP-A1", "XP-A2", "XP-B1", "XP-B2", "PCM"]);
out = []; bank(23);
assert.deepStrictEqual(midi(), [0xB0, 0, 83, 0xB0, 32, 0], "PCM card = 83/0");
out = []; bank(0); out = []; ctx.model(2);              // XP-50/80: no cards, no PR-E, 4 slots
assert.deepStrictEqual(menu(), ["USER", "PR-A", "PR-B", "PR-C", "PR-D", "XP-A1", "XP-A2", "XP-B1", "XP-B2"]);
out = []; bank(5);                                      // a stored PR-E on an XP stays visible, marked
assert.ok(menu().includes("PR-E (n/a)"));
ctx.model(0);

// Perform mode: the menu lists the performance banks, the program number makes way for the performance number
out = []; ctx.mode(1);
assert.deepStrictEqual(menu(), ["USER", "PR-A", "PR-B", "CARD"]);
assert.deepStrictEqual(out.filter(o => o[0] === 9).map(o => o.slice(1).join(" ")), ["script hide ProgramChange[1]", "script show PerfNumber"]);
const sysex = () => out.filter(o => o[0] === 8).map(o => o[1]);
// picking PR-B in the visible menu sets the stored Performance Bank, which echoes back and selects PR-B 1 (= 96)
out = []; pick(2);
assert.deepStrictEqual(out.filter(o => o[0] === 6).map(o => o[1]), [2]);
out = []; ctx.perfbank(2);
assert.deepStrictEqual(sysex(), [0xF0, 0x41, 0x10, 0x6A, 0x12, 0, 0, 0, 1, 96, 31, 0xF7]);
out = []; ctx.perfnum(5);
assert.deepStrictEqual(sysex().slice(9, 10), [100], "PR-B 05");
// no bank select or program change for patches in Perform mode
out = []; bank(3);
assert.deepStrictEqual(midi(), []);
assert.ok(!out.some(o => o[0] === 3), "no program change");
out = []; ctx.msb(81); ctx.lsb(0);
assert.deepStrictEqual(stored(), [], "bank select from the keyboard is not followed in Perform mode");
// the JV reports CARD 07 (System Common 01 = 38): follow silently, then read it
out = []; ctx.jvperf(38);
assert.deepStrictEqual(out.filter(o => o[0] === 6 || o[0] === 7).map(o => o.join(" ")), ["6 set 3", "7 set 7"]);
assert.deepStrictEqual(sysex(), [], "nothing sent back");
assert.ok(out.some(o => o[0] === 5), "read the performance");
// a patch reported in Perform mode: stored silently, no read
out = []; ctx.jvpatch(0, 1, 0);
assert.ok(!out.some(o => o[0] === 5));
// back to Patch mode: the patch banks again; a performance reported now is stored, not read, not sent
out = []; ctx.mode(0);
assert.ok(menu().includes("PR-GM"));
out = []; ctx.jvperf(0); ctx.perfnum(3);
assert.ok(!out.some(o => o[0] === 5 || o[0] === 8));
console.log("jvbank: all tests passed");
