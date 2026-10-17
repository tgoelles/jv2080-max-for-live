// One JV parameter sender: builds a Roland DT1 from a value. Replaces the device's sxformat senders.
//
//   js jvparam.js a1 a2 a3 a4 [bytes]   e.g. "js jvparam.js 3 0 -1 81" = Cutoff of the section's tone
//
// a3 = -1 means "tone address comes in on inlet 1" (16/18/20/22 for tones 1-4). Until it has arrived
// nothing is sent, so values restored at load can't land on the wrong address.
// bytes = 2: the value is sent as two 4-bit nibbles, high first (wave number, patch tempo).
//
// inlet 0: int value -> send it; bang -> send the last value again (push to device)
// inlet 1: int -> tone address byte (a3)
// outlet 0: SysEx bytes, one at a time, for jv_sysex_queue.js (which sets the real device ID)
//
// Self-contained on purpose: the device has ~80 of these, and freezing embeds every include() once per
// instance (an include here made the frozen device 9.5 MB). The controls' ranges are checked against the
// address map by tests/jvsysex.test.js instead.

autowatch = 1;
inlets = 2;
outlets = 1;
setinletassist(0, "value (int), or bang to send again");
setinletassist(1, "tone address byte 16/18/20/22");
setoutletassist(0, "SysEx bytes");

var addr = [0, 0, 0, 0];
for (var i = 0; i < 4; i++) {
	addr[i] = jsarguments.length > i + 1 ? Math.round(jsarguments[i + 1]) : 0;
}
var nibbles = jsarguments.length > 5 && Math.round(jsarguments[5]) === 2;
var value = null;

function msg_int(v) {
	if (inlet === 1) {
		addr[2] = v;
		return;
	}
	value = v;
	send();
}

function msg_float(v) {
	msg_int(Math.round(v));
}

function bang() {
	if (inlet === 0 && value !== null) {
		send();
	}
}

function send() {
	if (addr[2] < 0) {
		return;
	}
	var data = nibbles ? [(clamp(value, 255) >> 4) & 0x0F, clamp(value, 255) & 0x0F] : [clamp(value, 127)];
	var body = addr.concat(data);
	var sum = 0;
	for (var i = 0; i < body.length; i++) {
		sum += body[i];
	}
	var bytes = [0xF0, 0x41, 0x10, 0x6A, 0x12].concat(body, [(128 - sum % 128) % 128, 0xF7]);
	for (var b = 0; b < bytes.length; b++) {
		outlet(0, bytes[b]);
	}
}

function clamp(v, max) {
	return Math.max(0, Math.min(max, v));
}
