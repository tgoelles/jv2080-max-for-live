#!/bin/sh
# Run every offline check: patch structure, generated bindings, Node tests.
set -e
cd "$(dirname "$0")/.."
python3 -I tools/validate.py device/*.maxpat "device/JV 2080 Control.amxd" "diagnostics/JV SysEx Monitor.amxd"
python3 -I tools/bindings.py --check
for f in tests/*.test.js; do
	node "$f"
done
