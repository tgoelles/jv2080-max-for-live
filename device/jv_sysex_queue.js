// Paces outgoing SysEx so the JV's MIDI input buffer doesn't overflow.
//
// inlet 0: MIDI bytes passed straight through (notes etc. from midiin)
// inlet 1: SysEx bytes (F0 ... F7) from the sxformat senders; queued and sent
//          one message every `interval` ms
// outlet 0: MIDI bytes to midiout
//
// A queued DT1 message is replaced in place by a newer one for the same
// address, so moving a knob quickly doesn't build up a backlog.
//
// Messages: "interval <ms>" sets the gap (default 10), "clear" empties the queue.

autowatch = 1;
inlets = 2;
outlets = 1;
setinletassist(0, "MIDI bytes to pass through");
setinletassist(1, "SysEx bytes to queue");
setoutletassist(0, "MIDI bytes to midiout");

var gap = 10;
var queue = [];
var current = null;
var busy = false;
var task = new Task(next, this);

function msg_int(b) {
	if (inlet === 0) {
		outlet(0, b);
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

function clear() {
	queue = [];
	current = null;
}

function notifydeleted() {
	task.cancel();
	task.freepeer();
}
