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
// Write stores what the JV plays now (its temporary patch or performance, by the device's Patch / Perform switch) in
// a USER slot, like the JV's own WRITE: it reads the temporary blocks with RQ1 and, once all have come in, sends them
// to the slot's address (patch common + 4 tones to 11 nn, performance common + 16 parts to 10 nn). It reads the slot
// too and writes only the blocks that differ (nothing if none does). Nothing is written if a block doesn't come back. Afterwards (and after a restore) one written USER block is read back: the JV ignores
// SysEx writes to its USER memory while UTILITY > Protect > System Exclusive Message is ON (manual p.61; not in the
// address map, so only the JV's panel can switch it off), and the status says so.
//
// inlet 0: MIDI bytes from midiin (replies, bulk dumps); messages:
//          askbackup            ask where to save a backup (savedialog), then back up
//          saved <path>         the file chosen in the savedialog (backup or recorded dump)
//          backup <path>        read the whole user memory into <path>
//          restore <path>       check <path> and ask for confirmation (from opendialog)
//          confirm / cancel     go ahead with the restore / stop whatever runs
//          record 0/1           record a bulk dump started on the JV's panel; 0 stops and asks where to save it
//          writeuser <n>        ask for confirmation, then write the current patch / performance to USER:n
//          devmode 0/1          the device's Patch / Perform switch (r ---mode): what Write writes
//          model 0/1/2          JV-2080 / JV-1080 / XP: the patch common size differs (#9)
// outlet 0: SysEx bytes (RQ1 requests, DT1 for restore) for jv_sysex_queue.js
// outlet 1: "set <text>" status line
// outlet 2: "busy 1/0" (Get and Send wait while the library talks to the JV)
// outlet 3: "confirm 1/0" shows/hides the confirmation buttons; "savedialog <name>" asks for a file name;
//           "slotmax 32/128" limits the Write slot box to the mode's USER slots; "slot n" moves it to the USER
//           slot selected in the program block; "script ..." for thispatcher
//           (Confirm / Cancel shown only when needed, the Write label names patch or performance)

autowatch = 1;
inlets = 1;
outlets = 4;
setinletassist(0, "MIDI bytes; backup, restore, writeuser, confirm, cancel, record, savedump, model, devmode");
setoutletassist(0, "SysEx bytes to the queue");
setoutletassist(1, "status text");
setoutletassist(2, "busy 1/0");
setoutletassist(3, "confirm 1/0, savedialog name");

var jsthis = this;
var COMMON_SIZE = [0x4A, 0x48, 0x49];   // patch common per model: JV-2080, JV-1080, XP-50/80
var patchCommon = COMMON_SIZE[0];
var GAP_MS = 20;          // after a reply, before the next request
var TIMEOUT_MS = 600;     // no reply: try once more, then skip the block
var SEND_GAP_MS = 60;     // between DT1 messages of a restore
var WRITE_TIMEOUT_MS = 2000;   // Write: the JV answers late right after loading a performance (~0.8 s, measured)

var mode = null;          // "backup", "restore", "record", "write" (reading) / "send" (writing) or null
var plan = [];            // backup: [address, size] still to request
var done = 0, total = 0, missed = 0, retried = false;
var waiting = null;       // the address (4 bytes) we're waiting for
var data = [];            // backup / record: the DT1 messages received, as byte arrays
var target = null;        // backup: the file to write
var outbox = [];          // restore: DT1 messages still to send
var pendingRestore = null; // restore: { path, messages } until confirmed
var buf = null;           // incoming SysEx bytes
var pendingSave = null;   // what the savedialog's path is for: "backup" or "dump"
var devMode = 0;          // the device's Patch (0) / Perform (1) switch
var pendingWrite = null;  // write: { slot 1-128, perform } until confirmed
var writing = null;       // write: { slot, perform } while it runs
var sentText = "";        // the status line once everything is sent
var check = null;         // a sent USER block, read back afterwards: the JV ignores it while protected
var PROTECTED = "The JV didn't store it: switch off UTILITY > Protect > System Exclusive Message on the JV";
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

// the temporary patch (Patch mode) or performance (Perform mode): [address bytes, size]
function tempPlan(perform, commonSize) {
	var p = [];
	if (perform) {
		p.push([[0x01, 0, 0, 0], 0x44]);
		for (var part = 0; part < 16; part++) {
			p.push([[0x01, 0, 0x10 + part, 0], 0x1A]);
		}
	} else {
		p.push([[0x03, 0, 0, 0], commonSize]);
		for (var t = 0; t < 4; t++) {
			p.push([[0x03, 0, 0x10 + 2 * t, 0], 0x81]);
		}
	}
	return p;
}

// a JV (model 6A) DT1 with a valid checksum?
function isDT1(m) {
	if (m.length < 12 || m[0] !== 0xF0 || m[1] !== 0x41 || m[3] !== 0x6A || m[4] !== 0x12 || m[m.length - 1] !== 0xF7) {
		return false;
	}
	return checksum(m.slice(5, m.length - 2)) === m[m.length - 2];
}

// is this DT1 for the user memory (system, user performances/rhythm sets, user patches) of a JV (model 6A)?
function isMemory(m) {
	return isDT1(m) && ((m[5] === 0x00 && m[6] === 0x00) || m[5] === 0x10 || m[5] === 0x11);
}

// a temporary block's DT1 moved to USER:slot (performance 10 nn, patch 11 nn), same offsets and data
function toUser(m, perform, slot) {
	var body = [perform ? 0x10 : 0x11, slot - 1].concat(m.slice(7, m.length - 2));
	return [0xF0, 0x41, 0x10, 0x6A, 0x12].concat(body, [checksum(body), 0xF7]);
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
	buttons();
}

// Confirm only while something waits for it; Cancel also while a transfer runs
function confirmShown(on) {
	outlet(3, "confirm", on ? 1 : 0);
	buttons();
}

var shown = {};
function buttons() {
	var asking = !!(pendingRestore || pendingWrite);
	show("RestoreNow", asking);
	show("CancelButton", asking || !!mode);
}

function show(name, on) {
	if (shown[name] !== on) {
		shown[name] = on;
		outlet(3, "script", on ? "show" : "hide", name);
	}
}

// the device's Patch / Perform switch, read directly: its value at load can come before this page listens; and
// the program block's selection, read once a second: when it's a USER slot, the Write slot follows it
var modeTask = new Task(readMode, this);
modeTask.interval = 1000;
var lastSelected = null;
function loadbang() {
	buttons();
	modeTask.repeat(-1, 1500);
}

// the USER slot the program block has selected (performance 1-32 / patch 1-128), or 0 for another bank
function selectedSlot() {
	var top = jsthis.patcher ? jsthis.patcher.parentpatcher : null;
	var block = top ? top.getnamed("ProgramBlock") : null;
	var inner = block ? block.subpatcher() : null;
	if (!inner) {
		return 0;
	}
	function value(name) {
		var c = inner.getnamed(name);
		var v = c ? c.getvalueof() : -1;
		return Math.round(v instanceof Array ? v[0] : v);
	}
	if (devMode) {
		return value("PerfBank") === 0 ? value("PerfNumber") : 0;   // USER is the first performance bank
	}
	return value("StoredBank") === 0 ? value("ProgramChange[1]") : 0;
}

function followSelection() {
	var n = selectedSlot();
	var key = devMode + ":" + n;
	if (key !== lastSelected) {
		lastSelected = key;
		if (n >= 1 && n <= (devMode ? 32 : 128)) {
			outlet(3, "slot", n);
		}
	}
}

function readMode() {
	var top = jsthis.patcher ? jsthis.patcher.parentpatcher : null;
	var sw = top ? top.getnamed("ModeSwitch") : null;
	if (sw) {
		var v = sw.getvalueof();
		devmode(v instanceof Array ? v[0] : v);
	}
	if (!mode && !pendingWrite) {
		followSelection();
	}
}

function model(m) {
	patchCommon = COMMON_SIZE[m] || COMMON_SIZE[0];
}

function devmode(m) {
	devMode = m ? 1 : 0;
	outlet(3, "slotmax", devMode ? 32 : 128);   // the slot box: USER 1-32 performances, 1-128 patches
	outlet(3, "script", "sendbox", "WriteLabel", "set", devMode ? "Write performance to USER" : "Write patch to USER");
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
		if (mode === "write") {
			finishWrite();
		} else {
			finishBackup();
		}
		return;
	}
	var r = rq1(plan[0][0], plan[0][1]);
	waiting = plan[0][0];
	for (var i = 0; i < r.length; i++) {
		outlet(0, r[i]);
	}
	timeoutTask.schedule(mode === "write" ? WRITE_TIMEOUT_MS : TIMEOUT_MS);
}

function timedOut() {
	if (mode === "verify") {
		verified(sentText + " (no reply to check it)");
		return;
	}
	if (mode !== "backup" && mode !== "write") {
		return;
	}
	if (!retried) {
		retried = true;
		request();
		return;
	}
	retried = false;
	if (mode === "write") {   // never write half a patch / performance
		mode = null;
		waiting = null;
		writing = null;
		busy(false);
		status("No reply from the JV: nothing written");
		return;
	}
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
	pendingWrite = null;
	pendingRestore = { path: path, messages: mine };
	status("Restore " + path.slice(path.lastIndexOf("/") + 1) + " (" + mine.length + " blocks)? It overwrites the JV's user memory; a backup is saved first.");
	confirmShown(1);
}

function confirm() {
	if (pendingWrite && !mode) {
		var w = pendingWrite;
		pendingWrite = null;
		confirmShown(0);
		startWrite(w);
		return;
	}
	if (!pendingRestore || mode) {
		return;
	}
	var r = pendingRestore;
	pendingRestore = null;
	confirmShown(0);
	var folder = r.path.slice(0, r.path.lastIndexOf("/") + 1);
	startBackup(folder + "JV-2080_auto_backup_" + stamp() + ".syx", function () {
		startRestore(r.messages);
	});
}

function startRestore(list) {
	pendingWrite = null;
	startSend(list, "restore", "Restored " + list.length + " blocks to the JV");
}

function startSend(list, kind, text) {
	mode = kind;
	outbox = list.slice();
	total = outbox.length;
	done = 0;
	sentText = text;
	check = null;
	for (var i = 0; i < list.length && !check; i++) {
		if (list[i][5] === 0x10 || list[i][5] === 0x11) {   // user performances / patches: what Protect guards
			check = list[i];
		}
	}
	busy(true);
	sendNext();
}

function sendNext() {
	if (mode !== "restore" && mode !== "send") {
		return;
	}
	if (!outbox.length) {
		writing = null;
		if (check) {
			mode = "verify";
			waiting = check.slice(5, 9);
			var r = rq1(waiting, check.length - 11);
			for (var k = 0; k < r.length; k++) {
				outlet(0, r[k]);
			}
			timeoutTask.schedule(WRITE_TIMEOUT_MS);
			return;
		}
		mode = null;
		busy(false);
		status(sentText);
		return;
	}
	var m = outbox.shift();
	for (var i = 0; i < m.length; i++) {
		outlet(0, m[i]);
	}
	done++;
	if (mode === "restore" && done % 25 === 0) {
		status("Restoring " + done + " / " + total);
	}
	sendTask.schedule(SEND_GAP_MS);
}

// --- write the current patch / performance to a USER slot

function writeuser(n) {
	if (mode) {
		status("Busy: cancel first");
		return;
	}
	readMode();   // the switch as it is now
	var perform = devMode === 1, max = perform ? 32 : 128, slot = Math.round(n);
	if (!(slot >= 1 && slot <= max)) {
		status("USER slots are 1-" + max);
		return;
	}
	pendingRestore = null;
	pendingWrite = { slot: slot, perform: perform };
	status("Write the JV's current " + (perform ? "performance" : "patch") + " to USER " + slot + "? It replaces what's stored there.");
	confirmShown(1);
}

function startWrite(w) {
	mode = "write";
	writing = w;
	plan = tempPlan(w.perform, patchCommon);
	var n = plan.length;
	for (var i = 0; i < n; i++) {   // then the slot as it is: only blocks that differ are written
		plan.push([[w.perform ? 0x10 : 0x11, w.slot - 1].concat(plan[i][0].slice(2)), plan[i][1]]);
	}
	total = plan.length;
	done = 0;
	missed = 0;
	retried = false;
	data = [];
	busy(true);
	status("Reading the current " + (w.perform ? "performance" : "patch"));
	request();
}

// every temporary block came in: send it to the slot
function finishWrite() {
	waiting = null;
	var half = data.length / 2, list = [];
	for (var i = 0; i < half; i++) {
		var m = toUser(data[i], writing.perform, writing.slot), old = data[half + i];
		if (m.slice(3).join(",") !== old.slice(3).join(",")) {   // the device ID byte aside
			list.push(m);
		}
	}
	data = [];
	var what = writing.perform ? "performance" : "patch";
	if (!list.length) {
		mode = null;
		status("USER " + writing.slot + " already holds this " + what + ": nothing to write");
		writing = null;
		busy(false);
		return;
	}
	// the read-back (sendNext) checks a block that changed, so it shows whether the JV stored it
	startSend(list, "send", "Wrote the " + what + " to USER " + writing.slot);
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
	check = null;
	writing = null;
	afterBackup = null;
	if (pendingRestore || pendingWrite) {
		pendingRestore = null;
		pendingWrite = null;
		confirmShown(0);
	}
	busy(false);
	status(was ? "Cancelled" + (was === "restore" ? ": the JV's memory is partly restored" : was === "send" ? ": the USER slot is partly written" : "") : "");
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

function verified(text) {
	timeoutTask.cancel();
	mode = null;
	waiting = null;
	check = null;
	busy(false);
	status(text);
}

function received(m) {
	if (mode === "verify" && isDT1(m) && waiting && m[5] === waiting[0] && m[6] === waiting[1] && m[7] === waiting[2] && m[8] === waiting[3]) {
		verified(m.join(",") === check.slice(0, 2).concat(m.slice(2, 5), check.slice(5)).join(",") ? sentText : PROTECTED);
		return;
	}
	if (mode === "write" && isDT1(m) && waiting && m[5] === waiting[0] && m[6] === waiting[1] && m[7] === waiting[2] && m[8] === waiting[3]) {
		timeoutTask.cancel();
		retried = false;
		data.push(m);
		plan.shift();
		waiting = null;
		stepTask.schedule(GAP_MS);
		return;
	}
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
	modeTask.freepeer();
	stepTask.freepeer();
	timeoutTask.freepeer();
	sendTask.freepeer();
}
