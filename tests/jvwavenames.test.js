// Run: node tests/jvwavenames.test.js  (mocks the Max js globals; uses a small names fixture)
const fs = require("fs"), vm = require("vm"), path = require("path"), assert = require("assert");
const shown = {};
const patcher = { getnamed: p => ({ subpatcher: () => ({ getnamed: v => ({ message: (sel, t) => { shown[p + "/" + v] = t; } }) }) }) };
const ctx = { patcher, setinletassist() {}, outlet() {} };
vm.createContext(ctx);
ctx.include = f => {
	assert.strictEqual(f, "jv2080_names.js");
	vm.runInContext('var JV2080_WAVE_NAMES = {"INT-A": ["One", "Two"], "SR-11": ["Phrase", "Loop", "Saw"]};', ctx);
};
vm.runInContext(fs.readFileSync(path.join(__dirname, "../device/jvwavenames.js"), "utf8"), ctx);

ctx.wave(16, 0, 2);
assert.strictEqual(shown["WG_1/WaveName"], "Two", "tone 1, INT-A wave 2");
ctx.wave(22, 12, 3);
assert.strictEqual(shown["WG_4/WaveName"], "Saw", "tone 4, SR-JV80-11 (group 12) wave 3");
ctx.wave(18, 1, 5);
assert.strictEqual(shown["WG_2/WaveName"], "", "no names for INT-B: blank");
ctx.wave(20, 12, 200);
assert.strictEqual(shown["WG_3/WaveName"], "", "beyond the list: blank");
ctx.wave(0, 0, 1);
assert.ok(!("WG_0/WaveName" in shown), "address not known yet: nothing");

// the committed names file is the empty stub or a generated one, and loads in Node
const N = require("../device/jv2080_names.js");
assert.strictEqual(typeof N, "object");

console.log("jvwavenames: all tests passed");
