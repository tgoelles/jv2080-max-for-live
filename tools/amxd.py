#!/usr/bin/env python3
"""Helpers for Max for Live .amxd files.

  amxd.py unfreeze FROZEN.amxd OUTDIR   split a frozen device into an unfrozen .amxd + abstractions
  amxd.py textconv FILE.amxd            print the patcher JSON (used as git diff textconv)
"""
import re
import struct
import sys
from pathlib import Path

HEADER_DEVICE_TYPE = b"mmmm"  # MIDI effect


def chunk(tag: bytes, payload: bytes) -> bytes:
    return tag + struct.pack("<I", len(payload)) + payload


def read_chunks(data: bytes):
    """Yield (tag, payload) for the top-level ampf/meta/ptch chunks."""
    pos = 0
    if data[:4] != b"ampf":
        raise ValueError("not an .amxd file")
    yield b"ampf", data[8:12]
    pos = 12
    while pos < len(data):
        tag = data[pos:pos + 4]
        size = struct.unpack("<I", data[pos + 4:pos + 8])[0]
        yield tag, data[pos + 8:pos + 8 + size]
        pos += 8 + size


def unfreeze(src: Path, outdir: Path) -> None:
    data = src.read_bytes()
    chunks = dict(read_chunks(data))
    ptch = chunks[b"ptch"]
    if not ptch.startswith(b"mx@c"):
        raise ValueError("device is not frozen")
    # Frozen container: file directory entries (dire) carry name (fnam), offset (of32), size (sz32).
    names = [m.group(1).decode() for m in re.finditer(rb"fnam....([^\x00]+)", ptch, re.S)]
    offs = [struct.unpack(">I", m.group(1))[0] for m in re.finditer(rb"of32....(....)", ptch, re.S)]
    sizes = [struct.unpack(">I", m.group(1))[0] for m in re.finditer(rb"sz32....(....)", ptch, re.S)]
    outdir.mkdir(parents=True, exist_ok=True)
    for name, off, size in zip(names, offs, sizes):
        body = ptch[off:off + size]
        if name.endswith(".amxd"):
            out = chunk(b"ampf", HEADER_DEVICE_TYPE) + chunk(b"meta", chunks[b"meta"]) + chunk(b"ptch", body)
            (outdir / name).write_bytes(out)
        else:
            (outdir / name).write_bytes(body)
        print(f"wrote {outdir / name} ({size} bytes)")


def textconv(path: Path) -> None:
    data = path.read_bytes()
    ptch = dict(read_chunks(data)).get(b"ptch", data)
    sys.stdout.write(ptch.rstrip(b"\x00").decode("utf-8", "replace"))


if __name__ == "__main__":
    cmd, *args = sys.argv[1:]
    if cmd == "unfreeze":
        unfreeze(Path(args[0]), Path(args[1]))
    elif cmd == "textconv":
        textconv(Path(args[0]))
    else:
        sys.exit(__doc__)
