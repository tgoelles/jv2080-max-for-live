# JV-2080 Control

A Max for Live device that edits a Roland JV-2080 from Ableton Live over MIDI SysEx.
The JV-1080 and XP-50/80 support is planned.

![JV-2080 Control in Ableton Live](docs/screenshot.webp)

The device has per-tone sections for Wave, Pitch, Filter and Amplifier (envelopes, keyfollow and
velocity), plus Tone switches and levels, Effects on/off, and bank/program select. Use the Tone1–4 tabs to
choose which tone you're editing; the **Setup** button below them opens the Device ID and SysEx timing settings.

Download it from [maxforlive.com](https://maxforlive.com/library/device/7406/jv-2080-control) or from this repo's Releases page.

## Requirements

- Ableton Live 12 with **Max 9** or newer (Max for Live). Since 0.1.3 the device is saved with Max 9; Live 11 / Max 8
  aren't supported. Use [v0.1.2](https://github.com/tgoelles/jv2080-max-for-live/releases/tag/v0.1.2) for those.
- A Roland JV-2080 connected by MIDI in and out. JV-1080 and XP-50/80 support is planned.

## Setup

1. Put the device on a MIDI track and route that track's MIDI output to the port the JV-2080 is connected to.
2. Put the JV-2080 in **Patch** mode. If you changed the JV's Device ID (SYSTEM → MIDI, default 17), click **Setup**
   (below the Tone tabs) and set **Device ID** to the same number.
3. Click the **push to device** button (left column, above Effects On/Off) to send every setting shown in the device.

## Expansion boards

The Wave group menu lists **INT-A**, **INT-B** and **SR-01 … SR-19**, one entry per SR-JV80 expansion board number. Pick the
number of your board, not the slot it's in. The JV finds it in whichever slot (A–H) it's installed.

| | | | |
|---|---|---|---|
| SR-01 Pop | SR-06 Dance | SR-11 Techno | SR-16 Orchestral II |
| SR-02 Orchestral | SR-07 Super Sound Set | SR-12 Hip Hop | SR-17 Country |
| SR-03 Piano | SR-08 Keyboards of the 60s & 70s | SR-13 Vocal | SR-18 Latin |
| SR-04 Vintage Synth | SR-09 Session | SR-14 Asia | SR-19 House |
| SR-05 World | SR-10 Bass & Drum | SR-15 Special FX | |

SYSTEM → Info on the JV shows which boards are installed.

## Development

The source files are in `device/`: an unfrozen `.amxd` plus its `.maxpat` abstractions. Open the `.amxd` in Live,
then edit it in Max. To see readable diffs of `.amxd` files, run:

    git config diff.amxd.textconv "python3 -I tools/amxd.py textconv"

The [JV-2080 Owner's Manual](https://static.roland.com/assets/media/pdf/JV-2080_OM.pdf) is from Roland. Its MIDI
implementation starts on p.184.

## License

[CC BY-NC 4.0](LICENSE) (Creative Commons Attribution-NonCommercial): free to use, share and modify, but not for commercial purposes. Same license as on maxforlive.com.
