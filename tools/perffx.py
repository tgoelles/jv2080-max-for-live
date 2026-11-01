#!/usr/bin/env python3
"""Generate device/JV_PERFFX.maxpat (Perform mode's FX page) from device/JV_FX.maxpat, so the two FX pages can't drift.

The EFX and Chorus/Reverb panels are copied and moved to the temporary performance (patch common offset + 1:
js jvparam.js 3 0 0 n -> 1 0 0 n+1, behind a gate that only opens in Perform mode), Live names get the prefix
"Perf "; the per-tone outputs and the routing graphic make way for the EFX-A/B/C sources, clock source and tempo.
The EFX logic itself (jvfx.js, jv2080_efx.js) is shared, not copied. Edit JV_FX.maxpat, then run:

    python3 -I tools/perffx.py           # write device/JV_PERFFX.maxpat
    python3 -I tools/perffx.py --check   # exit 1 if it is out of date (tools/check.sh)
"""
import re
import shutil
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from maxjson import load, dump
from infoview import annotate

ROOT = Path(__file__).resolve().parent.parent
DST = ROOT / "device" / "JV_PERFFX.maxpat"


def build():
    GREY = [0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0]
    DIM = [0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0]
    PANEL = [0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0]
    SRC = ["PERFORM", "1", "2", "3", "4", "5", "6", "7", "8", "9", "11", "12", "13", "14", "15", "16"]
    JS = {"filename": "jvparam.js", "parameter_enable": 0}

    d = load(ROOT / "device" / "JV_FX.maxpat")
    pat = d["patcher"]
    ids = {b["box"]["id"]: b["box"] for b in pat["boxes"]}
    drop = set()
    for k, b in ids.items():
        t = b.get("text") or ""
        r = b.get("presentation_rect")
        if (b.get("presentation") and r and r[0] < 430.0) or b["maxclass"] in ("inlet", "outlet") or t == "r ---fxsw":
            drop.add(k)
        m = re.match(r"^js jvparam\.js 3 0 (\d+) ", t)
        if m and int(m.group(1)) != 0:
            drop.add(k)   # per-tone outputs
    # helper boxes that only served dropped ones (prepend tone ..., + n before a tone sender)
    for _ in range(3):
        for k, b in ids.items():
            if k in drop or b["maxclass"] not in ("newobj", "message") or (b.get("text") or "").startswith("js jvfx.js"):
                continue
            ends = [l["patchline"] for l in pat["lines"] if k in (l["patchline"]["source"][0], l["patchline"]["destination"][0])]
            others = {e["source"][0] if e["destination"][0] == k else e["destination"][0] for e in ends}
            if others and others <= drop | {k} or (b.get("text") or "").startswith("prepend tone"):
                drop.add(k)
    pat["boxes"] = [b for b in pat["boxes"] if b["box"]["id"] not in drop]
    pat["lines"] = [l for l in pat["lines"] if not ({l["patchline"]["source"][0], l["patchline"]["destination"][0]} & drop)]
    ids = {b["box"]["id"]: b["box"] for b in pat["boxes"]}
    top = [max(int(re.match(r"obj-(\d+)", k).group(1)) for k in ids)]


    def add(box, front=False):
        top[0] += 1
        box["id"] = "obj-%d" % top[0]
        (pat["boxes"].insert(0, {"box": box}) if front else pat["boxes"].append({"box": box}))
        ids[box["id"]] = box
        return box["id"]


    def line(a, b, ao=0, bi=0):
        pat["lines"].append({"patchline": {"destination": [b, bi], "source": [a, ao]}})


    def obj(text, x, y, ins=1, outs=1, attrs=None):
        b = {"maxclass": "newobj", "numinlets": ins, "numoutlets": outs, "outlettype": [""] * outs,
             "patching_rect": [x, y, 8.0 * len(text) + 24, 22.0], "text": text}
        if attrs:
            b["saved_object_attributes"] = attrs
        return add(b)


    out = obj("s ---sysex", 20.0, 1240.0, 1, 0)
    gate = obj("gate 1 0", 20.0, 1200.0, 2, 1)   # only in Perform mode
    line(gate, out)
    rmode = obj("r ---mode", 20.0, 1160.0, 0, 1)
    line(rmode, gate, 0, 0)
    # senders: patch common offset n -> performance common n + 1, into the gate
    for k, b in list(ids.items()):
        m = re.match(r"^js jvparam\.js 3 0 0 (\d+)( 2)?$", b.get("text") or "")
        if m:
            b["text"] = "js jvparam.js 1 0 0 %d%s" % (int(m.group(1)) + 1, m.group(2) or "")
            line(k, gate, 0, 1)
    # unique Live names
    for k, b in ids.items():
        v = b.get("saved_attribute_attributes", {}).get("valueof")
        if v and "parameter_longname" in v:
            v["parameter_longname"] = "Perf " + v["parameter_longname"]
    params = {k: [b["saved_attribute_attributes"]["valueof"]["parameter_longname"], b["saved_attribute_attributes"]["valueof"].get("parameter_shortname", ""), 0]
              for k, b in ids.items() if b.get("saved_attribute_attributes", {}).get("valueof", {}).get("parameter_longname")}


    def comment(text, rect, color=GREY, just=0):
        add({"maxclass": "live.comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [1200.0 + rect[0], 900.0 + rect[1], 120.0, 18.0],
             "presentation": 1, "presentation_rect": rect, "text": text, "textcolor": color, "textjustification": just}, front=True)


    def menu(var, long, short, rect, enum, init, off):
        i = add({"appearance": 1, "maxclass": "live.menu", "numinlets": 1, "numoutlets": 3, "outlettype": ["", "", "float"],
                 "parameter_enable": 1, "patching_rect": [1200.0 + rect[0], 1000.0 + rect[1], 100.0, 15.0], "presentation": 1,
                 "presentation_rect": rect, "varname": var,
                 "saved_attribute_attributes": {"valueof": {"parameter_longname": long, "parameter_shortname": short, "parameter_type": 2,
                     "parameter_enum": enum, "parameter_mmax": len(enum) - 1, "parameter_initial": [init], "parameter_initial_enable": 1}}},
                front=True)
        params[i] = [long, short, 0]
        sx = obj("js jvparam.js 1 0 0 %d" % off, 1200.0 + rect[0], 1100.0 + rect[1], 2, 1, JS)
        line(i, sx)
        line(sx, gate, 0, 1)
        return i


    comment("EFX sources", [0.0, 0.0, 430.0, 18.0], DIM, 1)
    for k, (name, off, init) in enumerate((("A", 0x0C, 0), ("B", 0x42, 0), ("C", 0x43, 0))):
        y = 24.0 + 22.0 * k
        comment("EFX-" + name, [8.0, y - 2.0, 44.0, 18.0])
        menu("EFX%sSource" % name, "Perf EFX-%s Source" % name, "EFX-" + name, [54.0, y, 80.0, 15.0], SRC, init, off)
    comment("PERFORM: the EFX on the right. A part number: that part's patch EFX.", [8.0, 92.0, 414.0, 18.0], DIM)
    comment("EFX-B and EFX-C always take a part's patch EFX.", [8.0, 108.0, 414.0, 18.0], DIM)
    comment("tempo", [200.0, 22.0, 50.0, 18.0])
    menu("PerfClockSource", "Perf Clock Source", "clock", [250.0, 24.0, 96.0, 15.0], ["PERFORMANCE", "SYSTEM"], 0, 0x41)
    tempo = add({"appearance": 4, "maxclass": "live.numbox", "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"],
                 "parameter_enable": 1, "patching_rect": [1500.0, 1000.0, 44.0, 15.0], "presentation": 1,
                 "presentation_rect": [350.0, 24.0, 40.0, 15.0], "textjustification": 0, "varname": "PerfTempo",
                 "saved_attribute_attributes": {"valueof": {"parameter_longname": "Perf Tempo", "parameter_shortname": "tempo",
                     "parameter_type": 1, "parameter_mmin": 20.0, "parameter_mmax": 250.0, "parameter_initial": [120],
                     "parameter_initial_enable": 1, "parameter_unitstyle": 0}}}, front=True)
    params[tempo] = ["Perf Tempo", "tempo", 0]
    sx = obj("js jvparam.js 1 0 0 45 2", 1500.0, 1100.0, 2, 1, JS)
    line(tempo, sx)
    line(sx, gate, 0, 1)
    pat["boxes"].append({"box": {"id": "obj-%d" % (top[0] + 1), "angle": 270.0, "background": 1, "bgcolor": PANEL, "ignoreclick": 0,
                                 "maxclass": "panel", "mode": 0, "numinlets": 1, "numoutlets": 0, "patching_rect": [1200.0, 1300.0, 430.0, 163.0],
                                 "presentation": 1, "presentation_rect": [0.0, 0.0, 430.0, 163.0], "proportion": 0.5}})
    pat["parameters"] = dict(params, parameterbanks={})
    annotate(pat, "JV_PERFFX")   # Live's Info View texts
    return d


if __name__ == "__main__":
    d = build()
    if "--check" in sys.argv:
        with tempfile.TemporaryDirectory() as tmp:
            t = Path(tmp) / DST.name
            shutil.copy(DST, t)
            dump(d, t)
            if t.read_bytes() != DST.read_bytes():
                sys.exit("device/JV_PERFFX.maxpat is out of date: run python3 -I tools/perffx.py")
        print("JV_PERFFX.maxpat up to date")
    else:
        dump(d, DST)
        print("wrote device/JV_PERFFX.maxpat")
