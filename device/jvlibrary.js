// Library page (#39): backup and restore of the JV's whole user memory, and recording a bulk dump started on the
// JV. One instance, in JV_LIBRARY.maxpat.
//
// Backup reads every block of the user memory with RQ1, one request at a time like Get: system (common and scale
// tunes), the 32 user performances, the 2 user rhythm sets and the 128 user patches (manual pp.188-191). The DT1
// replies are written to a .syx file exactly as the JV sends them, which is also the format of the JV's own bulk
// dump, so other librarians can read the files and the JV can read them back.
//
// Restore sends a .syx file back to the JV, but only messages for those areas (other models' or devices' data is
// skipped). Before it overwrites anything it saves an automatic backup of the current memory next to the file.
//
// inlet 0: MIDI bytes from midiin (replies, bulk dumps); messages:
//          askbackup            ask where to save a backup (savedialog), then back up
//          saved <path>         the file chosen in the savedialog (backup or recorded dump)
//          backup <path>        read the whole user memory into <path>
//          restore <path>       check <path> and ask for confirmation (from opendialog)
//          confirm / cancel     go ahead with the restore / stop whatever runs
//          record 0/1           record a bulk dump started on the JV's panel; 0 stops and asks where to save it
//          model 0/1/2          JV-2080 / JV-1080 / XP: the patch common size differs (#9)
// outlet 0: SysEx bytes (RQ1 requests, DT1 for restore) for jv_sysex_queue.js
// outlet 1: "set <text>" status line
// outlet 2: "busy 1/0" (Get and Send wait while the library talks to the JV)
// outlet 3: "confirm 1/0" shows/hides the confirmation buttons; "savedialog <name>" asks for a file name

autowatch = 1;
inlets = 1;
outlets = 4;
setinletassist(0, "MIDI bytes; backup, restore, confirm, cancel, record, savedump, model");
setoutletassist(0, "SysEx bytes to the queue");
setoutletassist(1, "status text");
setoutletassist(2, "busy 1/0");
setoutletassist(3, "confirm 1/0, savedialog name");

var COMMON_SIZE = [0x4A, 0x48, 0x49];   // patch common per model: JV-2080, JV-1080, XP-50/80
var patchCommon = COMMON_SIZE[0];
var GAP_MS = 20;          // after a reply, before the next request
var TIMEOUT_MS = 600;     // no reply: try once more, then skip the block
var SEND_GAP_MS = 60;     // between DT1 messages of a restore

var mode = null;          // "backup", "restore", "record" or null
var plan = [];            // backup: [address, size] still to request
var done = 0, total = 0, missed = 0, retried = false;
var waiting = null;       // the address (4 bytes) we're waiting for
var data = [];            // backup / record: the DT1 messages received, as byte arrays
var target = null;        // backup: the file to write
var outbox = [];          // restore: DT1 messages still to send
var pendingRestore = null; // restore: { path, messages } until confirmed
var buf = null;           // incoming SysEx bytes
var pendingSave = null;   // what the savedialog's path is for: "backup" or "dump"
var stepTask = new Task(step, this);
var timeoutTask = new Task(timedOut, this);
var sendTask = new Task(sendNext, this);

function toAddress(n) {
	return [(n >> 21) & 0x7F, (n >> 14) & 0x7F, (n >> 7) & 0x7F, n & 0x7F];
}

function toNumber(a) {
	return (a[0] << 21) | (a[1] << 14) | (a[2] << 7) | a[3];
}

function checksum(body) {
	var sum = 0;
	for (var i = 0; i < body.length; i++) {
		sum += body[i];
	}
	return (128 - sum % 128) % 128;
}

function rq1(addr, size) {
	var body = addr.concat(toAddress(size));
	return [0xF0, 0x41, 0x10, 0x6A, 0x11].concat(body, [checksum(body), 0xF7]);
}

// Every block of the user memory, in the JV's order: [address bytes, size]
function memoryPlan(commonSize) {
	var p = [[[0, 0, 0, 0], 0x62]];                       // system common
	for (var s = 0x10; s <= 0x20; s++) {
		p.push([[0, 0, s, 0], 0x0C]);                     // part 1-16 scale tune, patch mode scale tune
	}
	for (var n = 0; n < 32; n++) {                         // user performances
		p.push([[0x10, n, 0, 0], 0x44]);
		for (var part = 0; part < 16; part++) {
			p.push([[0x10, n, 0x10 + part, 0], 0x1A]);
		}
	}
	for (var r = 0; r < 2; r++) {                          // user rhythm sets: common + notes for keys 35-98
		p.push([[0x10, 0x40 + r, 0, 0], 0x0C]);
		for (var key = 35; key <= 98; key++) {
			p.push([[0x10, 0x40 + r, key, 0], 0x3A]);
		}
	}
	for (n = 0; n < 128; n++) {                            // user patches: common + 4 tones
		p.push([[0x11, n, 0, 0], commonSize]);
		for (var t = 0; t < 4; t++) {
			p.push([[0x11, n, 0x10 + 2 * t, 0], 0x81]);
		}
	}
	return p;
}

// is this DT1 for the user memory (system, user performances/rhythm sets, user patches) of a JV (model 6A)?
function isMemory(m) {
	if (m.length < 12 || m[0] !== 0xF0 || m[1] !== 0x41 || m[3] !== 0x6A || m[4] !== 0x12 || m[m.length - 1] !== 0xF7) {
		return false;
	}
	var body = m.slice(5, m.length - 2);
	if (checksum(body) !== m[m.length - 2]) {
		return false;
	}
	return (m[5] === 0x00 && m[6] === 0x00) || m[5] === 0x10 || m[5] === 0x11;
}

// split raw bytes (a file) into SysEx messages
function messages(bytes) {
	var out = [], cur = null;
	for (var i = 0; i < bytes.length; i++) {
		var b = bytes[i];
		if (b === 0xF0) {
			cur = [b];
		} else if (cur) {
			cur.push(b);
			if (b === 0xF7) {
				out.push(cur);
				cur = null;
			}
		}
	}
	return out;
}

function status(text) {
	outlet(1, "set", text);
}

function busy(on) {
	outlet(2, "busy", on ? 1 : 0);
}

function model(m) {
	patchCommon = COMMON_SIZE[m] || COMMON_SIZE[0];
}

// --- backup

function askbackup() {
	if (mode) {
		status("Busy: cancel first");
		return;
	}
	pendingSave = "backup";
	outlet(3, "savedialog", "JV-2080_backup_" + stamp() + ".syx");
}

// the savedialog's answer
function saved(path) {
	var what = pendingSave;
	pendingSave = null;
	if (what === "backup") {
		backup(path);
	} else if (what === "dump") {
		savedump(path);
	}
}

function backup(path) {
	if (mode) {
		status("Busy: cancel first");
		return;
	}
	startBackup(String(path), null);
}

// then: what to do when the backup is written (a restore waiting for its automatic backup)
var afterBackup = null;

function startBackup(path, then) {
	mode = "backup";
	target = path;
	afterBackup = then;
	plan = memoryPlan(patchCommon);
	total = plan.length;
	done = 0;
	missed = 0;
	data = [];
	busy(true);
	request();
}

function request() {
	if (!plan.length) {
		finishBackup();
		return;
	}
	var r = rq1(plan[0][0], plan[0][1]);
	waiting = plan[0][0];
	for (var i = 0; i < r.length; i++) {
		outlet(0, r[i]);
	}
	timeoutTask.schedule(TIMEOUT_MS);
}

function timedOut() {
	if (mode !== "backup") {
		return;
	}
	if (!retried) {
		retried = true;
		request();
		return;
	}
	retried = false;
	missed++;
	plan.shift();
	done++;
	request();
}

function step() {
	request();
}

function finishBackup() {
	waiting = null;
	var ok = write(target, data);
	var name = target.slice(target.lastIndexOf("/") + 1);
	mode = null;
	busy(false);
	if (!ok) {
		status("Couldn't write " + name);
		afterBackup = null;
		return;
	}
	status("Saved " + name + ": " + data.length + " blocks" + (missed ? ", " + missed + " without reply" : ""));
	if (afterBackup) {
		var then = afterBackup;
		afterBackup = null;
		then();
	}
}

// --- restore

function restore(path) {
	if (mode) {
		status("Busy: cancel first");
		return;
	}
	path = String(path);
	var all = messages(read(path));
	var mine = [];
	for (var i = 0; i < all.length; i++) {
		if (isMemory(all[i])) {
			mine.push(all[i]);
		}
	}
	if (!mine.length) {
		status("No JV user memory data in " + path.slice(path.lastIndexOf("/") + 1));
		return;
	}
	pendingRestore = { path: path, messages: mine };
	status("Restore " + path.slice(path.lastIndexOf("/") + 1) + " (" + mine.length + " blocks)? It overwrites the JV's user memory; a backup is saved first.");
	outlet(3, "confirm", 1);
}

function confirm() {
	if (!pendingRestore || mode) {
		return;
	}
	var r = pendingRestore;
	pendingRestore = null;
	outlet(3, "confirm", 0);
	var folder = r.path.slice(0, r.path.lastIndexOf("/") + 1);
	startBackup(folder + "JV-2080_auto_backup_" + stamp() + ".syx", function () {
		startRestore(r.messages);
	});
}

function startRestore(list) {
	mode = "restore";
	outbox = list.slice();
	total = outbox.length;
	done = 0;
	busy(true);
	sendNext();
}

function sendNext() {
	if (mode !== "restore") {
		return;
	}
	if (!outbox.length) {
		mode = null;
		busy(false);
		status("Restored " + total + " blocks to the JV");
		return;
	}
	var m = outbox.shift();
	for (var i = 0; i < m.length; i++) {
		outlet(0, m[i]);
	}
	done++;
	if (done % 25 === 0) {
		status("Restoring " + done + " / " + total);
	}
	sendTask.schedule(SEND_GAP_MS);
}

// --- recording a bulk dump started on the JV

function record(on) {
	if (on) {
		if (mode) {
			status("Busy: cancel first");
			return;
		}
		mode = "record";
		data = [];
		busy(true);
		status("Recording: start Utility > Data Transfer > Bulk Dump on the JV, then press Record again");
	} else if (mode === "record") {
		mode = null;
		busy(false);
		if (!data.length) {
			status("Nothing received");
			return;
		}
		status("Received " + data.length + " blocks: choose where to save them");
		pendingSave = "dump";
		outlet(3, "savedialog", "JV-2080_bulk_dump_" + stamp() + ".syx");
	}
}

function savedump(path) {
	path = String(path);
	if (!data.length) {
		return;
	}
	var name = path.slice(path.lastIndexOf("/") + 1);
	status(write(path, data) ? "Saved " + name + ": " + data.length + " blocks" : "Couldn't write " + name);
	data = [];
}

function cancel() {
	stepTask.cancel();
	timeoutTask.cancel();
	sendTask.cancel();
	var was = mode;
	mode = null;
	waiting = null;
	afterBackup = null;
	if (pendingRestore) {
		pendingRestore = null;
		outlet(3, "confirm", 0);
	}
	busy(false);
	status(was ? "Cancelled" + (was === "restore" ? ": the JV's memory is partly restored" : "") : "");
}

// --- incoming MIDI

function msg_int(b) {
	if (b === 0xF0) {
		buf = [b];
	} else if (buf) {
		buf.push(b);
		if (b === 0xF7) {
			var m = buf;
			buf = null;
			received(m);
		}
	}
}

function list() {
	var a = arrayfromargs(arguments);
	for (var i = 0; i < a.length; i++) {
		msg_int(a[i]);
	}
}

function received(m) {
	if (!isMemory(m)) {
		return;
	}
	if (mode === "record") {
		data.push(m);
		if (data.length % 50 === 0) {
			status("Recording: " + data.length + " blocks received");
		}
		return;
	}
	if (mode === "backup" && waiting && m[5] === waiting[0] && m[6] === waiting[1] && m[7] === waiting[2] && m[8] === waiting[3]) {
		timeoutTask.cancel();
		retried = false;
		data.push(m);
		plan.shift();
		done++;
		waiting = null;
		if (done % 25 === 0) {
			status("Backing up " + done + " / " + total);
		}
		stepTask.schedule(GAP_MS);
	}
}

// --- files

// file names without spaces: the savedialog gets the default name as one symbol
function stamp() {
	var d = new Date();
	function two(n) {
		return (n < 10 ? "0" : "") + n;
	}
	return d.getFullYear() + "-" + two(d.getMonth() + 1) + "-" + two(d.getDate()) + "_" + two(d.getHours()) + two(d.getMinutes());
}

function write(path, msgs) {
	var f = new File(path, "write", "????");
	if (!f.isopen) {
		return false;
	}
	f.eof = 0;
	for (var i = 0; i < msgs.length; i++) {
		f.writebytes(msgs[i]);
	}
	f.close();
	return true;
}

function read(path) {
	var f = new File(path, "read");
	if (!f.isopen) {
		return [];
	}
	var bytes = [];
	while (f.position < f.eof) {
		var chunk = f.readbytes(Math.min(4096, f.eof - f.position));
		if (!chunk || !chunk.length) {
			break;
		}
		bytes = bytes.concat(chunk);
	}
	f.close();
	return bytes;
}

function notifydeleted() {
	stepTask.freepeer();
	timeoutTask.freepeer();
	sendTask.freepeer();
}
