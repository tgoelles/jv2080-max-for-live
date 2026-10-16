# JV-2080 Control (Max for Live)

A Max for Live MIDI effect that edits a Roland JV-2080 over SysEx from Ableton Live.
It is published on maxforlive.com (https://maxforlive.com/library/device/7406/jv-2080-control)
and has outside users. Goal: a reliable editor for the JV-2080, and also the JV-1080 and
XP-50/80. These share model ID `0x6A`.

## Layout

- `device/JV 2080 Control.amxd`: the main device, **unfrozen**. It is a binary header followed by patcher JSON.
- `device/JV_*.maxpat`: abstractions loaded as bpatchers: `JV_Wave`, `JV_Pitch`, `JV_Filter`, `JV_VCA`.
  Each runs once per tone. The tone's address byte (`16/18/20/22` = `0x10/0x12/0x14/0x16`) comes in on inlet 2.
- `device/jv_sysex_queue.js`: a Max `js` object (ES5) in front of the main `midiout`. **All SysEx must go through it**: wire it to inlet 1, or use `s ---sysex` inside subpatchers. It sends one message every 10 ms and merges queued messages for the same address. Without it, the JV reports "MIDI buffer full".
- `tests/`: Node tests that mock the Max `js` globals. Run them with `node tests/<file>.test.js`.
- `tools/amxd.py`: `unfreeze` splits a frozen device into source files. `textconv` prints the JSON for git diffs.
- `docs/JV-2080_OM.pdf`: Roland owner's manual. It is gitignored; download it from
  https://static.roland.com/assets/media/pdf/JV-2080_OM.pdf. It is a scan with no text layer, so read the pages as images.
  MIDI Implementation starts on p.184, the parameter address map is on pp.188–194, and the checksum example is on p.193.
- `dist/`: frozen release builds. These are gitignored and get attached to GitHub Releases.

## Editing patches

- Patchers are JSON, so edits can be made directly. Keep the `"id"` values unique within a patcher, and make every
  `lines` entry refer to existing ids and valid inlet/outlet indexes.
- After any edit, check that the file still parses as JSON. For the `.amxd`, the JSON starts after the `ptch` chunk header.
  If the payload length changes, update the 4-byte little-endian length that follows `ptch`.
- Live parameter Long Names must be unique and stable. Renaming one breaks automation and users' saved sets, so do it only on purpose and note it in the changelog.
- Use `---`-prefixed send/receive names so they stay local to the device instance.
- Claude can't run Max, Live or the synth. Every change needs a hardware test by the maintainer, so write test steps in the PR or issue.

## SysEx (Roland DT1)

`F0 41 <dev> 6A 12 <a1 a2 a3 a4> <data…> <sum> F7`

- `dev` is the device ID minus 1. The default is `0x10` (device ID 17). It is currently hard-coded.
- Checksum: `sum = (128 - (a1+a2+a3+a4+data…) % 128) % 128`. The outer `% 128` is required.
- Temporary Patch (Patch mode): `03 00 00 xx` = patch common; `03 00 10/12/14/16 xx` = tones 1–4.
- System common: `00 00 00 xx`. Performance-mode temporary patches use `02 xx 00 00` and are not supported yet.
- Values with a "#" in the address map, such as the wave number, are split into 4-bit nibbles, high nibble first.
- Bank select MSB/LSB for the JV-2080 is on p.184. The JV-1080 bank list is different.

## Releases

Freeze the device in Max with the snowflake button, then save it as `dist/JV 2080 Control_<version>.amxd`.
Attach that file to a GitHub Release tagged `v<version>` and upload the same file to maxforlive.com.
Keep version numbers semver and matching on both sites.
