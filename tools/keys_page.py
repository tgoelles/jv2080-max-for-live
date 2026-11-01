#!/usr/bin/env python3
"""Generate device/JV_KEYS.maxpat: the Keys page (16 key ranges in jsui jvkeys.js over 32 hidden controls, key range switch).

The page is generated: change this script, not the patch, then run

    python3 -I tools/keys_page.py           # write the page
    python3 -I tools/keys_page.py --check   # exit 1 if the page is out of date (tools/check.sh)

The page's bpatcher(s) and wiring in the main device were added once (see git history); new Live parameters show up
there after the device is saved in Max.
"""
import re, shutil, sys, tempfile
from pathlib import Path
ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
from maxjson import load, dump
from infoview import annotate

GREY = [0.647058823529412, 0.647058823529412, 0.647058823529412, 1.0]
DIM = [0.352941176470588, 0.352941176470588, 0.352941176470588, 1.0]
PANEL = [0.156862745098039, 0.156862745098039, 0.156862745098039, 1.0]
JS = {"filename": "jvparam.js", "parameter_enable": 0}
NOTES = [n + str(o - 1) for o in range(11) for n in ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]][:128]
WIDTH = 986.0

DST = ROOT / "device" / "JV_KEYS.maxpat"
REAL = DST
CHECK = "--check" in sys.argv
if CHECK:
    _tmp = tempfile.TemporaryDirectory()
    DST = Path(_tmp.name) / REAL.name
    shutil.copy(REAL, DST)
d = load(DST)
pat = d["patcher"]
boxes, front, lines, params = [], [], [], {}
n = [0]


def add(box, ui=False):
    n[0] += 1
    box["id"] = "obj-%d" % n[0]
    (front if ui else boxes).append({"box": box})
    return box["id"]


def line(a, b, ao=0, bi=0):
    lines.append({"patchline": {"destination": [b, bi], "source": [a, ao]}})


def obj(text, x, y, ins=1, outs=1, attrs=None, types=None):
    b = {"maxclass": "newobj", "numinlets": ins, "numoutlets": outs, "outlettype": types or [""] * outs,
         "patching_rect": [x, y, 8.0 * len(text) + 24, 22.0], "text": text}
    if attrs:
        b["saved_object_attributes"] = attrs
    return add(b)


out = obj("s ---sysex", 20.0, 1040.0, 1, 0)
gate = obj("gate 1 0", 20.0, 1000.0, 2, 1)   # only in Perform mode
line(gate, out)
rmode = obj("r ---mode", 20.0, 960.0, 0, 1)
line(rmode, gate, 0, 0)


def sender(src, a3, off, x, y):
    sx = obj("js jvparam.js 1 0 %d %d" % (a3, off), x, y, 2, 1, JS)
    line(src, sx)
    line(sx, gate, 0, 1)


add({"maxclass": "live.comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [1200.0, 300.0, 200.0, 18.0], "presentation": 1,
     "presentation_rect": [0.0, 0.0, WIDTH, 18.0], "text": "Key ranges", "textcolor": DIM, "textjustification": 1}, ui=True)
sw = add({"appearance": 1, "maxclass": "live.toggle", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "parameter_enable": 1,
          "patching_rect": [20.0, 60.0, 15.0, 15.0], "presentation": 1, "presentation_rect": [8.0, 2.0, 15.0, 15.0], "varname": "KeyRangeSwitch",
          "hint": "Key ranges on: each part plays only its range. Off: every part plays the whole keyboard.",
          "saved_attribute_attributes": {"valueof": {"parameter_longname": "Key Range Switch", "parameter_shortname": "key ranges",
              "parameter_type": 2, "parameter_enum": ["off", "on"], "parameter_mmax": 1, "parameter_initial": [1], "parameter_initial_enable": 1}}},
         ui=True)
params[sw] = ["Key Range Switch", "key ranges", 0]
add({"maxclass": "live.comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [1200.0, 330.0, 100.0, 18.0], "presentation": 1,
     "presentation_rect": [26.0, 0.0, 100.0, 18.0], "text": "key ranges on", "textcolor": GREY}, ui=True)
sender(sw, 0, 0x2F, 20.0, 700.0)
ui = add({"border": 0, "filename": "jvkeys.js", "maxclass": "jsui", "numinlets": 1, "numoutlets": 1, "outlettype": [""],
          "parameter_enable": 0, "patching_rect": [400.0, 60.0, 600.0, 140.0], "presentation": 1,
          "presentation_rect": [8.0, 20.0, WIDTH - 16.0, 140.0]}, ui=True)
psw = obj("prepend keysw", 20.0, 100.0)
line(sw, psw)
line(psw, ui)
rp = obj("r ---partkeys", 200.0, 20.0, 0, 1)   # part on/off from the Parts page
line(rp, ui)
names = []
for p in range(1, 17):
    for k, (field, off, init, long) in enumerate((("Lo", 17, 0, "Lower"), ("Hi", 18, 127, "Upper"))):
        x = 20.0 + 140.0 * (2 * (p - 1) + k)
        var = "P%dKey%s" % (p, field)
        names.append(var)
        nb = add({"appearance": 4, "maxclass": "live.numbox", "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"],
                  "parameter_enable": 1, "patching_rect": [x, 300.0, 44.0, 15.0], "varname": var,
                  "saved_attribute_attributes": {"valueof": {"parameter_longname": "Part %d Key Range %s" % (p, long),
                      "parameter_shortname": "key " + field.lower(), "parameter_type": 2, "parameter_enum": NOTES, "parameter_mmax": 127,
                      "parameter_initial": [init], "parameter_initial_enable": 1}}})
        params[nb] = ["Part %d Key Range %s" % (p, long), "key " + field.lower(), 0]
        sender(nb, 0x0F + p, off, x, 400.0)
        pr = obj("prepend part %d %s" % (p, field.lower()), x, 340.0)
        line(nb, pr)
        line(pr, ui)
route = obj("route " + " ".join(names), 400.0, 240.0, 1, 33)
line(ui, route)
for i, var in enumerate(names):
    line(route, next(b["box"]["id"] for b in boxes if b["box"].get("varname") == var), i, 0)
add({"angle": 270.0, "background": 1, "bgcolor": PANEL, "ignoreclick": 0, "maxclass": "panel", "mode": 0, "numinlets": 1, "numoutlets": 0,
     "patching_rect": [20.0, 1100.0, WIDTH, 163.0], "presentation": 1, "presentation_rect": [0.0, 0.0, WIDTH, 163.0], "proportion": 0.5})
pat["boxes"] = front + boxes
pat["lines"] = lines
pat["parameters"] = dict(params, parameterbanks={})
annotate(pat, "JV_KEYS")   # Live's Info View texts
dump(d, DST)
if CHECK:
    if DST.read_bytes() != REAL.read_bytes():
        sys.exit("device/JV_KEYS.maxpat is out of date: run python3 -I tools/keys_page.py")
    print("JV_KEYS.maxpat up to date")
else:
    print("wrote JV_KEYS.maxpat:", len(pat["boxes"]), "boxes,", len(params), "parameters")
