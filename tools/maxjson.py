"""Read/write Max patcher JSON in Max's own formatting, so edited files diff cleanly.

Two layouts exist: Max 8 (tabs, `"key" : value`) and Max 9 (4 spaces, `"key": value`). dump() keeps
whichever layout the file on disk already uses.

    from maxjson import load, dump
    obj = load(path)            # .maxpat or .amxd (unfrozen)
    dump(obj, path)             # writes back with the same layout Max uses
"""
import json
import struct
from pathlib import Path


class MaxFloat(float):
    """A float that remembers how Max wrote it, so untouched numbers round-trip exactly."""

    def __new__(cls, text):
        f = super().__new__(cls, text)
        f.text = text
        return f


def _scalar(v):
    if isinstance(v, bool):
        return "true" if v else "false"
    if v is None:
        return "null"
    if isinstance(v, MaxFloat):
        return v.text
    if isinstance(v, float):
        return repr(v)
    return json.dumps(v, ensure_ascii=False)


def _value(v, k):
    """Render a value whose key sits at indent k."""
    if isinstance(v, dict):
        return _dict(v, k, k)
    if isinstance(v, list):
        if not v:
            return "[  ]"
        return "[ " + ", ".join(_dict(e, k + 1, k + 1) if isinstance(e, dict) else _value(e, k) for e in v) + " ]"
    return _scalar(v)


def _dict(d, prefix, k):
    tabs = "\t" * prefix
    if not d:
        return tabs + "{\n" + "\n" + "\t" * k + "}\n"
    body = ",\n".join("\t" * (k + 1) + json.dumps(key, ensure_ascii=False) + " : " + _value(val, k + 1) for key, val in d.items())
    return tabs + "{\n" + body + "\n" + "\t" * k + "}\n"


def dumps(obj):
    return _dict(obj, 0, 0)[:-1]  # top level has no trailing newline


def _value9(v, ind):
    pad = " " * ind
    if isinstance(v, dict):
        if not v:
            return "{" + pad + "}"
        return "{\n" + ",\n".join(pad + "    " + json.dumps(k, ensure_ascii=False) + ": " + _value9(x, ind + 4) for k, x in v.items()) + "\n" + pad + "}"
    if isinstance(v, list):
        if not v:
            return "[]"
        if all(not isinstance(x, (dict, list)) for x in v):
            return "[ " + ", ".join(_scalar(x) for x in v) + " ]"
        return "[\n" + ",\n".join(pad + "    " + _value9(x, ind + 4) for x in v) + "\n" + pad + "]"
    return _scalar(v)


def dumps9(obj):
    return _value9(obj, 0)


def _is_max9(text):
    return text.startswith('{\n    "')


def loads(text):
    return json.loads(text, parse_float=MaxFloat)


def _split_amxd(raw):
    i = raw.index(b"ptch")
    return raw[:i], raw[i + 8:]


def load(path):
    raw = Path(path).read_bytes()
    if raw[:4] == b"ampf":
        raw = _split_amxd(raw)[1]
    return loads(raw.rstrip(b"\x00").decode("utf-8"))


def dump(obj, path):
    path = Path(path)
    old = path.read_bytes()
    current = _split_amxd(old)[1] if old[:4] == b"ampf" else old
    text = (dumps9(obj) if _is_max9(current.decode("utf-8", "replace")) else dumps(obj)).encode("utf-8")
    if path.suffix == ".amxd":
        head, body = _split_amxd(old)
        tail = body[len(body.rstrip(b"\x00")):]
        payload = text + b"\n" + tail if body.rstrip(b"\x00").endswith(b"\n") else text + tail
        path.write_bytes(head + b"ptch" + struct.pack("<I", len(payload)) + payload)
    else:
        path.write_bytes(text + b"\n" if old.endswith(b"\n") else text)
