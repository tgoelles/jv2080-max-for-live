#!/usr/bin/env python3
"""Trace every UI control in the device to the JV parameter it sends, and write device/jv2080_bindings.js.

For each jvparam sender (js jvparam.js a1 a2 a3 a4), follow its value inlet upstream through simple math objects (+ n, - n,
expr $i1 /2, ...) to the live.* control that feeds it. The result says, per parameter, which control
shows it and how the control's value turns into the raw JV value. The read-back (#6) inverts that to set
controls from received data.

    python3 -I tools/bindings.py          # write device/jv2080_bindings.js
    python3 -I tools/bindings.py --check  # exit 1 if the file is out of date
"""
import json
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import maxjson

ROOT = Path(__file__).resolve().parent.parent
DEVICE = ROOT / "device"
SECTIONS = {"JV_Wave": "WG", "JV_Pitch": "Pitch", "JV_Filter": "TVF", "JV_VCA": "VCA", "JV_LFO": "LFO", "JV_CTRL": "CTRL"}
UI = {"live.dial", "live.numbox", "live.slider", "live.menu", "live.toggle", "live.tab", "live.text"}
SX_ABSTRACTION = re.compile(r"^js jvparam\.js 3 0 -1 (\d+)( 2)?$")
SX_FIXED = re.compile(r"^js jvparam\.js 3 0 (\d+) (\d+)( 2)?$")
SX_PERF = re.compile(r"^js jvparam\.js 1 0 (\d+) (\d+)( 2)?$")   # temporary performance: common (a3 0), part p (a3 0x0F + p)
TONE_BY_A3 = {16: 1, 18: 2, 20: 3, 22: 4}
OPS = [
    (re.compile(r"^\+ (-?\d+)$"), lambda m: ["add", int(m.group(1))]),
    (re.compile(r"^- (-?\d+)$"), lambda m: ["add", -int(m.group(1))]),
    (re.compile(r"^expr \$i1 ?/ ?2$"), lambda m: ["div", 2]),
]


def params():
    out = subprocess.run(["node", "-e", "console.log(JSON.stringify(require('./device/jv2080_params.js')))"],
                         cwd=ROOT, capture_output=True, text=True, check=True).stdout
    return json.loads(out)


def control_range(box):
    v = box.get("saved_attribute_attributes", {}).get("valueof", {})
    if v.get("parameter_type") == 2 or box["maxclass"] in ("live.menu", "live.tab", "live.toggle"):
        n = len(v.get("parameter_enum", ["off", "on"]))
        return [0, n - 1]
    lo, hi = v.get("parameter_mmin", 0.0), v.get("parameter_mmax", 127.0)
    return [int(lo), int(hi)]


def trace(patcher, sx_id, inlet=0):
    """Walk upstream from a sender's value inlet; return (control box, ops applied control -> raw) or None."""
    boxes = {b["box"]["id"]: b["box"] for b in patcher["boxes"]}
    into = {}
    for l in patcher["lines"]:
        d, s = l["patchline"]["destination"], l["patchline"]["source"]
        into.setdefault((d[0], d[1]), []).append(s[0])
    node, ops = (sx_id, inlet), []
    for _ in range(10):
        sources = [s for s in into.get(node, []) if boxes[s]["maxclass"] != "inlet"]
        if len(sources) != 1:
            return None
        b = boxes[sources[0]]
        if b["maxclass"] in UI:
            return b, list(reversed(ops))
        for pat, op in OPS:
            m = pat.match(b.get("text", ""))
            if m:
                ops.append(op(m))
                break
        else:
            return None
        node = (b["id"], 0)
    return None


def build():
    P = params()
    by_off = {b: {p["off"]: p for p in P[b]} for b in ("tone", "common", "perf", "part")}
    bindings, problems = [], []

    def add(block, off, section, path, box, ops, tones):
        p = by_off[block].get(off)
        if p is None:
            problems.append(f"{section}: no {block} parameter at offset {off:#04x}")
            return
        rng = control_range(box)
        raw = []
        for x in rng:
            for op, n in ops:
                x = x + n if op == "add" else x // n
            raw.append(x)
        if raw[0] < p["min"] or raw[1] > p["max"]:
            problems.append(f"{section} {box.get('varname')}: control {rng} -> raw {raw} outside {p['id']} {p['min']}..{p['max']}")
        bindings.append({"block": block, "id": p["id"], "section": section, "path": path, "varname": box.get("varname"),
                         "ops": ops, "range": rng, "tones": tones})

    # tone sections: one abstraction per section, used for tones 1-4
    for name, section in SECTIONS.items():
        pat = maxjson.load(DEVICE / f"{name}.maxpat")["patcher"]
        for b in pat["boxes"]:
            m = SX_ABSTRACTION.match(b["box"].get("text", ""))
            if not m:
                continue
            off = int(m.group(1))
            if off in (1, 2):  # wave group type/id come from one menu (expr after t i i), special-cased
                continue
            got = trace(pat, b["box"]["id"])
            if got is None:
                problems.append(f"{section}: can't trace sender for offset {off:#04x}")
                continue
            add("tone", off, section, [section + "_{n}"], got[0], got[1], [1, 2, 3, 4])
        if name == "JV_Wave":
            menu = next(x["box"] for x in pat["boxes"] if x["box"].get("varname") == "live.menu" and
                        "Wave Group ID" == x["box"]["saved_attribute_attributes"]["valueof"]["parameter_longname"])
            bindings.append({"block": "tone", "id": "wave_group", "section": section, "path": [section + "_{n}"],
                             "varname": menu.get("varname"), "ops": [["wave_group"]], "range": control_range(menu), "tones": [1, 2, 3, 4]})

    # FX and Patch pages: one instance each with fixed addresses, patch common (a3 = 0) and per-tone settings
    # (a3 = tone byte, +1 for tone offsets from 0x80)
    for name, section, path in (("JV_FX", "FX", "FX"), ("JV_PATCH", "Patch", "PatchPage"), ("JV_CTRLCOMMON", "Ctrl", "CtrlCommon")):
        pat = maxjson.load(DEVICE / f"{name}.maxpat")["patcher"]
        for b in pat["boxes"]:
            m = SX_FIXED.match(b["box"].get("text", ""))
            if not m:
                continue
            a3, a4 = int(m.group(1)), int(m.group(2))
            if name == "JV_FX" and a3 == 0 and 13 <= a4 <= 24:
                # EFX Parameter 1-12: the dial feeds jvfx.js, which converts per EFX type (jv2080_efx.js)
                n = a4 - 12
                bindings.append({"block": "common", "id": "efx_param_%d" % n, "section": section, "path": [path],
                                 "varname": "EFXParam%d" % n, "ops": [["efx", n - 1]], "range": [0, 127], "tones": []})
                continue
            got = trace(pat, b["box"]["id"])
            if got is None:
                problems.append(f"{section}: can't trace sender {b['box']['text']}")
            elif a3 == 0:
                add("common", a4, section, [path], got[0], got[1], [])
            elif a3 - (a3 % 2) in TONE_BY_A3:
                add("tone", (a3 % 2) * 128 + a4, section, [path], got[0], got[1], [TONE_BY_A3[a3 - (a3 % 2)]])
            else:
                problems.append(f"{section}: unexpected address in {b['box']['text']}")

    # Perform mode: the Part page, one abstraction per part (address on its inlet, like the tone sections)
    pat = maxjson.load(DEVICE / "JV_PARTEDIT.maxpat")["patcher"]
    for b in pat["boxes"]:
        m = re.match(r"^js jvparam\.js 1 0 -1 (\d+)( 2)?$", b["box"].get("text", ""))
        if not m:
            continue
        got = trace(pat, b["box"]["id"])
        if got is None:
            problems.append(f"PartEdit: can't trace sender {b['box']['text']}")
        else:
            add("part", int(m.group(1)), "PartEdit", ["PartEdit_{n}"], got[0], got[1], list(range(1, 17)))

    # Perform mode: the Parts page (one instance), fixed addresses in the temporary performance. "tones" holds the
    # part number for block "part". The part's patch bank menu feeds Patch Group Type / ID (offsets 2/3) through two
    # exprs, like the wave group: special-cased as op "part_group".
    for b, pat, page in [(b, pat, page) for name, page in (("JV_PERFORM", "PerformPage"), ("JV_KEYS", "KeysPage"), ("JV_PERFFX", "PerfFX"))
                         for pat in [maxjson.load(DEVICE / f"{name}.maxpat")["patcher"]] for b in pat["boxes"]]:
        m = SX_PERF.match(b["box"].get("text", ""))
        if not m:
            continue
        a3, a4 = int(m.group(1)), int(m.group(2))
        if a3 == 0:
            block, tones = "perf", []
        elif 0x10 <= a3 <= 0x1F:
            block, tones = "part", [a3 - 0x0F]
        else:
            problems.append(f"Parts: unexpected address in {b['box']['text']}")
            continue
        if page == "PerfFX" and block == "perf" and 14 <= a4 <= 25:
            # EFX Parameter 1-12 of the performance (0x0E-0x19): converted per EFX type by jvfx.js, as on the FX page
            n = a4 - 13
            bindings.append({"block": "perf", "id": "efx_param_%d" % n, "section": "PerfFX", "path": [page],
                             "varname": "EFXParam%d" % n, "ops": [["efx", n - 1]], "range": [0, 127], "tones": []})
            continue
        if block == "part" and a4 in (2, 3):
            if a4 == 2:
                menu = next(x["box"] for x in pat["boxes"] if x["box"].get("varname") == "P%dBank" % tones[0])
                bindings.append({"block": "part", "id": "part_group", "section": "Parts", "path": ["PerformPage"],
                                 "varname": menu["varname"], "ops": [["part_group"]], "range": control_range(menu), "tones": tones})
            continue
        got = trace(pat, b["box"]["id"])
        if got is None:
            problems.append(f"Parts: can't trace sender {b['box']['text']}")
        else:
            add(block, a4, "Parts", [page], got[0], got[1], tones)

    # main patch: per-tone switches and levels live in the embedded Tone Switch bpatcher
    main = maxjson.load(DEVICE / "JV 2080 Control.amxd")["patcher"]
    for top in main["boxes"]:
        sub = top["box"].get("patcher")
        if not sub:
            continue
        for b in sub["boxes"]:
            m = SX_FIXED.match(b["box"].get("text", ""))
            if not m or int(m.group(1)) not in TONE_BY_A3:
                continue
            got = trace(sub, b["box"]["id"])
            if got is None:
                problems.append(f"main/{top['box']['id']}: can't trace sender {b['box']['text'][:40]}")
                continue
            add("tone", int(m.group(2)), "ToneMix", [top["box"].get("varname") or top["box"]["id"]], got[0], got[1],
                [TONE_BY_A3[int(m.group(1))]])
    return bindings, problems


def render(bindings):
    rows = ",\n".join("\t" + json.dumps(b, ensure_ascii=False) for b in sorted(bindings, key=lambda b: (b["section"], b["id"], b["tones"])))
    return f"""// Which device control shows which JV parameter. GENERATED by tools/bindings.py from the patches; don't edit.
// path: bpatcher varname(s) from the main patch ("{{n}}" = tone number); varname: the control inside it.
// block "perf" / "part": the temporary performance; for "part", tones = the part number.
// ops: control value -> raw JV value, applied in order ("add" n, "div" n); "wave_group" and "part_group" are special-cased.

var JV2080_BINDINGS = [
{rows}
];

if (typeof module !== "undefined") {{
\tmodule.exports = JV2080_BINDINGS;
}}
"""


if __name__ == "__main__":
    bindings, problems = build()
    text = render(bindings)
    out = DEVICE / "jv2080_bindings.js"
    for p in problems:
        print("WARNING:", p)
    if "--check" in sys.argv:
        if not out.exists() or out.read_text() != text:
            sys.exit("device/jv2080_bindings.js is out of date: run python3 -I tools/bindings.py")
        print(f"bindings up to date ({len(bindings)})")
    else:
        out.write_text(text)
        print(f"wrote {out.relative_to(ROOT)} ({len(bindings)} bindings)")
