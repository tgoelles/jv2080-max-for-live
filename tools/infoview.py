#!/usr/bin/env python3
"""Write Live's Info View texts (the `annotation` attribute) for the device's controls.

Hover a control in Live and the Info View (bottom left, `?`) shows its parameter name and this text. Bound controls
get a description of the JV parameter they edit, with the page in the JV-2080 owner's manual (in our own words, from
the manual); other controls get a text from EXTRA below, or their `hint`.

    python3 -I tools/infoview.py           # write the texts into the patches
    python3 -I tools/infoview.py --check   # exit 1 if a patch is out of date (tools/check.sh)

The generated pages (tools/parts_page.py, part_page.py, keys_page.py, perffx.py) call annotate() themselves.
Run it after tools/bindings.py: which control edits which parameter comes from device/jv2080_bindings.js.
"""
import json, re, shutil, sys, tempfile
from pathlib import Path
ROOT = Path(__file__).resolve().parent.parent
DEVICE = ROOT / "device"
sys.path.insert(0, str(ROOT / "tools"))
from maxjson import load, dump

# --- what each JV parameter does: (text, manual page). Keys: (block, id); "tone"/"common" = patch, "perf"/"part".
T = {}


def info(block, ids, text, page):
    for i in ids.split():
        T[(block, i)] = (text, page)


# patch: tone, wave (WG)
info("tone", "tone_switch", "Switches the tone on or off. Switch unused tones off: every tone uses a voice.", "80")
info("tone", "wave_group_type wave_group_id", "The wave group: the internal waves (INT-A, INT-B) or an expansion board.", "79")
info("tone", "wave_number", "The PCM waveform the tone is built on.", "80")
info("tone", "wave_gain", "Gain of the waveform in 6 dB steps (+6 dB doubles it). More gain drives the booster harder.", "80")
info("tone", "fxm_switch", "FXM (frequency cross modulation) on or off: modulates the wave's frequency for complex, rich overtones.", "80")
info("tone", "fxm_color", "FXM colour: higher values sound rougher, lower values more metallic.", "80")
info("tone", "fxm_depth", "FXM depth: how strong the frequency modulation is.", "80")
info("tone", "tone_delay_mode",
     "Tone delay mode. NORMAL: the tone starts after the delay time. HOLD: only if the key is still held. KEY-OFF-N / "
     "KEY-OFF-D: the tone sounds when the key is released. PLAYMATE: the delay follows the time between your notes. "
     "CLOCK-SYNC / TEMPO-SYNC: the delay follows the clock.", "80-81")
info("tone", "tone_delay_time", "Tone delay time: from key down (key up in the KEY-OFF modes) until the tone sounds. "
     "No delay: mode NORMAL, time 0. With CLOCK-SYNC it's a note length.", "81-82")
info("tone", "vel_cross_fade", "Velocity cross fade: how gradually the tone fades out beyond its velocity range. 0 = cut off.", "76")
info("tone", "vel_range_lower", "Lowest velocity that plays the tone. Only used when velocity ranges are switched on.", "76")
info("tone", "vel_range_upper", "Highest velocity that plays the tone. Only used when velocity ranges are switched on.", "76")
info("tone", "key_range_lower", "Lowest key that plays the tone (C-1 ... G9), for splits and layers.", "76")
info("tone", "key_range_upper", "Highest key that plays the tone (C-1 ... G9), for splits and layers.", "76")
# controller switches and matrix
info("tone", "volume_sw", "Whether the tone reacts to volume messages (CC 7).", "88")
info("tone", "hold1_sw", "Whether the tone reacts to hold-1, the sustain pedal (CC 64).", "89")
info("tone", "bend_sw", "Whether the tone reacts to pitch bend.", "89")
info("tone", "redamper_sw", "Redamper: sustain pressed after the key is released still catches the decaying note, like "
     "a piano. Needs hold-1 on.", "89")
info("tone", "pan_ctrl_sw", "How the tone reacts to pan (CC 10). OFF: not at all. CONTINUOUS: sounding notes move too. "
     "KEY-ON: only notes played afterwards.", "88-89")
for c in (1, 2, 3):
    for d in (1, 2, 3, 4):
        info("tone", "ctrl%d_dest%d" % (c, d), "Controller %d, destination %d: the tone parameter that controller %d moves "
             "(pitch, cutoff, resonance, level, pan, mix, chorus or reverb send, LFO depths or rates). Controller 1 is the "
             "modulation wheel; the sources of controllers 2 and 3 are set on the right." % (c, d, c), "88, 106")
        info("tone", "ctrl%d_depth%d" % (c, d), "Controller %d, depth %d: how far and in which direction (+/-) "
             "controller %d moves that destination." % (c, d, c), "88, 106")
# LFOs
for n in (1, 2):
    info("tone", "lfo%d_wave" % n, "LFO %d waveform: TRI, SIN, SAW, SQR, TRP (trapezoid), S&H (sample and hold), RND "
         "(random), CHS (chaos)." % n, "86")
    info("tone", "lfo%d_key_trigger" % n, "LFO %d key sync: restart the LFO cycle with every key press." % n, "86")
    info("tone", "lfo%d_rate" % n, "LFO %d speed. With sync on (CLK) it's a note length of the tempo. Ignored by CHS." % n, "87")
    info("tone", "lfo%d_offset" % n, "LFO %d offset: shifts the waveform up or down, so it modulates mainly in one "
         "direction." % n, "87")
    info("tone", "lfo%d_delay" % n, "LFO %d delay: in the ON fade modes, the time from key down until the LFO starts; in "
         "the OFF modes, from key up." % n, "87")
    info("tone", "lfo%d_fade_mode" % n, "LFO %d fade mode. ON-IN: fades in after key down. ON-OUT: starts at once and "
         "fades out. OFF-IN: fades in after key up. OFF-OUT: runs until after key up, then fades out." % n, "87")
    info("tone", "lfo%d_fade_time" % n, "LFO %d fade time: how long it takes to reach full depth (or to die away) "
         "after the delay." % n, "87")
    info("tone", "lfo%d_sync" % n, "LFO %d external sync: OFF, or CLK to follow the clock (patch / system tempo or "
         "MIDI clock)." % n, "87")
    info("tone", "pitch_lfo%d_depth" % n, "How much LFO %d moves the pitch (vibrato). Negative inverts it." % n, "88")
    info("tone", "filter_lfo%d_depth" % n, "How much LFO %d moves the cutoff (wah). Negative inverts it." % n, "88")
    info("tone", "level_lfo%d_depth" % n, "How much LFO %d moves the volume (tremolo). Negative inverts it." % n, "88")
    info("tone", "pan_lfo%d_depth" % n, "How much LFO %d moves the pan (auto pan). Negative inverts it." % n, "88")
# pitch
info("tone", "coarse_tune", "The tone's pitch in semitones, up to 4 octaves up or down.", "82")
info("tone", "fine_tune", "The tone's pitch in cents (1/100 semitone), up to half a semitone up or down.", "82")
info("tone", "random_pitch", "Random pitch deviation for each note, in cents. 0 = none.", "82")
info("tone", "pitch_keyfollow", "How much the pitch changes per octave on the keyboard. +100 = normal, 0 = the same pitch "
     "on every key, negative = falls as you play higher.", "82")


def envelope(prefix, what, page, levels=4):
    info("tone", prefix + "_vel_sens", "Velocity sensitivity of the %s envelope: positive gives hard notes more "
         "envelope, negative less." % what, page)
    info("tone", prefix + "_vel_time1", "Velocity and Time 1 of the %s envelope: positive makes the attack faster for "
         "hard notes, negative slower." % what, page)
    info("tone", prefix + "_vel_time4", "Note-off velocity and Time 4 of the %s envelope: positive makes the release "
         "faster for quickly released keys. Needs a keyboard that sends note-off velocity." % what, page)
    info("tone", prefix + "_time_kf", "Time keyfollow of the %s envelope: positive makes times 2-4 shorter above C4 and "
         "longer below." % what, page)
    for k in (1, 2, 3, 4):
        info("tone", "%s_time%d" % (prefix, k), "%s envelope time %d: how long it takes to reach level %d%s." % (
            what.capitalize(), k, k, " (time 4: after key up)" if k == 4 else ""), page)
    for k in range(1, levels + 1):
        info("tone", "%s_level%d" % (prefix, k), "%s envelope level %d, relative to the tone's %s." % (
            what.capitalize(), k, {"pitch": "pitch", "filter": "cutoff", "amp": "level"}[what]), page)


envelope("penv", "pitch", "82-83")
info("tone", "penv_depth", "Pitch envelope depth: how far the envelope moves the pitch. Negative inverts it.", "83")
# filter
info("tone", "filter_type", "Filter type. LPF cuts the highs (darker), BPF keeps a band around the cutoff, HPF cuts "
     "the lows, PKG boosts around the cutoff, OFF bypasses the filter.", "83")
info("tone", "cutoff", "Cutoff frequency: where the filter starts working. With LPF, lower is darker.", "83")
info("tone", "cutoff_keyfollow", "Cutoff keyfollow: positive opens the filter for notes above C4 (and closes it "
     "below), negative the opposite.", "84")
info("tone", "resonance", "Resonance: boosts the frequencies around the cutoff. Very high values can distort.", "84")
info("tone", "res_vel_sens", "Velocity and resonance: positive gives hard notes more resonance, negative less.", "84")
envelope("fenv", "filter", "84")
info("tone", "fenv_depth", "Filter envelope depth: how far the envelope moves the cutoff. Negative inverts it.", "84")
info("tone", "fenv_vel_curve", "Velocity curve (1-7) for the filter envelope: how playing strength maps to its depth.", "84")
# amp
info("tone", "tone_level", "The tone's volume, to balance the tones. The patch level scales all of them.", "85")
info("tone", "bias_direction", "Bias: where the level changes with key position. LOWER: below the bias point. UPPER: "
     "above it. LOWER&UPPER: both sides. ALL: across the keyboard, centred on the point.", "85")
info("tone", "bias_position", "Bias point: the key where the level change starts.", "85")
info("tone", "bias_level", "Bias amount: how strongly the level changes away from the bias point. Negative inverts it.", "85")
envelope("aenv", "amp", "86", levels=3)
info("tone", "aenv_vel_curve", "Velocity curve (1-7) for the volume: how playing strength maps to loudness.", "86")
info("tone", "aenv_vel_sens", "How much velocity changes the tone's volume. Negative: harder is softer.", "86")
info("tone", "tone_pan", "The tone's pan, L64 ... 63R. Added to the patch pan.", "85")
info("tone", "pan_keyfollow", "Pan keyfollow: positive moves notes above C4 to the right, negative to the left.", "85")
info("tone", "random_pan", "Random pan: each note gets a random position. 0 = none.", "85")
info("tone", "alt_pan", "Alternate pan: notes alternate between left and right; L or R sets the side and width.", "85")
# tone output
info("tone", "output_assign", "Where the tone goes: MIX (MIX outputs), EFX (through the EFX), DIR1 / DIR2 (DIRECT "
     "outputs, no chorus or reverb).", "26")
info("tone", "mix_efx_send", "Level to the MIX outputs, or into the EFX when the output is EFX.", "26")
info("tone", "chorus_send", "How much of the tone goes to the chorus.", "26")
info("tone", "reverb_send", "How much of the tone goes to the reverb.", "26")

# patch common and effects (the effect texts are shared with the performance)
for k in range(1, 13):
    info("common", "name_%d" % k, "Patch name, character %d. Type the name in the program block." % k, "59")
    info("perf", "name_%d" % k, "Performance name, character %d. Type the name in the program block." % k, "59")
    info("perf", "efx_param_%d" % k, "EFX parameter %d. What it does depends on the EFX type: see the label above "
         "the dial." % k, "33-53")
    info("common", "efx_param_%d" % k, "EFX parameter %d. What it does depends on the EFX type: see the label above "
         "the dial." % k, "33-53")
for b in ("common", "perf"):
    info(b, "efx_type", "EFX type: one of 40 effects (EQ, distortion, phaser, delays, rotary, pitch shifter, ...). "
         "The 12 dials follow the type.", "33")
    info(b, "efx_output_assign", "Where the EFX goes: the MIX outputs, or DIRECT 1 / 2 (then no chorus or reverb send).", "26")
    info(b, "efx_mix_send", "EFX output level.", "26")
    info(b, "efx_chorus_send", "How much of the EFX goes to the chorus.", "26")
    info(b, "efx_reverb_send", "How much of the EFX goes to the reverb.", "26")
    for n in (1, 2):
        info(b, "efx_ctrl_src_%d" % n, "EFX control %d source: the MIDI controller (modulation, breath, foot, "
             "aftertouch, system controllers ...) that moves the EFX's controllable (#) parameter." % n, "104")
        info(b, "efx_ctrl_depth_%d" % n, "EFX control %d depth: how far and in which direction (+/-) the source "
             "moves the parameter." % n, "104")
    info(b, "chorus_level", "Chorus volume.", "54")
    info(b, "chorus_rate", "Chorus modulation speed.", "54")
    info(b, "chorus_depth", "Chorus modulation depth.", "54")
    info(b, "chorus_predelay", "Chorus pre-delay: the time before the chorus is heard. More sounds spacier.", "54")
    info(b, "chorus_feedback", "Chorus feedback: how much is fed back into the chorus, for a more complex sound.", "54")
    info(b, "chorus_output", "Chorus output: MIX (MIX outputs), REV (into the reverb) or MIX+REV.", "54")
    info(b, "reverb_type", "Reverb type: ROOM1 / 2, STAGE1 / 2, HALL1 / 2, or DELAY and PAN-DLY (echoes, panned left "
         "and right).", "54")
    info(b, "reverb_level", "Reverb volume.", "54-55")
    info(b, "reverb_time", "Reverb time: how long the reverb lasts (the delay time for DELAY and PAN-DLY).", "55")
    info(b, "reverb_hf_damp", "HF damp: cuts the reverb's highs above this frequency. BYPASS: no damping.", "55")
    info(b, "delay_feedback", "Delay feedback: how many repeats, for the DELAY and PAN-DLY reverb types.", "55")
info("common", "efx_ctrl_hold_peak", "EFX control Peak&Hold. HOLD: a pedal freezes the EFX control's current value. "
     "PEAK: it keeps the highest value.", "106")
for n in (1, 2, 3):
    info("common", "ctrl_%d_hold_peak" % n, "Controller %d Peak&Hold. HOLD: a pedal freezes the controller's current "
         "value. PEAK: it keeps the highest value." % n, "74, 106")
info("common", "patch_ctrl_src_2 patch_ctrl_src_3", "Source of this patch controller: the MIDI message (foot, "
     "aftertouch, breath, system controllers ...) it reacts to.", "74, 106")
info("common", "patch_tempo", "Patch tempo, for synced LFOs, EFX and tone delay when the clock source is PATCH.", "73")
info("common", "clock_source", "Clock for synced LFOs, EFX and tone delay. PATCH: the patch tempo. SYSTEM: the system "
     "tempo or MIDI clock.", "73")
info("common", "patch_level", "Volume of the whole patch; the tone levels are scaled by it.", "72")
info("common", "patch_pan", "Pan of the whole patch, L64 ... 63R; the tones' pan is added to it.", "72")
info("common", "analog_feel", "Analog feel: adds slow, irregular (1/f) modulation, like an analog synth's drift.", "72")
info("common", "bend_up", "Pitch bend range up, in semitones.", "72")
info("common", "bend_down", "Pitch bend range down, in semitones.", "72")
info("common", "octave_shift", "Shifts the patch up or down by octaves (+/-3).", "72")
info("common", "stretch_tune", "Stretch tuning, like an acoustic piano: lows a little lower, highs a little higher. "
     "OFF = equal temperament, 3 = most.", "72")
info("common", "voice_priority", "When polyphony runs out: LAST keeps the newest notes, LOUDEST the loudest.", "73")
info("common", "category", "Patch category, used by the JV's patch search.", "72")
info("common", "key_assign", "POLY plays chords; SOLO only the last note (for monophonic instruments).", "73")
info("common", "solo_legato", "Solo legato: in SOLO, a key played while another is held only changes the pitch, "
     "without a new attack (hammer-on).", "73")
info("common", "porta_switch", "Portamento on or off: glide from one note's pitch to the next.", "73")
info("common", "porta_time", "Portamento time: how long the glide takes.", "74")
info("common", "porta_type", "Portamento type. RATE: the time depends on the interval. TIME: always the same time.", "74")
info("common", "porta_mode", "Portamento mode. NORMAL: always. LEGATO: only when you play legato.", "74")
info("common", "porta_start", "Portamento start. PITCH: a new glide starts where the current one is. NOTE: from the "
     "note being played.", "74")
info("common", "vel_range_switch", "Whether the tones' velocity ranges are used.", "76")
info("common", "structure_12", "How tones 1 and 2 are combined: Type 1 independent, others chain the filters, add the "
     "booster (distortion) or the ring modulator.", "74-75")
info("common", "structure_34", "How tones 3 and 4 are combined: Type 1 independent, others chain the filters, add the "
     "booster (distortion) or the ring modulator.", "74-75")
info("common", "booster_12 booster_34", "Booster gain (structure types 3 and 4): distortion of the combined tones.", "75")

# performance
info("perf", "efx_a_source", "Where EFX-A's settings come from: PERFORM (these) or the patch EFX of a part.", "28")
info("perf", "efx_b_source", "EFX-B uses the patch EFX of this part.", "28")
info("perf", "efx_c_source", "EFX-C uses the patch EFX of this part.", "28")
info("perf", "perf_tempo", "Performance tempo, for synced LFOs, EFX and tone delay when the clock source is "
     "PERFORMANCE.", "110")
info("perf", "clock_source", "Clock for synced LFOs, EFX and tone delay. PERFORMANCE: the performance tempo. SYSTEM: "
     "the system tempo or MIDI clock.", "110")
info("perf", "key_range_switch", "Whether the parts' key ranges are used. Off: every part plays the whole keyboard.", "66")
for p in range(1, 17):
    info("perf", "voice_reserve_%d" % p, "Voice reserve: voices kept free for this part, so other parts can't take "
         "them. All parts together at most 64.", "67")
info("part", "receive_switch", "Part on or off: whether the part receives MIDI and plays.", "64, 67")
info("part", "midi_channel", "The MIDI channel the part listens to.", "67")
info("part", "patch_group_type patch_group_id", "The bank of the part's patch (part 10: rhythm set).", "66")
info("part", "patch_number", "The part's patch (part 10: rhythm set).", "67")
info("part", "part_level", "The part's volume, to balance the parts.", "67")
info("part", "part_pan", "The part's pan, L64 ... 63R, relative to the patch's own pan.", "67")
info("part", "coarse_tune", "The part's pitch in semitones (+/-4 octaves), on top of the patch's tuning.", "67")
info("part", "fine_tune", "The part's pitch in cents, up to half a semitone up or down.", "67")
info("part", "output_assign", "Where the part goes: MIX, EFX (through EFX A, B or C), DIR1 / DIR2 (the DIRECT "
     "outputs), or PATCH: the patch's own routing.", "28")
info("part", "output_select", "Which EFX the part goes through when its output is EFX: A, B or C.", "28")
info("part", "mix_efx_send", "Level to the MIX outputs, or into the EFX when the output is EFX.", "28")
info("part", "chorus_send", "How much of the part goes to the chorus.", "28")
info("part", "reverb_send", "How much of the part goes to the reverb.", "28")
info("part", "rx_program_change", "Whether the part follows program changes on its channel.", "68")
info("part", "rx_volume", "Whether the part follows volume (CC 7) on its channel.", "68")
info("part", "rx_hold_1", "Whether the part follows hold-1 / sustain (CC 64) on its channel.", "68")
info("part", "key_range_lower", "Lowest key the part plays (C-1 ... G9), for splits and layers.", "66")
info("part", "key_range_upper", "Highest key the part plays (C-1 ... G9), for splits and layers.", "66")


def text(block, pid):
    t = T.get((block, pid))
    return None if not t else "%s (JV-2080 manual p.%s)" % (t[0], t[1])


# --- controls without a binding: (patch, varname regex) -> text
SAME = {"View" + v: ("part", i) for v, i in (("On", "receive_switch"), ("Channel", "midi_channel"),
                                             ("BankView", "patch_group_id"), ("Patch", "patch_number"),
                                             ("Level", "part_level"), ("Pan", "part_pan"))}
EXTRA = {
    "JV 2080 Control": [
        (r"ModeSwitch", "The JV's mode: Patch (one patch, 4 tones) or Perform (a performance of 16 parts). The JV "
         "follows, and the switch follows the JV's own PATCH / PERFORM buttons."),
        (r"ToneTabs", "Which tone (1-4) the tone sections and the LFO / Ctrl pages edit."),
        (r"LFOButton", "The selected tone's two LFOs and their depths."),
        (r"CtrlButton", "How MIDI controllers change the selected tone (controller matrix and switches)."),
        (r"PatchButton", "Patch-wide settings: level, pan, mode, portamento, structure, key and velocity zones."),
        (r"FXButton", "The effects: EFX, chorus and reverb (in Perform mode the performance's)."),
        (r"PartButton", "Back to the Parts page, or to the selected part's page."),
        (r"KeysButton", "The 16 parts' key ranges, for splits and layers."),
        (r"PartSel\d+", "Opens this part's page. Lit red: selected. Faint: the part is switched off."),
        (r"SendToJV", "Sends the device's patch (Perform mode: performance) to the JV."),
        (r"GetFromJV", "Reads the JV's current patch (Perform mode: performance) into the device."),
    ],
    "ProgramBlock": [
        (r"BankDisplay", "The bank: patch banks in Patch mode, performance banks (USER, PR-A, PR-B, CARD) in Perform mode."),
        (r"ProgramChange\[1\]", "The patch number in the bank; sends a program change."),
        (r"PerfNumber", "The performance number (1-32) in the bank; selects it on the JV."),
    ],
    "NameBlock": [(r"PatchName", "The patch (Perform mode: performance) name, up to 12 characters. Click, type and press "
                   "Return: the name goes to the JV at once. (JV-2080 manual p.59)")],
    "Settings": [
        (r"DeviceID", "Must match the JV's Device ID: SYSTEM > MIDI > Device ID (17-32, default 17). (JV-2080 manual p.136)"),
        (r"SysExGap", "Time between SysEx messages to the JV. Raise it if the JV shows \"MIDI buffer full\"."),
        (r"SendOnLoad", "Sends the device's settings to the JV 1 s after the set loads, so the saved set wins."),
        (r"GetOnProgramChange", "Reads the new patch from the JV after a program change. MIDI From must include the JV."),
        (r"FollowJVPatchChanges", "Picking a patch on the JV's panel updates the device too."),
        (r"ExpSlot[A-H]", "The SR-JV80 board in this slot (SYSTEM > Info on the JV). Adds its waves and patches to the "
         "menus. (JV-2080 manual p.9)"),
        (r"JVModel", "JV-2080, JV-1080 or XP-50/80: the bank list and the patch size. JV-1080 and XP are experimental."),
    ],
    "EffectsSwitch": [(r".*", "Switches the JV's EFX, chorus or reverb on or off (like the JV's EFX / CHORUS / REVERB "
                       "buttons), for all patches and performances.")],
    "JV_Wave": [(r"WaveGroupMenu", "The wave group: the internal waves (INT-A, INT-B) or an expansion board set up on "
                 "the Setup page. (JV-2080 manual p.79)")],
    "JV_VCA": [(r"live\.dial", text("tone", "tone_level"))],   # the hidden copy of ToneMix's level
    "JV_LIBRARY": [(r"CancelButton", "Stops a running backup, restore or write, or drops one waiting for Confirm.")],
    "JV_KEYS": [(r"KeyRangeSwitch", text("perf", "key_range_switch"))],
}


def view_text(key, varname):
    if key == "JV_PARTEDIT" and varname in SAME:
        return text(*SAME[varname])
    if key == "JV_PARTEDIT" and varname == "ViewVoices":
        return text("perf", "voice_reserve_1")
    if key == "JV_PERFORM" and re.fullmatch(r"P\d+BankView", varname or ""):
        return text("part", "patch_group_id")
    for pattern, t in EXTRA.get(key, []):
        if t and re.fullmatch(pattern, varname or ""):
            return t
    return None


# --- which control edits which parameter
FILES = {"Pitch_{n}": "JV_Pitch", "TVF_{n}": "JV_Filter", "WG_{n}": "JV_Wave", "VCA_{n}": "JV_VCA", "LFO_{n}": "JV_LFO",
         "CTRL_{n}": "JV_CTRL", "CtrlCommon": "JV_CTRLCOMMON", "FX": "JV_FX", "PatchPage": "JV_PATCH",
         "PerformPage": "JV_PERFORM", "PartEdit_{n}": "JV_PARTEDIT", "KeysPage": "JV_KEYS", "PerfFX": "JV_PERFFX"}


def bindings():
    src = (DEVICE / "jv2080_bindings.js").read_text()
    out = {}
    for line in src.splitlines():
        line = line.strip().rstrip(",")
        if line.startswith("{\"block\""):
            b = json.loads(line)
            key = FILES.get(b["path"][0], b["path"][0])   # an abstraction, or an embedded bpatcher's varname
            out[(key, b["varname"])] = text(b["block"], b["id"])
    return out


BOUND = bindings()


def annotate(patcher, key):
    """Set `annotation` on the controls of one patcher (key: abstraction name without .maxpat, or an embedded
    bpatcher's varname); embedded subpatchers are done with their own varname."""
    for entry in patcher["boxes"]:
        box = entry["box"]
        if box.get("maxclass") == "bpatcher" and "patcher" in box and not box.get("name"):
            annotate(box["patcher"], box.get("varname") or "")
            continue
        if not box.get("presentation") or box.get("maxclass") in ("live.comment", "comment", "panel", "bpatcher"):
            continue
        varname = box.get("varname")
        t = BOUND.get((key, varname)) or view_text(key, varname) or box.get("hint")
        if t:
            box["annotation"] = t
        else:
            box.pop("annotation", None)


HAND_MADE = ["JV_Wave", "JV_Pitch", "JV_Filter", "JV_VCA", "JV_LFO", "JV_CTRL", "JV_CTRLCOMMON", "JV_FX", "JV_PATCH",
             "JV_LIBRARY"]


def main():
    check = "--check" in sys.argv
    stale = []
    for name in HAND_MADE + ["JV 2080 Control"]:
        real = DEVICE / (name + (".amxd" if name == "JV 2080 Control" else ".maxpat"))
        path = real
        if check:
            tmp = tempfile.TemporaryDirectory()
            path = Path(tmp.name) / real.name
            shutil.copy(real, path)
        d = load(path)
        annotate(d["patcher"], name)
        dump(d, path)
        if check and path.read_bytes() != real.read_bytes():
            stale.append(real.name)
    if stale:
        sys.exit("Info View texts out of date in %s: run python3 -I tools/infoview.py" % ", ".join(stale))
    print("Info View texts up to date" if check else "wrote Info View texts")


if __name__ == "__main__":
    main()
