// Run: node tests/jvbank.test.js  (mocks the Max js globals)
const fs = require("fs"), vm = require("vm"), path = require("path"), assert = require("assert");
let out = [];
const ctx = { inlet: 0, outlet: (n, ...a) => out.push([n, ...(Array.isArray(a[0]) ? a[0] : a)]),
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

console.log("jvbank: all tests passed");
