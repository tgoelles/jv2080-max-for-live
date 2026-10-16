#!/usr/bin/env python3
"""Sanity-check device patchers: JSON parses, box ids are unique per patcher, patch lines connect to
existing boxes and valid inlet/outlet indexes, and Live parameter long names are unique.

    python3 -I tools/validate.py device/*.maxpat "device/JV 2080 Control.amxd"
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import maxjson


def check(p, path, errors):
    ids = [b["box"]["id"] for b in p["boxes"]]
    errors += [f"{path}: duplicate box id {i}" for i in sorted({i for i in ids if ids.count(i) > 1})]
    boxes = {b["box"]["id"]: b["box"] for b in p["boxes"]}
    for l in p["lines"]:
        (s, so), (d, di) = l["patchline"]["source"][:2], l["patchline"]["destination"][:2]
        if s not in boxes or d not in boxes:
            errors.append(f"{path}: line {s}:{so} -> {d}:{di} references a missing box")
            continue
        if so >= boxes[s].get("numoutlets", 0):
            errors.append(f"{path}: {s} has no outlet {so}")
        if di >= boxes[d].get("numinlets", 0):
            errors.append(f"{path}: {d} has no inlet {di}")
    for b in boxes.values():
        if "patcher" in b:
            check(b["patcher"], f"{path}/{b['id']}", errors)


def main(files):
    errors = []
    for f in files:
        p = maxjson.load(f)["patcher"]
        check(p, Path(f).name, errors)
        names = [v[0] for k, v in p.get("parameters", {}).items() if k.startswith("obj-")]
        errors += [f"{Path(f).name}: duplicate parameter name {n!r}" for n in sorted({n for n in names if names.count(n) > 1})]
    print("\n".join(errors) or f"OK ({len(files)} files)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
