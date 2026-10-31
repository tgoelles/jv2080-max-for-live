#!/usr/bin/env python3
"""Generate device/JV_PERFORM.maxpat: the Parts page (Perform mode's main view): 16 part strips with on/off, channel, bank, patch, name, level, pan and voice reserve.

The page is generated: change this script, not the patch, then run

    python3 -I tools/parts_page.py           # write the page
    python3 -I tools/parts_page.py --check   # exit 1 if the page is out of date (tools/check.sh)

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
BANKS = ["USER", "PR-A", "PR-B", "PR-C", "PR-GM", "PR-E", "CARD"] + ["EXP-%02d" % n for n in range(1, 20)]
JS = {"filename": "jvparam.js", "parameter_enable": 0}

DST = ROOT / "device" / "JV_PERFORM.maxpat"
REAL = DST
CHECK = "--check" in sys.argv
if CHECK:
    _tmp = tempfile.TemporaryDirectory()
    DST = Path(_tmp.name) / REAL.name
    shutil.copy(REAL, DST)
d = load(DST)
pat = d["patcher"]
boxes, lines, params = [], [], {}
n = [0]


def add(box):
    n[0] += 1
    box["id"] = "obj-%d" % n[0]
    boxes.append({"box": box})
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


def param(i, long, short):
    params[i] = [long, short, 0]
    return i


# the senders only reach the JV in Perform mode (stored values restored at load don't touch it in Patch mode)
out = obj("s ---sysex", 20.0, 1040.0, 1, 0)
sysex = obj("gate 1 0", 20.0, 1000.0, 2, 1)
line(sysex, out)
rmode = obj("r ---mode", 20.0, 960.0, 0, 1)
line(rmode, sysex, 0, 0)


def sender(src, a3, off, nibbles=False, x=0.0, y=0.0):
    sx = obj("js jvparam.js 1 0 %d %d%s" % (a3, off, " 2" if nibbles else ""), x, y, 2, 1, JS)
    line(src, sx)
    line(sx, sysex, 0, 1)


controls = []   # visible boxes, added before the panel so they're drawn on top
partkeys = obj("s ---partkeys", 20.0, 1080.0, 1, 0)
vjs = obj("js jvvoices.js", 300.0, 900.0, 1, 1, {"filename": "jvvoices.js", "parameter_enable": 0})
vrest = obj("s ---voicesrest", 300.0, 940.0, 1, 0)
line(vjs, vrest)
# bank menus and patch names: one jvparts.js (board setup from the Setup page, USER names from the JV)
parts = obj("js jvparts.js", 20.0, 900.0, 1, 1, {"filename": "jvparts.js", "parameter_enable": 0})
for r in ("r ---boards", "r ---model", "r ---usernames"):
    rr = obj(r, 20.0 + 150.0 * ["r ---boards", "r ---model", "r ---usernames"].index(r), 860.0, 0, 1)
    line(rr, parts)
ask = obj("s ---askname", 20.0, 940.0, 1, 0)
line(parts, ask)
for p in range(1, 17):
    a3 = 0x0F + p
    x0 = 2.0 + 61.0 * (p - 1)
    px = 20.0 + 260.0 * (p - 1)   # patching column per part
    # the part number is the on/off button (lit = on)
    on = add({"maxclass": "live.text", "numinlets": 1, "numoutlets": 2, "outlettype": ["", ""], "parameter_enable": 1,
              "text": str(p), "texton": str(p), "textcolor": GREY, "activetextoncolor": [0.0, 0.0, 0.0, 1.0],
              "bgcolor": [0.0, 0.0, 0.0, 0.0], "activebgcolor": [0.0, 0.0, 0.0, 0.0], "bgoncolor": ORANGE, "activebgoncolor": ORANGE,
              "bordercolor": GREY,
              "patching_rect": [px, 60.0, 24.0, 15.0], "presentation": 1, "presentation_rect": [x0 + 2.0, 2.0, 24.0, 15.0],
              "varname": "P%dOn" % p, "hint": "Part %d on/off (Receive Switch)" % p,
              "saved_attribute_attributes": valueof("Part %d Switch" % p, "on", 2, parameter_enum=["off", "on"], parameter_mmax=1,
                                                    parameter_initial=[1], parameter_initial_enable=1)})
    param(on, "Part %d Switch" % p, "on")
    sender(on, a3, 0, x=px, y=400.0)
    pk = obj("prepend part %d on" % p, px, 440.0)   # the Keys page dims parts that are off
    line(on, pk)
    line(pk, partkeys)
    ch = add({"appearance": 4, "maxclass": "live.numbox", "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"],
              "parameter_enable": 1, "patching_rect": [px + 30.0, 60.0, 36.0, 15.0], "presentation": 1,
              "presentation_rect": [x0 + 28.0, 2.0, 29.0, 15.0], "textjustification": 0, "varname": "P%dChannel" % p,
              "hint": "Part %d MIDI channel" % p,
              "saved_attribute_attributes": valueof("Part %d Channel" % p, "ch", 1, parameter_mmin=1.0, parameter_mmax=16.0,
                                                    parameter_initial=[p], parameter_initial_enable=1, parameter_unitstyle=9,
                                                    parameter_units="ch %d")})
    param(ch, "Part %d Channel" % p, "ch")
    m1 = obj("- 1", px + 30.0, 360.0, 2, 1)
    line(ch, m1)
    sender(m1, a3, 1, x=px + 30.0, y=440.0)
    view = add({"appearance": 1, "maxclass": "live.menu", "numinlets": 1, "numoutlets": 3, "outlettype": ["", "", "float"],
                "parameter_enable": 1, "patching_rect": [px + 160.0, 100.0, 60.0, 15.0], "presentation": 1,
                "presentation_rect": [x0 + 2.0, 20.0, 55.0, 15.0], "varname": "P%dBankView" % p, "hint": "Part %d patch bank" % p,
                "saved_attribute_attributes": valueof("Part %d Bank View" % p, "bank", 2, parameter_enum=["USER"], parameter_mmax=0,
                                                      parameter_invisible=2)})
    param(view, "Part %d Bank View" % p, "bank")
    pick = obj("prepend pick %d" % p, px + 160.0, 130.0)
    line(view, pick)
    line(pick, parts)
    controls.append({"maxclass": "live.comment", "numinlets": 1, "numoutlets": 0, "patching_rect": [px, 240.0, 58.0, 15.0],
                     "presentation": 1, "presentation_rect": [x0 - 1.5, 53.0, 61.0, 15.0], "text": "", "textcolor": GREY,
                     "fontsize": 8.0, "textjustification": 1, "varname": "P%dName" % p})
    bank = add({"appearance": 1, "maxclass": "live.menu", "numinlets": 1, "numoutlets": 3, "outlettype": ["", "", "float"],
                "parameter_enable": 1, "patching_rect": [px, 100.0, 80.0, 15.0],
                "varname": "P%dBank" % p,
                "saved_attribute_attributes": valueof("Part %d Bank" % p, "bank", 2, parameter_enum=BANKS, parameter_mmax=len(BANKS) - 1,
                                                      parameter_initial=[0], parameter_initial_enable=1)})
    param(bank, "Part %d Bank" % p, "bank")
    tii = obj("t i i", px, 300.0, 1, 2)
    line(bank, tii)
    pb = obj("prepend bank %d" % p, px + 160.0, 160.0)
    line(bank, pb)
    line(pb, parts)
    gtype = obj("expr ($i1 > 6) * 2", px, 340.0)
    gid = obj("expr ($i1 > 6) * ($i1 - 6) + ($i1 == 0) + ($i1 >= 1 && $i1 <= 5) * ($i1 + 2) + ($i1 == 6) * 2", px + 100.0, 330.0)
    line(tii, gid, 0, 0)    # id after type (t i i fires right to left)
    line(tii, gtype, 1, 0)
    sender(gtype, a3, 2, x=px, y=480.0)
    sender(gid, a3, 3, x=px + 100.0, y=480.0)
    num = add({"appearance": 4, "maxclass": "live.numbox", "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"],
               "parameter_enable": 1, "patching_rect": [px + 100.0, 100.0, 44.0, 15.0], "presentation": 1,
               "presentation_rect": [x0 + 2.0, 38.0, 55.0, 15.0], "textjustification": 0, "varname": "P%dPatch" % p,
               "hint": "Part %d patch number (1-128; expansion boards up to 255)" % p,
               "saved_attribute_attributes": valueof("Part %d Patch" % p, "patch", 1, parameter_mmin=1.0, parameter_mmax=255.0,
                                                     parameter_initial=[p], parameter_initial_enable=1, parameter_unitstyle=0)})
    param(num, "Part %d Patch" % p, "patch")
    m2 = obj("- 1", px + 100.0, 380.0, 2, 1)
    line(num, m2)
    pp_ = obj("prepend patch %d" % p, px + 100.0, 200.0)
    line(num, pp_)
    line(pp_, parts)
    sender(m2, a3, 4, nibbles=True, x=px + 100.0, y=520.0)
    lev = add({"maxclass": "live.slider", "modulationcolor": ORANGE, "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"],
               "parameter_enable": 1, "patching_rect": [px, 140.0, 22.0, 90.0], "presentation": 1,
               "presentation_rect": [x0 + 1.0, 70.0, 22.0, 92.0], "slidercolor": GREY, "textcolor": GREY, "trioncolor": ORANGE,
               "varname": "P%dLevel" % p, "hint": "Part %d level" % p,
               "saved_attribute_attributes": valueof("Part %d Level" % p, "level", 1, parameter_mmin=0.0, parameter_mmax=127.0,
                                                     parameter_initial=[100], parameter_initial_enable=1, parameter_unitstyle=0)})
    param(lev, "Part %d Level" % p, "level")
    sender(lev, a3, 6, x=px, y=560.0)
    pan = add({"activedialcolor": ORANGE, "activefgdialcolor": MID, "activeneedlecolor": MID, "maxclass": "live.dial",
               "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"], "parameter_enable": 1,
               "patching_rect": [px + 60.0, 140.0, 36.0, 48.0], "presentation": 1, "presentation_rect": [x0 + 23.0, 72.0, 36.0, 48.0],
               "textcolor": GREY, "tricolor": MID, "varname": "P%dPan" % p, "hint": "Part %d pan" % p,
               "saved_attribute_attributes": valueof("Part %d Pan" % p, "pan", 1, parameter_mmin=-64.0, parameter_mmax=63.0,
                                                     parameter_initial=[0], parameter_initial_enable=1, parameter_unitstyle=0)})
    param(pan, "Part %d Pan" % p, "pan")
    p64 = obj("+ 64", px + 60.0, 360.0, 2, 1)
    line(pan, p64)
    sender(p64, a3, 7, x=px + 60.0, y=600.0)
    # voice reserve: performance common 0x30-0x3F, under the pan knob
    vr = add({"appearance": 4, "maxclass": "live.numbox", "numinlets": 1, "numoutlets": 2, "outlettype": ["", "float"],
              "parameter_enable": 1, "patching_rect": [px + 160.0, 240.0, 40.0, 15.0], "presentation": 1,
              "presentation_rect": [x0 + 24.0, 144.0, 34.0, 15.0], "textjustification": 1, "varname": "P%dVoices" % p,
              "hint": "Part %d voice reserve: voices kept free for this part (all parts together at most 64)" % p,
              "saved_attribute_attributes": valueof("Part %d Voice Reserve" % p, "voices", 1, parameter_mmin=0.0, parameter_mmax=64.0,
                                                    parameter_initial=[0], parameter_initial_enable=1, parameter_unitstyle=9,
                                                    parameter_units="%d vc")})
    param(vr, "Part %d Voice Reserve" % p, "voices")
    sender(vr, 0, 0x2F + p, x=px + 160.0, y=640.0)
    pv = obj("prepend voice %d" % p, px + 160.0, 280.0)
    line(vr, pv)
    line(pv, vjs)

for c in controls:
    add(c)
add({"angle": 270.0, "background": 1, "bgcolor": PANEL, "ignoreclick": 0, "maxclass": "panel", "mode": 0, "numinlets": 1,
     "numoutlets": 0, "patching_rect": [20.0, 700.0, 986.0, 163.0], "presentation": 1, "presentation_rect": [0.0, 0.0, 986.0, 163.0],
     "proportion": 0.5})
# earlier boxes are drawn on top: UI first, panel last
ui = [b for b in boxes if b["box"].get("presentation") and b["box"]["maxclass"] != "panel"]
assert not any(b["box"].get("varname", "").endswith("Bank") and b["box"].get("presentation") for b in boxes)
rest = [b for b in boxes if not b["box"].get("presentation")]
panel = [b for b in boxes if b["box"]["maxclass"] == "panel"]
pat["boxes"] = ui + rest + panel
pat["lines"] = lines
pat["parameters"] = dict(params, parameterbanks={})
dump(d, DST)
if CHECK:
    if DST.read_bytes() != REAL.read_bytes():
        sys.exit("device/JV_PERFORM.maxpat is out of date: run python3 -I tools/parts_page.py")
    print("JV_PERFORM.maxpat up to date")
else:
    print("wrote JV_PERFORM.maxpat:", len(pat["boxes"]), "boxes,", len(params), "parameters")
