#!/usr/bin/env python3
"""Generate device/JV_PARTEDIT.maxpat: the Part page abstraction (one instance per part: output, sends, tuning, receive switches).

The page is generated: change this script, not the patch, then run

    python3 -I tools/part_page.py           # write the page
    python3 -I tools/part_page.py --check   # exit 1 if the page is out of date (tools/check.sh)

The page's bpatcher(s) and wiring in the main device were added once (see git history); new Live parameters show up
there after the device is saved in Max.
"""
import re, shutil, sys, tempfile
from pathlib import Path
ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
from maxjson import load, dump

GREY = [0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0]
DIM = [0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0]
PANEL = [0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0]
ORANGE = [1.0, 0.709803921568627, 0.196078431372549, 1.0]
MID = [0.549019607843137, 0.549019607843137, 0.549019607843137, 1.0]
JS = {"filename": "jvparam.js", "parameter_enable": 0}
WIDTH = 520.0

# ---------------------------------------------------------------- the abstraction
DST = ROOT / "device" / "JV_PARTEDIT.maxpat"
REAL = DST
CHECK = "--check" in sys.argv
if CHECK:
    _tmp = tempfile.TemporaryDirectory()
    DST = Path(_tmp.name) / REAL.name
    shutil.copy(REAL, DST)
d = load(DST)
pat = d["patcher"]
boxes, lines, params, front = [], [], {}, []
n = [0]


def add(box, ui=False):
    n[0] += 1
    box["id"] = "obj-%d" % n[0]
    (front if ui else boxes).append({"box": box})
    return box["id"]


def line(a, b, ao=0, bi=0):
    lines.append({"patchline": {"destination": [b, bi], "source": [a, ao]}})


def obj(text, x, y, ins=1, outs=1, attrs=None):
    b = {"maxclass": "newobj", "numinlets": ins, "numoutlets": outs, "outlettype": [""] * outs,
         "patching_rect": [x, y, 8.0 * len(text) + 24, 22.0], "text": text}
    if attrs:
        b["saved_object_attributes"] = attrs
    return add(b)


def valueof(long, short, ptype, **kw):
    v = {"parameter_longname": long, "parameter_shortname": short, "parameter_type": ptype}
    v.update(kw)
    return {"valueof": v}


def comment(text, rect, color=GREY, just=0):
    add({"maxclass": "live.comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [1200.0 + rect[0], 300.0 + rect[1], 80.0, 18.0],
         "presentation": 1, "presentation_rect": rect, "text": text, "textcolor": color, "textjustification": just}, ui=True)


def panel(x, w):
    add({"angle": 270.0, "background": 1, "bgcolor": PANEL, "ignoreclick": 0, "maxclass": "panel", "mode": 0,
         "numinlets": 1, "numoutlets": 0, "patching_rect": [1200.0 + x, 20.0, w, 163.0], "presentation": 1,
         "presentation_rect": [x, 0.0, w, 163.0], "proportion": 0.5})


addr = add({"comment": "part address byte (0x10-0x1F)", "index": 0, "maxclass": "inlet", "numinlets": 0, "numoutlets": 1,
            "outlettype": [""], "patching_rect": [20.0, 20.0, 30.0, 30.0]})
out = obj("s ---sysex", 20.0, 1040.0, 1, 0)
gate = obj("gate 1 0", 20.0, 1000.0, 2, 1)   # only in Perform mode
line(gate, out)
rmode = obj("r ---mode", 20.0, 960.0, 0, 1)
line(rmode, gate, 0, 0)
px = [20.0]


def sender(src, off, plus=None):
    x = px[0]
    px[0] += 150.0
    if plus:
        p = obj("+ %d" % plus, x, 650.0, 2, 1)
        line(src, p)
        src = p
    sx = obj("js jvparam.js 1 0 -1 %d" % off, x, 700.0, 2, 1, JS)
    line(src, sx)
    line(addr, sx, 0, 1)
    line(sx, gate, 0, 1)


LONG = "Part %s"   # overridden per instance in the main patch: "Part <n> ..."


def menu(var, long, short, rect, enum, init):
    i = add({"appearance": 1, "maxclass": "live.menu", "numinlets": 1, "numoutlets": 3, "outlettype": ["", "", "float"],
             "parameter_enable": 1, "patching_rect": [px[0], 600.0, 100.0, 15.0], "presentation": 1, "presentation_rect": rect,
             "varname": var, "saved_attribute_attributes": valueof(LONG % long, short, 2, parameter_enum=enum, parameter_mmax=len(enum) - 1,
                                                                   parameter_initial=[init], parameter_initial_enable=1)}, ui=True)
    params[i] = [LONG % long, short, 0]
    return i


def dial(var, long, short, rect, lo, hi, init):
    i = add({"activedialcolor": ORANGE, "activefgdialcolor": MID, "activeneedlecolor": MID, "maxclass": "live.dial",
             "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"], "parameter_enable": 1,
             "patching_rect": [px[0], 600.0, 41.0, 48.0], "presentation": 1, "presentation_rect": rect, "textcolor": GREY,
             "tricolor": MID, "varname": var,
             "saved_attribute_attributes": valueof(LONG % long, short, 1, parameter_mmin=float(lo), parameter_mmax=float(hi),
                                                   parameter_initial=[init], parameter_initial_enable=1, parameter_unitstyle=0)}, ui=True)
    params[i] = [LONG % long, short, 0]
    return i


def toggle(var, long, short, rect, init):
    i = add({"appearance": 1, "maxclass": "live.toggle", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "parameter_enable": 1,
             "patching_rect": [px[0], 600.0, 15.0, 15.0], "presentation": 1, "presentation_rect": rect, "varname": var,
             "saved_attribute_attributes": valueof(LONG % long, short, 2, parameter_enum=["off", "on"], parameter_mmax=1,
                                                   parameter_initial=[init], parameter_initial_enable=1)}, ui=True)
    params[i] = [LONG % long, short, 0]
    return i


# output and sends (offsets 0x0A-0x0D, 0x19)
panel(0.0, 260.0)
comment("Output and sends", [0.0, 0.0, 260.0, 18.0], DIM, 1)
comment("output", [4.0, 20.0, 50.0, 18.0])
sender(menu("OutputAssign", "Output Assign", "output", [52.0, 22.0, 60.0, 15.0], ["MIX", "EFX", "DIR1", "DIR2", "PATCH"], 4), 10)
comment("EFX", [124.0, 20.0, 30.0, 18.0])
sender(menu("OutputSelect", "Output Select", "EFX", [154.0, 22.0, 40.0, 15.0], ["A", "B", "C"], 0), 25)
for k, (var, long, short, off, init) in enumerate([("MixSend", "Mix/EFX Send", "mix/efx", 11, 127),
                                                    ("ChorusSend", "Chorus Send", "chorus", 12, 0),
                                                    ("ReverbSend", "Reverb Send", "reverb", 13, 0)]):
    sender(dial(var, long, short, [12.0 + 82.0 * k, 50.0, 41.0, 48.0], 0, 127, init), off)
comment("output PATCH: the patch's own routing", [4.0, 140.0, 252.0, 18.0], DIM)
# tuning (0x08, 0x09)
panel(263.0, 120.0)
comment("Tuning", [263.0, 0.0, 120.0, 18.0], DIM, 1)
sender(dial("CoarseTune", "Coarse Tune", "coarse", [272.0, 30.0, 41.0, 48.0], -48, 48, 0), 8, plus=48)
sender(dial("FineTune", "Fine Tune", "fine", [328.0, 30.0, 41.0, 48.0], -50, 50, 0), 9, plus=50)
# receive switches (0x0E-0x10)
panel(386.0, 134.0)
comment("Receive", [386.0, 0.0, 134.0, 18.0], DIM, 1)
for k, (var, long, short, off) in enumerate([("RxProgram", "Rx Program Change", "rx pgm", 14),
                                              ("RxVolume", "Rx Volume", "rx vol", 15),
                                              ("RxHold", "Rx Hold-1", "rx hold", 16)]):
    y = 24.0 + 22.0 * k
    comment(["program change", "volume (CC 7)", "hold-1 (CC 64)"][k], [392.0, y - 2.0, 100.0, 18.0])
    sender(toggle(var, long, short, [496.0, y, 15.0, 15.0], 1), off)

pat["boxes"] = front + boxes   # controls first: drawn on top of the panels
pat["lines"] = lines
pat["parameters"] = dict(params, parameterbanks={})
pat["rect"] = [100.0, 100.0, 1400.0, 1100.0]
dump(d, DST)
if CHECK:
    if DST.read_bytes() != REAL.read_bytes():
        sys.exit("device/JV_PARTEDIT.maxpat is out of date: run python3 -I tools/part_page.py")
    print("JV_PARTEDIT.maxpat up to date")
else:
    print("wrote JV_PARTEDIT.maxpat:", len(pat["boxes"]), "boxes,", len(params), "parameters")
