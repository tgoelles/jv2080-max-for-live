// Parts from Live tracks (Parts page, one instance): which Live tracks play which JV part, and when.
//
// The device's own track sends to the JV's port (MIDI To). Every other MIDI track whose MIDI To is the same port, on a
// channel, plays the parts listening on that channel. (A track routed to the device's track instead plays on that
// track's channel, not its own, so it isn't counted.) Each part shows the name of the track(s) playing it (P<n>Track,
// a live.text below the Parts page's black area), lit in the track's Live colour while such a track plays (its MIDI
// meter, output_meter_level, read 10 times a second). Read every 2 s, so renamed, re-coloured or re-routed tracks and changed part channels
// follow by themselves.
//
// inlet 0: "start" (once Live's API is ready, after load), "scan" (read again now)
// The controls are reached by varname: P<n>Channel (read), P<n>Track (label).

autowatch = 1;
inlets = 1;
outlets = 0;
setinletassist(0, "start, scan");

var jsthis = this;
var LABEL = 11;  // characters that fit in a strip
var POLL_MS = 2000;

var poll = new Task(scan, this);
poll.interval = POLL_MS;
var METER_MS = 100;  // how often the playing tracks' meters are read
var meterTask = new Task(readMeters, this);
meterTask.interval = METER_MS;
var meters = {};     // track id -> {api, parts: [part numbers], on}
var labels = {};     // part -> text shown
var lit = {};        // part -> lit
var described = "";  // the routing last posted to the Max console

function start() {
	scan();
	poll.repeat();
	meterTask.repeat();
}

// the port and channel a track sends to: {port, channel 1-16 or 0 (all / none / a track)}
function routing(track) {
	var type = dict(track.get("output_routing_type"), "output_routing_type");
	var chan = dict(track.get("output_routing_channel"), "output_routing_channel");
	var m = /^\s*(?:ch\.?\s*)?(\d{1,2})\s*$/i.exec(chan.display_name || "");
	return { port: type.display_name || "", channelName: chan.display_name || "", channel: m ? +m[1] : 0 };
}

// a Live API dict property comes as JSON text, possibly wrapped in {"<property>": {...}}
function dict(v, key) {
	var s = v instanceof Array ? v.join(" ") : String(v);
	var i = s.indexOf("{");
	var d = {};
	try {
		d = i >= 0 ? JSON.parse(s.slice(i)) : {};
	} catch (e) {
		return {};
	}
	return d[key] && typeof d[key] === "object" ? d[key] : d;
}

function str(v) {
	return (v instanceof Array ? v.join(" ") : String(v)).replace(/^"|"$/g, "");
}

// the tracks sending to the JV (not the device's own track): [{id, index, name, channel}]
function jvTracks() {
	var own = new LiveAPI("this_device canonical_parent");
	var port = routing(own).port;
	var out = [], seen = [];
	if (!port) {
		return out;
	}
	var set = new LiveAPI("live_set");
	var n = set.getcount("tracks");
	for (var i = 0; i < n; i++) {
		var t = new LiveAPI("live_set tracks " + i);
		if (t.id === own.id || +str(t.get("has_midi_output")) !== 1) {
			continue;
		}
		var r = routing(t);
		var name = str(t.get("name"));
		seen.push(name + " -> " + r.port + " / " + r.channelName);
		if (r.port === port && r.channel >= 1 && r.channel <= 16) {
			out.push({ id: t.id, index: i, name: name, channel: r.channel, color: +str(t.get("color")) || 0 });
		}
	}
	var text = "jvtracks: device track -> " + port + "; " + seen.join(", ");
	if (text !== described) {
		described = text;
		post(text + "\n");   // what Live reports, to check the routing
	}
	return out;
}

function control(name) {
	return jsthis.patcher.getnamed(name);
}

function value(obj) {
	var v = obj.getvalueof();
	return Math.round(v instanceof Array ? v[0] : v);
}

function scan() {
	var tracks = jvTracks();
	var channelOf = {};
	for (var p = 1; p <= 16; p++) {
		var c = control("P" + p + "Channel");
		channelOf[p] = c ? value(c) : p;
	}
	for (p = 1; p <= 16; p++) {
		var names = [], color = 0;
		for (var i = 0; i < tracks.length; i++) {
			if (tracks[i].channel === channelOf[p]) {
				names.push(tracks[i].name);
				color = color || tracks[i].color;
			}
		}
		var text = names.join("+");
		text = text.length > LABEL ? text.slice(0, LABEL) : text;
		var key = text + "|" + color;
		if (labels[p] !== key) {
			labels[p] = key;
			var label = control("P" + p + "Track");
			if (label) {
				label.message("text", text);
				label.message("texton", text);
				var rgb = [((color >> 16) & 255) / 255, ((color >> 8) & 255) / 255, (color & 255) / 255, 1.0];
				label.message(["bgoncolor"].concat(rgb));
				label.message(["activebgoncolor"].concat(rgb));
			}
		}
	}
	// the meter of each track that plays a part (readMeters)
	var keep = {};
	for (i = 0; i < tracks.length; i++) {
		var t = tracks[i], parts = [];
		for (p = 1; p <= 16; p++) {
			if (channelOf[p] === t.channel) {
				parts.push(p);
			}
		}
		keep[t.id] = true;
		if (!meters[t.id]) {
			meters[t.id] = { parts: parts, on: false, name: t.name, seen: false, api: new LiveAPI("live_set tracks " + t.index) };
		}
		meters[t.id].parts = parts;
	}
	for (var id in meters) {
		if (!keep[id]) {
			delete meters[id];
		}
	}
	light();
}

// the MIDI meter of each track that plays a part (read, not observed: Live's change notifications for meters
// didn't light anything on hardware)
function readMeters() {
	var changed = false;
	for (var id in meters) {
		var m = meters[id];
		var level = +str(m.api.get("output_meter_level")) || 0;
		var on = level > 0.001;
		if (on && !m.seen) {
			m.seen = true;
			post("jvtracks: " + m.name + " plays (meter " + level.toFixed(2) + ")\n");
		}
		if (on !== m.on) {
			m.on = on;
			changed = true;
		}
	}
	if (changed) {
		light();
	}
}

// a part's label is lit (in its track's colour) while any track playing it plays
function light() {
	var now = {};
	for (var id in meters) {
		if (meters[id].on) {
			for (var k = 0; k < meters[id].parts.length; k++) {
				now[meters[id].parts[k]] = true;
			}
		}
	}
	for (var p = 1; p <= 16; p++) {
		if (!!now[p] !== !!lit[p]) {
			lit[p] = !!now[p];
			var label = control("P" + p + "Track");
			if (label) {
				label.message("set", lit[p] ? 1 : 0);
			}
		}
	}
}

function notifydeleted() {
	poll.cancel();
	poll.freepeer();
	meterTask.cancel();
	meterTask.freepeer();
}

if (typeof module !== "undefined") {
	module.exports = { routing: routing, dict: dict };
}
