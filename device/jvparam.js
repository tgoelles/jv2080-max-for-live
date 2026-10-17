// One JV parameter sender: builds a Roland DT1 from a value. Replaces the device's sxformat senders.
//
//   js jvparam.js a1 a2 a3 a4     e.g. "js jvparam.js 3 0 -1 81" = Cutoff of the section's tone
//
// a3 = -1 means "tone address comes in on inlet 1" (16/18/20/22 for tones 1-4). Until it has arrived
// nothing is sent, so values restored at load can't land on the wrong address.
//
// inlet 0: int value -> send it; bang -> send the last value again (push to device)
// inlet 1: int -> tone address byte (a3)
// outlet 0: SysEx bytes, one at a time, for jv_sysex_queue.js (which sets the real device ID)
//
// Inside a patch area (temporary/user patch) the value is checked against the address map: clamped to
// the parameter's range and split into nibbles where the map says so (wave number, patch tempo).
// Other addresses (system settings) send the value as one 7-bit byte.

include("jv2080_params.js");
include("jvsysex.js");

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
	var where = JVSysEx.locate(addr);
	var param = null;
	if (where) {
		var list = JVSysEx.params[where.block];
		for (var i = 0; i < list.length; i++) {
			if (list[i].off === where.index) {
				param = list[i];
			}
		}
	}
	var data = param ? JVSysEx.encodeValue(param, value) : [Math.max(0, Math.min(127, value))];
	var bytes = JVSysEx.dt1(0x10, addr, data);
	for (var b = 0; b < bytes.length; b++) {
		outlet(0, bytes[b]);
	}
}
