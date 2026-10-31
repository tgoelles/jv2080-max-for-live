// Roland JV-2080 SysEx: build DT1/RQ1 messages and parse DT1 replies into named parameters.
// Pure functions, ES5, no Max objects: usable from a Max js object (after include("jv2080_params.js")
// and include("jvsysex.js")) and from Node tests (require).
//
// Addresses are 4 bytes of 7 bits each (manual p.188): adding 1 to 03 00 10 7F gives 03 00 11 00.

var JVSysEx = (function () {
	var P = (typeof JV2080 !== "undefined") ? JV2080 : require("./jv2080_params.js");

	var ROLAND = 0x41;
	var RQ1 = 0x11;
	var DT1 = 0x12;

	// Roland checksum over address + data (or address + size): the low 7 bits of the sum plus the
	// checksum must be 0. The outer % 128 turns 128 into 0.
	function checksum(bytes) {
		var sum = 0;
		for (var i = 0; i < bytes.length; i++) {
			sum += bytes[i];
		}
		return (128 - (sum % 128)) % 128;
	}

	function toNumber(addr) {
		return ((addr[0] * 128 + addr[1]) * 128 + addr[2]) * 128 + addr[3];
	}

	function toAddress(n) {
		return [(n >> 21) & 0x7F, (n >> 14) & 0x7F, (n >> 7) & 0x7F, n & 0x7F];
	}

	function addOffset(addr, offset) {
		return toAddress(toNumber(addr) + offset);
	}

	// dev is the byte on the wire (device ID 17 -> 0x10)
	function dt1(dev, addr, data) {
		var body = addr.concat(data);
		return [0xF0, ROLAND, dev, P.modelId, DT1].concat(body, [checksum(body), 0xF7]);
	}

	function rq1(dev, addr, size) {
		var body = addr.concat(toAddress(size));
		return [0xF0, ROLAND, dev, P.modelId, RQ1].concat(body, [checksum(body), 0xF7]);
	}

	// Patch temporary area (Patch mode): block "common" or "tone" (tone 1-4)
	function patchAddress(block, tone) {
		return block === "tone" ? P.blocks.tone.temp[tone - 1].slice() : P.blocks.common.temp.slice();
	}

	// Request the whole temporary patch: common + 4 tones. commonSize: 0x4A JV-2080 (default), 0x48 JV-1080,
	// 0x49 XP-50/80 (their patch common is shorter, see #9)
	function requestPatch(dev, commonSize) {
		var out = [rq1(dev, patchAddress("common"), commonSize || P.blocks.common.size)];
		for (var t = 1; t <= 4; t++) {
			out.push(rq1(dev, patchAddress("tone", t), P.blocks.tone.size));
		}
		return out;
	}

	// Temporary performance (Performance mode): block "perf" (common) or "part" (part 1-16)
	function perfAddress(block, part) {
		var a = P.blocks[block].temp.slice();
		if (block === "part") {
			a[2] += part - 1;
		}
		return a;
	}

	// Request the whole temporary performance: common + 16 parts (17 requests)
	function requestPerformance(dev) {
		var out = [rq1(dev, perfAddress("perf"), P.blocks.perf.size)];
		for (var p = 1; p <= 16; p++) {
			out.push(rq1(dev, perfAddress("part", p), P.blocks.part.size));
		}
		return out;
	}

	// Raw value of one parameter as DT1 data bytes (nibble-split where the table says "bytes": 2)
	function encodeValue(param, raw) {
		raw = Math.max(param.min, Math.min(param.max, Math.round(raw)));
		return param.bytes === 2 ? [(raw >> 4) & 0x0F, raw & 0x0F] : [raw];
	}

	function setParam(dev, block, tone, id, raw) {
		var param = find(block, id);
		return dt1(dev, addOffset(patchAddress(block, tone), param.off), encodeValue(param, raw));
	}

	function find(block, id) {
		var list = P[block];
		for (var i = 0; i < list.length; i++) {
			if (list[i].id === id) {
				return list[i];
			}
		}
		throw new Error("unknown " + block + " parameter " + id);
	}

	// Parse one complete SysEx message. Returns null for anything that isn't a Roland 0x6A DT1/RQ1.
	function parse(m) {
		if (m.length < 11 || m[0] !== 0xF0 || m[1] !== ROLAND || m[3] !== P.modelId || m[m.length - 1] !== 0xF7) {
			return null;
		}
		if (m[4] !== DT1 && m[4] !== RQ1) {
			return null;
		}
		var body = m.slice(5, m.length - 2);
		return {
			command: m[4] === DT1 ? "DT1" : "RQ1",
			dev: m[2],
			addr: body.slice(0, 4),
			data: body.slice(4),
			valid: checksum(body) === m[m.length - 2]
		};
	}

	// Where does an address point? Only patch areas (else null). Patch blocks: a1 a2 = which patch (03 00 temporary, 11 nn USER),
	// a3 = 00 common or 10/12/14/16 tone 1-4 (with 11/13/15/17 for the carried part of a tone).
	var PATCH_AREAS = [0x02, 0x03, 0x11];   // performance-part temp patches, temp patch, user patches (p.188)

	// Performance blocks: a1 a2 = which performance (01 00 temporary, 10 nn USER 1-32), a3 = 00 common or 10-1F part 1-16.
	function locate(addr) {
		if (addr[0] === 0x01 || (addr[0] === 0x10 && addr[1] < 0x20)) {
			if (addr[2] === 0 && addr[3] < P.blocks.perf.size) {
				return { perf: addr.slice(0, 2), block: "perf", part: null, index: addr[3] };
			}
			if (addr[2] >= 0x10 && addr[2] <= 0x1F && addr[3] < P.blocks.part.size) {
				return { perf: addr.slice(0, 2), block: "part", part: addr[2] - 0x0F, index: addr[3] };
			}
			return null;
		}
		if (PATCH_AREAS.indexOf(addr[0]) < 0) {
			return null;
		}
		var base = toNumber([addr[0], addr[1], 0, 0]);
		var rel = toNumber(addr) - base;
		if (rel < P.blocks.common.size) {
			return { patch: addr.slice(0, 2), block: "common", tone: null, index: rel };
		}
		for (var t = 1; t <= 4; t++) {
			var start = toNumber([0, 0, 0x10 + 2 * (t - 1), 0]);
			if (rel >= start && rel < start + P.blocks.tone.size) {
				return { patch: addr.slice(0, 2), block: "tone", tone: t, index: rel - start };
			}
		}
		return null;
	}

	// Decode a DT1 into parameter values. Works for full blocks and for partial writes; a two-byte
	// parameter is only reported when both bytes are present.
	function decode(msg) {
		var out = [];
		if (!msg || msg.command !== "DT1") {
			return out;
		}
		var where = locate(msg.addr);
		if (!where) {
			return out;
		}
		var list = P[where.block];
		for (var i = 0; i < list.length; i++) {
			var param = list[i];
			var start = param.off - where.index;
			var n = param.bytes || 1;
			if (start < 0 || start + n > msg.data.length) {
				continue;
			}
			var raw = n === 2 ? (msg.data[start] << 4) | msg.data[start + 1] : msg.data[start];
			var v = { block: where.block, tone: where.tone === undefined ? null : where.tone, id: param.id, raw: raw };
			if (where.perf) {
				v.part = where.part;
			}
			out.push(v);
		}
		return out;
	}

	// How the JV shows a raw value: number or text
	function display(block, id, raw) {
		var d = find(block, id).display;
		if (!d) {
			return raw;
		}
		if (d.enum) {
			var e = P.enums[d.enum];
			return raw < e.length ? e[raw] : raw;
		}
		if (d.char) {
			return String.fromCharCode(raw);
		}
		if (d.note) {
			var names = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
			return names[raw % 12] + (Math.floor(raw / 12) - 1);
		}
		return raw * (d.mul === undefined ? 1 : d.mul) + (d.add || 0);
	}

	// Patch name from decoded common values
	function patchName(values) {
		var chars = [];
		for (var i = 1; i <= 12; i++) {
			for (var j = 0; j < values.length; j++) {
				if (values[j].id === "name_" + i) {
					chars.push(String.fromCharCode(values[j].raw));
				}
			}
		}
		return chars.join("");
	}

	// --- device controls (see jv2080_bindings.js) ---------------------------------------------

	// control value -> raw JV value, applying the binding's ops in order
	function fromControl(binding, value) {
		var x = Math.round(value);
		for (var i = 0; i < binding.ops.length; i++) {
			var op = binding.ops[i];
			if (op[0] === "add") {
				x += op[1];
			} else if (op[0] === "div") {
				x = Math.floor(x / op[1]);
			}
		}
		return x;
	}

	// raw JV value -> control value: the ops undone in reverse order. "div" is undone by multiplying,
	// which picks the lowest control value that sends this raw value (e.g. velocity sens in steps of 2).
	function toControl(binding, raw) {
		var x = raw;
		for (var i = binding.ops.length - 1; i >= 0; i--) {
			var op = binding.ops[i];
			if (op[0] === "add") {
				x -= op[1];
			} else if (op[0] === "div") {
				x *= op[1];
			}
		}
		return Math.max(binding.range[0], Math.min(binding.range[1], x));
	}

	// The Wave group menu: 0 INT-A, 1 INT-B, 2..20 = SR-JV80 board 1..19 (type 0 = INT, 2 = EXP)
	function waveGroupToMenu(type, id) {
		if (type === 2) {
			return id >= 1 && id <= 19 ? id + 1 : null;
		}
		return type === 0 && (id === 1 || id === 2) ? id - 1 : null;
	}

	function waveGroupFromMenu(index) {
		return index > 1 ? { type: 2, id: index - 1 } : { type: 0, id: index + 1 };
	}

	// A performance part's patch bank menu: 0 USER, 1-5 PR-A..PR-E (PR-D = GM), 6 CARD, 7..25 expansion board 1..19.
	// Patch Group Type 0 (USER & PRESET) uses Group ID 1 USER, 2 CARD, 3-7 PR-A..PR-E; type 2 (EXP) the board number.
	var PART_GROUP_IDS = [1, 3, 4, 5, 6, 7, 2];

	function partGroupToMenu(type, id) {
		if (type === 2) {
			return id >= 1 && id <= 19 ? id + 6 : null;
		}
		var i = PART_GROUP_IDS.indexOf(id);
		return type === 0 && i >= 0 ? i : null;
	}

	function partGroupFromMenu(index) {
		return index >= 7 ? { type: 2, id: index - 6 } : { type: 0, id: PART_GROUP_IDS[index] };
	}

	return {
		partGroupToMenu: partGroupToMenu,
		partGroupFromMenu: partGroupFromMenu,
		fromControl: fromControl,
		toControl: toControl,
		waveGroupToMenu: waveGroupToMenu,
		waveGroupFromMenu: waveGroupFromMenu,
		checksum: checksum,
		addOffset: addOffset,
		toAddress: toAddress,
		toNumber: toNumber,
		dt1: dt1,
		rq1: rq1,
		patchAddress: patchAddress,
		requestPatch: requestPatch,
		perfAddress: perfAddress,
		requestPerformance: requestPerformance,
		encodeValue: encodeValue,
		setParam: setParam,
		find: find,
		parse: parse,
		locate: locate,
		decode: decode,
		display: display,
		patchName: patchName,
		params: P
	};
})();

if (typeof module !== "undefined") {
	module.exports = JVSysEx;
}
