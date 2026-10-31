// Paces outgoing SysEx so the JV's MIDI input buffer doesn't overflow.
//
// inlet 0: MIDI bytes passed straight through (notes etc. from midiin). Incoming SysEx is
//          dropped, so the JV's replies to a read-back are never echoed back to it.
// inlet 1: SysEx bytes (F0 ... F7) from the jvparam senders; queued and sent
//          one message every `interval` ms
// outlet 0: MIDI bytes to midiout
//
// A queued DT1 message is replaced in place by a newer one for the same
// address, so moving a knob quickly doesn't build up a backlog.
//
// The senders all write device byte 0x10; the queue rewrites it in every
// Roland 0x6A message to the device ID set with "deviceid".
//
// Messages: "interval <ms>" sets the gap (default 10), "clear" empties the queue,
// "deviceid <17-32>" sets the JV's Device ID as shown on its display (default 17),
// "mute 1" / "mute 0" drops SysEx arriving on inlet 1 in between (used while the read-back
// updates the controls, so the received values aren't sent back).
// "patchbase a1 a2": where the patch pages' edits go. Default 03 00 (Patch mode's temporary patch); 02 <part-1>
// while a performance part's patch is edited (Perform mode, Part page -> Edit patch). The senders always write
// 03 00; DT1 and RQ1 addresses starting 03 00 are moved to the base, with the checksum recomputed.

autowatch = 1;
inlets = 2;
outlets = 1;
setinletassist(0, "MIDI bytes to pass through");
setinletassist(1, "SysEx bytes to queue");
setoutletassist(0, "MIDI bytes to midiout");

var gap = 10;
var dev = 0x10;
var queue = [];
var current = null;
var busy = false;
var inSysex = false;   // passthrough is inside an incoming SysEx message
var muted = false;
var base = [3, 0];
var task = new Task(next, this);

function msg_int(b) {
	if (inlet === 0) {
		if (b === 0xF0) {
			inSysex = true;
		} else if (inSysex && b < 0xF8 && (b < 0x80 || b === 0xF7)) {
			if (b === 0xF7) {
				inSysex = false;
			}
		} else {
			if (b >= 0x80 && b < 0xF8) {
				inSysex = false;   // any other status byte ends a broken SysEx
			}
			outlet(0, b);
		}
		return;
	}
	if (muted) {
		return;
	}
	if (b === 0xF0) {
		current = [b];
		return;
	}
	if (current === null) {
		return;
	}
	current.push(b);
	if (b === 0xF7) {
		enqueue(current);
		current = null;
	}
}

function list() {
	var a = arrayfromargs(arguments);
	for (var i = 0; i < a.length; i++) {
		msg_int(a[i]);
	}
}

function enqueue(m) {
	if (m.length > 4 && m[1] === 0x41 && m[3] === 0x6A) {
		m[2] = dev;
		if (m.length > 10 && (m[4] === 0x12 || m[4] === 0x11) && m[5] === 3 && m[6] === 0 && (base[0] !== 3 || base[1] !== 0)) {
			m[5] = base[0];
			m[6] = base[1];
			var sum = 0;
			for (var k = 5; k < m.length - 2; k++) {
				sum += m[k];
			}
			m[m.length - 2] = (128 - sum % 128) % 128;
		}
	}
	// Roland DT1: F0 41 dev 6A 12 a1 a2 a3 a4 ... -> key on dev/model/address
	var key = (m.length > 9 && m[1] === 0x41 && m[4] === 0x12) ? m.slice(2, 9).join(" ") : null;
	if (key !== null) {
		for (var i = 0; i < queue.length; i++) {
			if (queue[i].key === key) {
				queue[i].bytes = m;
				return;
			}
		}
	}
	queue.push({ key: key, bytes: m });
	if (!busy) {
		next();
	}
}

function next() {
	if (queue.length === 0) {
		busy = false;
		return;
	}
	busy = true;
	var m = queue.shift().bytes;
	for (var i = 0; i < m.length; i++) {
		outlet(0, m[i]);
	}
	task.schedule(gap);
}

function interval(ms) {
	gap = Math.max(1, ms);
}

function deviceid(id) {
	// The JV shows Device ID 17-32; on the wire that is 0x10-0x1F.
	var d = Math.round(id) - 1;
	if (d >= 0x10 && d <= 0x1F) {
		dev = d;
	} else {
		post("jv_sysex_queue: device ID must be 17-32, got " + id + "\n");
	}
}

function patchbase(a1, a2) {
	base = [Math.round(a1), Math.round(a2)];
}

function mute(on) {
	muted = !!on;
	current = null;
}

function clear() {
	queue = [];
	current = null;
}

function notifydeleted() {
	task.cancel();
	task.freepeer();
}
