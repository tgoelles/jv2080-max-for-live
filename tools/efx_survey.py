#!/usr/bin/env python3
"""Turn the EFX survey (docs/efx_survey.json, measured on a JV-2080 in October 2026) into the MEASURED block of
device/jv2080_efx.js: per EFX type, the wire slot of each parameter in
the manual's order, and the highest raw value of parameters whose steps the manual doesn't give.

    python3 -I tools/efx_survey.py            # check the survey, update device/jv2080_efx.js
    python3 -I tools/efx_survey.py --check    # only report

The survey is the order in which slots were first touched while walking the JV's EFX Param page top to bottom
(= the manual's order), plus min/max raw per slot. A slot counts as swept when it went down to 0.
Types already in MEASURED and not in the survey are kept.

The survey was recorded by a temporary recorder in jvreceive.js (see git history, commit 2d00206 "EFX survey
recorder"): every EFX parameter edited on the JV's panel was logged per type with its slot and raw value.
To measure more, bring that back on a branch.
"""
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TABLE = ROOT / "device" / "jv2080_efx.js"
SURVEY = ROOT / "docs" / "efx_survey.json"
BLOCK = re.compile(r"(// BEGIN MEASURED[^\n]*\n)(.*?)(\t// END MEASURED)", re.S)


def table():
    js = ("const E=require(process.argv[1]);console.log(JSON.stringify({types:E.TYPES,kinds:E.KINDS,measured:E.MEASURED,"
          "kmax:E.MEASURED_KINDS,rawkind:E.TYPES.map((t,i)=>t[1].map(p=>p[1]==='raw'?E.rawKind(i,p[0]):null))}))")
    return json.loads(subprocess.run(["node", "-e", js, str(TABLE)], capture_output=True, text=True, check=True).stdout)


def expected_max(kind):
    return len(kind["list"]) - 1 if "list" in kind else kind["max"]


def main():
    t = table()
    survey = json.loads(SURVEY.read_text()) if SURVEY.exists() else {}
    measured = {int(k): v for k, v in t["measured"].items()}
    kmax = {}   # recomputed from the survey every time
    problems = []
    for key, s in sorted(survey.items(), key=lambda kv: int(kv[0])):
        n = int(key)
        name, params = t["types"][n - 1]
        order = s["order"]
        # the JV may leave slots unused (STEREO-CHORUS skips 7, where STEREO-FLANGER has Feedback)
        if len(order) != len(params) or len(set(order)) != len(order) or not all(1 <= x <= 12 for x in order):
            problems.append(f"{n} {name}: slots touched {order}, expected {len(params)} different slots (walk incomplete?)")
            continue
        entry = {"order": order}
        maxes = {}
        for i, (label, kind) in enumerate(params):
            slot = order[i]
            lo, hi = s["min"].get(str(slot)), s["max"].get(str(slot))
            k = t["kinds"][kind]
            swept = lo == 0 and hi is not None and hi > 0   # went down to 0 and up again
            if k.get("raw"):
                rk = t["rawkind"][n - 1][i]
                if swept and hi is not None:
                    if rk in kmax and kmax[rk] != hi:
                        problems.append(f"{n} {name}: {label} swept 0-{hi}, but {rk} was 0-{kmax[rk]} elsewhere")
                    kmax[rk] = max(hi, kmax.get(rk, 0))
                    maxes[str(slot)] = hi
            elif hi is not None and hi > expected_max(k):
                problems.append(f"{n} {name}: {label} (slot {slot}) reached {hi}, more than its {kind} range 0-{expected_max(k)}: wrong slot?")
        if maxes:
            entry["max"] = maxes
        measured[n] = entry
        print(f"{n:2d} {name}: " + ", ".join(f"{params[i][0]}={order[i]}" for i in range(len(params))))
    for p in problems:
        print("CHECK:", p)
    missing = sorted(k for k in ["rate", "step", "phman", "pdly100", "pdly500", "dly500", "dly1000", "fbk", "phase", "gate"] if k not in kmax)
    if missing:
        print("not swept yet:", ", ".join(missing))
    body = "\tvar MEASURED_KINDS = " + json.dumps(dict(sorted(kmax.items())), separators=(", ", ": ")) + ";\n"
    body += "\tvar MEASURED = {\n" + ",\n".join(
        f"\t\t{n}: {json.dumps(measured[n], separators=(', ', ': '))}" for n in sorted(measured)) + "\n\t};\n"
    text = BLOCK.sub(lambda m: m.group(1) + body + m.group(3), TABLE.read_text())
    if "--check" not in sys.argv:
        TABLE.write_text(text)
        print(f"{len(measured)} of 40 types measured; wrote {TABLE.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
