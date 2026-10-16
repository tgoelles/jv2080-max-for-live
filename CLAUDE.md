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
- `device/jv_wavegroup.js`: builds each tone's short Wave group menu from the expansion board setup.
- `tests/`: Node tests that mock the Max `js` globals. Run them with `node tests/<file>.test.js`.
- `tools/maxjson.py`: loads and saves patchers in Max's exact formatting, so a file that is loaded and saved unchanged stays byte-identical. Use it for structural edits rather than splicing text.
- `tools/validate.py`: checks that patch lines point at existing boxes and valid inlets/outlets, and that parameter long names are unique. Run it after every patch edit. When adding boxes, derive new ids from the patcher's current maximum; never hard-code them.
- `tools/amxd.py`: `unfreeze` splits a frozen device into source files. `textconv` prints the JSON for git diffs.
- `docs/JV-2080_OM.pdf`: Roland owner's manual. It is gitignored; download it from
  https://static.roland.com/assets/media/pdf/JV-2080_OM.pdf. It is a scan with no text layer, so read the pages as images.
  MIDI Implementation starts on p.184, the parameter address map is on pp.188–194, and the checksum example is on p.193.
- `dist/`: frozen release builds. These are gitignored and get attached to GitHub Releases.

## Editing patches

- Target: **Live 12 + Max 9** or newer. The device is saved with Max 9.1, in the 4-space JSON layout, and `tools/maxjson.py` keeps that layout. JavaScript may use the `v8` object (modern JS). The existing `js` object (`jv_sysex_queue.js`) keeps working.

- Patchers are JSON, so edits can be made directly. Keep the `"id"` values unique within a patcher, and make every
  `lines` entry refer to existing ids and valid inlet/outlet indexes.
- After any edit, check that the file still parses as JSON. For the `.amxd`, the JSON starts after the `ptch` chunk header.
  If the payload length changes, update the 4-byte little-endian length that follows `ptch`.
- Each tone section is one abstraction used 4 times (`Pitch_n`, `TVF_n`, `WG_n`, `VCA_n`). The Tone tab shows and hides them through `script show/hide` messages in the embedded tab bpatcher. Per-instance Live names live in the main patcher's `parameters.parameter_overrides`. The naming scheme for new parameters is `T<n> <Section> <Param>`.
- Keep the main view uncluttered. Settings you set once (device ID, pacing, and later model and mode) go on the **Setup** page: the embedded bpatcher `Settings`, opened by the outlined **Setup** button below the tone tabs. It's styled differently from the tabs on purpose. Don't use overlays: showing a hidden section doesn't reliably bring it to the front in Live, so pages swap content by hiding everything else instead. Tab logic: `t i b`. The bang hides every section and switches Setup off with `set 0`, then `sel 0 1 2 3` shows the tone. Setup on: hide all, then show Settings. Setup off: bang the `live.tab` to show the current tone again. Settings' outlet sends messages to `jv_sysex_queue.js`.
- Live parameter Long Names must be unique and stable. Renaming one breaks automation and users' saved sets, so do it only on purpose and note it in the changelog.
- Use `---`-prefixed send/receive names so they stay local to the device instance.
- Claude can't run Max, Live or the synth. Every change needs a hardware test by the maintainer, so write test steps in the PR or issue.

## SysEx (Roland DT1)

`F0 41 <dev> 6A 12 <a1 a2 a3 a4> <data…> <sum> F7`

- `dev` is the device ID minus 1. Senders always write `0x10`, and `jv_sysex_queue.js` replaces it with the **Device ID** from the Setup panel (17–32 → `0x10–0x1F`). The checksum doesn't include this byte.
- Checksum: `sum = (128 - (a1+a2+a3+a4+data…) % 128) % 128`. The outer `% 128` is required.
- Temporary Patch (Patch mode): `03 00 00 xx` = patch common; `03 00 10/12/14/16 xx` = tones 1–4.
- System common: `00 00 00 xx`. Performance-mode temporary patches use `02 xx 00 00` and are not supported yet.
- Values with a "#" in the address map, such as the wave number, are split into 4-bit nibbles, high nibble first.
- Wave group (tone `0x01` type, `0x02` id): INT-A/B = type 0, id 1/2; expansion = type 2 (EXP), id = SR-JV80 board number (confirmed on hardware with SR-JV80-11 in slot A). The encoding is the two `expr`s after the hidden `live.menu` in `JV_Wave.maxpat`.
- The visible Wave group control is a `umenu` filled by `jv_wavegroup.js` from the Setup page's slot menus (`s/r ---boards`). The stored, automatable parameter stays the hidden 21-entry `live.menu`. Never make a Live parameter's list depend on settings: stored values would change meaning.
- Bank select MSB/LSB for the JV-2080 is on p.184. The JV-1080 bank list is different.

## Releases

Freeze the device in Max with the snowflake button, then save it as `dist/JV 2080 Control_<version>.amxd`.
Attach that file to a GitHub Release tagged `v<version>` and upload the same file to maxforlive.com.
Keep version numbers semver and matching on both sites.
