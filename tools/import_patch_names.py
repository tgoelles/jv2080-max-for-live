#!/usr/bin/env python3
"""Build device/jv2080_patchnames.js (patch names per bank) for the Parts page.

Like the wave names (tools/import_wave_names.py), the names are Roland's copyright, so the maintainer imports them;
they are never written into the repository by hand.

    python3 -I tools/import_patch_names.py                       # download boards 01-19 (PATCH LIST sections)
    python3 -I tools/import_patch_names.py --from DIR            # local copies DIR/sr-jv80-NN.txt instead
    python3 -I tools/import_patch_names.py --internal FILE --keep   # add the JV's preset banks, keep the boards
    python3 -I tools/import_patch_names.py --pdf docs/JV2080pat.pdf --keep   # the same from Roland's JV-2080 Patch
                                                                             # Listing (needs pdftotext)

The internal preset banks come from a local text file: "=== PR-A ===" headings (PR-A..PR-E; PR-D = the GM bank)
followed by "1 Name" lines, or lines "PR-A 001 Name". USER patches need no file: the device reads them from the JV.
Board documents: only the PATCH LIST section is used; boards without one are left out.
"""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from import_wave_names import fetch, clean, ENTRY  # same documents, same name cleanup

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "device" / "jv2080_patchnames.js"
PATCH_HEADING = re.compile(r"patch\s*list|^\s*patches\s*:?\s*$", re.I)
END_HEADING = re.compile(r"wave\s*form|wave\s+list|rhythm|performance|copyright|^\s*\*{1,3}\s", re.I)
BANKS = ["PR-A", "PR-B", "PR-C", "PR-D", "PR-E"]
# documents whose patch list is wrong at the source
SKIP = {13: "its PATCH LIST holds the Vocal board's waveforms, not patches"}


def parse_patches(text):
    """number -> name from the first patch list of a board document."""
    names, inside = {}, False
    for line in text.splitlines():
        if not inside:
            if PATCH_HEADING.search(line):
                inside = True
            continue
        if END_HEADING.search(line) and not ENTRY.match(line):
            if names:
                break
            continue
        m = ENTRY.match(line)
        if m:
            n = int(m.group(1))
            if 1 <= n <= 255 and n not in names:
                name = clean(m.group(2))
                if name and not name.lower().startswith("name"):
                    names[n] = name
    return names


def parse_internal(path):
    banks, section = {b: {} for b in BANKS}, None
    for line in Path(path).read_text().splitlines():
        h = re.match(r"^\s*=+\s*(PR-[A-E])\s*=+\s*$", line)
        if h:
            section = h.group(1)
            continue
        m = re.match(r"^\s*(PR-[A-E])\s+(\d{1,3})\s+(\S.*?)\s*$", line)
        if m:
            banks[m.group(1)][int(m.group(2))] = clean(m.group(3))
            continue
        m = re.match(r"^\s*(\d{1,3})\s+(\S.*?)\s*$", line)
        if m and section:
            banks[section][int(m.group(1))] = clean(m.group(2))
    return banks


def parse_pdf(path):
    """Roland's JV-2080 Patch Listing (Faxback 10454): five columns per page, bank headings inside the columns.
    Read column by column, top to bottom; the USER bank is skipped (the device reads USER names from the JV)."""
    text = subprocess.run(["pdftotext", "-layout", str(path), "-"], capture_output=True, text=True, check=True).stdout
    banks, bank = {b: {} for b in BANKS}, None
    item = re.compile(r"(?<!\S)(?:(\d{3})\s+(\S.*?)|(USER|PR-[A-E])\b.*?(?:Bank\)?|\)))(?=\s{2,}|$)")
    for page in text.split("\f"):
        found = []   # (x, row, number or None, name or bank)
        for row, line in enumerate(page.splitlines()):
            for m in item.finditer(line):
                if m.group(1):
                    found.append((m.start(), row, int(m.group(1)), m.group(2)))
                else:
                    found.append((m.start(), row, None, m.group(3)))
        columns = []
        for x in sorted({f[0] for f in found}):
            if not columns or x - columns[-1][-1] > 3:
                columns.append([x])
            else:
                columns[-1].append(x)
        for col in columns:
            for f in sorted((f for f in found if f[0] in col), key=lambda f: f[1]):
                if f[2] is None:
                    bank = f[3]
                elif bank in banks and 1 <= f[2] <= 128:
                    banks[bank][f[2]] = clean(f[3].replace("\u2019", "'").replace("\u2018", "'"))
    return banks


def load_existing(path):
    out = subprocess.run(["node", "-e", "console.log(JSON.stringify(require(process.argv[1])))", str(Path(path).resolve())],
                         capture_output=True, text=True, check=True).stdout
    return {k: {i + 1: n for i, n in enumerate(v) if n} for k, v in json.loads(out).items()}


def render(groups):
    def arr(d):
        top = max(d) if d else 0
        return json.dumps([d.get(i, "") for i in range(1, top + 1)], ensure_ascii=False)
    body = ",\n".join('\t"%s": %s' % (k, arr(v)) for k, v in groups.items() if v)
    return f"""// Patch names per bank, index 0 = patch 1. GENERATED by tools/import_patch_names.py from Roland's documentation
// (Roland's copyright); not edited by hand. Empty = the Parts page shows only USER names (read from the JV).
var JV2080_PATCH_NAMES = {{
{body}
}};

if (typeof module !== "undefined") {{
\tmodule.exports = JV2080_PATCH_NAMES;
}}
"""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--from", dest="local", help="directory with local copies sr-jv80-NN.txt")
    ap.add_argument("--internal", help="text file with the PR-A..PR-E names")
    ap.add_argument("--pdf", help="Roland's JV-2080 Patch Listing (PDF with a text layer)")
    ap.add_argument("--out", default=str(OUT))
    ap.add_argument("--keep", action="store_true", help="merge into the existing file, don't download boards")
    a = ap.parse_args()
    groups = {k: v for k, v in (parse_internal(a.internal) if a.internal else {}).items() if v}
    if a.pdf:
        groups.update({k: v for k, v in parse_pdf(a.pdf).items() if v})
    for k, v in groups.items():
        print(f"  {k}: {len(v)} patches")
    if a.keep:
        existing = load_existing(a.out)
        existing.update(groups)
        groups = existing
    else:
        for n in range(1, 20):
            if n in SKIP:
                print(f"  SR-JV80-{n:02d}: skipped ({SKIP[n]})")
                continue
            names = parse_patches(fetch(n, a.local))
            print(f"  SR-JV80-{n:02d}: {len(names)} patches" + ("" if names else " (no patch list)"))
            if names:
                groups["SR-%02d" % n] = names
    groups = dict(sorted(groups.items()))
    Path(a.out).write_text(render(groups))
    print(f"wrote {a.out}: {', '.join(groups) or 'no names'}")


if __name__ == "__main__":
    main()
