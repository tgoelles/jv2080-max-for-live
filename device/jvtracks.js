// Parts from Live tracks (Parts page, one instance): which Live tracks play which JV part.
//
// The device's own track sends to the JV's port (MIDI To). Every other track whose MIDI To is the same port plays the
// parts listening on that track's channel. Each part shows the name of the track(s) playing it (P<n>Track); "scan 1"
// (the Tracks button) also switches the parts on whose channel a track uses and the others off.
//
// Track names are read again at "scan", and when a part's channel changes ("ch <part> <1-16>").
//
// inlet 0: "scan 0/1" (1 = also switch parts on/off), "ch <part> <channel>"
// The controls are reached by varname: P<n>Channel (read), P<n>On (set, sends to the JV), P<n>Track (label).

autowatch = 1;
inlets = 1;
outlets = 0;
setinletassist(0, "scan 0/1, ch part channel");

var jsthis = this;
var LABEL = 8;   // characters that fit next to the fader

// the port and channel a track sends to: {port, channel 1-16 or 0 (all / none)}
function routing(track) {
	var type = dict(track.get("output_routing_type"), "output_routing_type");
	var chan = dict(track.get("output_routing_channel"), "output_routing_channel");
	var m = /(\d+)/.exec(chan.display_name || "");
	return { port: type.display_name || "", channel: m ? +m[1] : 0 };
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

// channel -> track names, for the tracks sending to the JV (not the device's own track)
function tracksByChannel() {
	var own = new LiveAPI("this_device canonical_parent");
	var port = routing(own).port;
	var byChannel = {};
	if (!port) {
		return byChannel;
	}
	var set = new LiveAPI("live_set");
	var n = set.getcount("tracks");
	for (var i = 0; i < n; i++) {
		var t = new LiveAPI("live_set tracks " + i);
		if (t.id === own.id || +str(t.get("has_midi_output")) !== 1) {
			continue;
		}
		var r = routing(t);
		if (r.port === port && r.channel >= 1 && r.channel <= 16) {
			(byChannel[r.channel] = byChannel[r.channel] || []).push(str(t.get("name")));
		}
	}
	return byChannel;
}

function control(name) {
	return jsthis.patcher.getnamed(name);
}

function value(obj) {
	var v = obj.getvalueof();
	return Math.round(v instanceof Array ? v[0] : v);
}

// "scan 1": names and on/off; "scan 0": names only
function scan(switchParts) {
	var byChannel = tracksByChannel();
	for (var p = 1; p <= 16; p++) {
		var chan = control("P" + p + "Channel");
		var names = chan ? byChannel[value(chan)] : null;
		var label = control("P" + p + "Track");
		if (label) {
			var text = names ? names.join("+") : "";
			label.message("set", text.length > LABEL ? text.slice(0, LABEL) : text);
		}
		if (switchParts) {
			var on = control("P" + p + "On");
			if (on && value(on) !== (names ? 1 : 0)) {
				on.message("int", names ? 1 : 0);   // sends it to the JV
			}
		}
	}
}

function ch(part, channel) {
	scan(0);
}

if (typeof module !== "undefined") {
	module.exports = { routing: routing, dict: dict };
}
