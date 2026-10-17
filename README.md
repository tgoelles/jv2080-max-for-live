# JV-2080 Control

A Max for Live device that edits a Roland JV-2080 from Ableton Live over MIDI SysEx.
The JV-1080 and XP-50/80 support is planned.

![JV-2080 Control in Ableton Live](docs/screenshot.webp)

The device has per-tone sections for Wave, Pitch, Filter and Amplifier (envelopes, keyfollow and
velocity). Top left is the program block: bank/program select, the patch name, and **Send** (device → JV) / **Get**
(JV → device). Below are the tone switches and levels, and Effects on/off. Use the Tone1–4 tabs to
choose which tone you're editing; the **Setup** button below them opens the Device ID and SysEx timing settings.

Download it from [maxforlive.com](https://maxforlive.com/library/device/7406/jv-2080-control) or from this repo's Releases page.

## Requirements

- Ableton Live 12 with **Max 9** or newer (Max for Live). Since 0.1.3 the device is saved with Max 9; Live 11 / Max 8
  aren't supported. Use [v0.1.2](https://github.com/tgoelles/jv2080-max-for-live/releases/tag/v0.1.2) for those.
- A Roland JV-2080 connected by MIDI in and out. JV-1080 and XP-50/80 support is planned.

## MIDI setup

The device talks to the JV in **both directions**. It sends your edits, and it reads the JV's patch back (**Get**). Both
directions must be wired, or **Get** silently does nothing.

**Cables:** interface MIDI OUT → JV **MIDI IN**, and JV **MIDI OUT** → interface MIDI IN.

**Live → Settings → Link, Tempo & MIDI:** for your MIDI interface, turn **Track** on for both the **input** and the
**output** port.

**The track with the device:**

| Setting | Value |
|---|---|
| MIDI From | **All Ins**, or your interface's port, e.g. *UltraLite mk3 Hybrid (MIDI Port)* |
| Channel (below MIDI From) | **All Channels** |
| Monitor | **In** |
| MIDI To | your interface's port, the one going to the JV |

> **Common mistake:** setting **MIDI From** to *another Live track* (e.g. a track named "JV 2080 MIDI") instead of the
> hardware port. Editing still works, but nothing from the JV reaches the device, so **Get** never loads anything.
> MIDI From must be the hardware port or All Ins. All Ins also keeps your keyboard working on this track.

> **Avoid MIDI loops:** only the JV 2080 Control track should both **receive from** and **send to** the JV. Any other
> track with MIDI From = the JV's port (or All Ins), Monitor In **and** MIDI To = the JV's port echoes everything the JV
> sends straight back to it. The JV then writes its own patch data into the edit buffer and shows the patch as edited
> (**\***), and every read-back doubles the traffic.

To check the wiring, use the [JV SysEx Monitor](diagnostics/README.md). It shows whether data from the JV arrives.

## Setup

1. Put the device on the MIDI track set up as above.
2. Put the JV-2080 in **Patch** mode. If you changed the JV's Device ID (SYSTEM → MIDI, default 17), click **Setup**
   (below the Tone tabs) and set **Device ID** to the same number.
3. Click **Get** (top left, under the patch name) to load the JV's current patch into the device, including its name. After a program change
   this happens automatically. You can turn that off on the **Setup** page. To have the device follow when you pick
   patches on the **JV's own panel**, keep **Setup → Follow JV patch changes** on (default). Edits made on the JV's
   panel, such as turning Cutoff, also show up in the device live.
4. When the set loads, the device sends its saved settings to the JV, so the saved set always wins on load. To send
   them again, click **Send**, next to Get. You can turn off sending on load on the **Setup** page.

## Expansion boards

Open **Setup** and pick the board installed in each slot (A–H). SYSTEM → Info on the JV shows them. The Wave group menu then
lists INT-A, INT-B and your boards with their slot, e.g. **XP-A Techno**. The setup is saved with the Live set.

The **bank menu** in the program block works the same way: it adds **XP-A1** (patches 1–128) and **XP-A2**
(129–255) for every slot with a board, so you can select the board's own patches.

Internally a wave group is stored by SR-JV80 board number, the same way the JV stores it in a patch. So automation and saved
sets keep working if you move a board to another slot. A patch that uses a board you haven't set up shows as
"SR-nn (not set up)".

| | | | |
|---|---|---|---|
| SR-01 Pop | SR-06 Dance | SR-11 Techno | SR-16 Orchestral II |
| SR-02 Orchestral | SR-07 Super Sound Set | SR-12 Hip Hop | SR-17 Country |
| SR-03 Piano | SR-08 Keyboards of the 60s & 70s | SR-13 Vocal | SR-18 Latin |
| SR-04 Vintage Synth | SR-09 Session | SR-14 Asia | SR-19 House |
| SR-05 World | SR-10 Bass & Drum | SR-15 Special FX | |


## Development

The source files are in `device/`: an unfrozen `.amxd`, its `.maxpat` abstractions and two `.js` scripts. Open the
`.amxd` in Live, then edit it in Max.

**One-time setup:** in Max, open **Options → File Preferences** and add this repo's `device` folder to the search path.
Without it, a copy of the device, which Live sometimes opens when you click Edit, fails with
`bpatcher: error loading patcher JV_*.maxpat`, and freezing can't bundle the abstractions and scripts. To see readable diffs of `.amxd` files, run:

    git config diff.amxd.textconv "python3 -I tools/amxd.py textconv"

Run all offline checks (patch structure, generated bindings, tests) with `tools/check.sh`. It needs Python 3 and Node.

The [JV-2080 Owner's Manual](https://static.roland.com/assets/media/pdf/JV-2080_OM.pdf) is from Roland. Its MIDI
implementation starts on p.184.

## License

[CC BY-NC 4.0](LICENSE) (Creative Commons Attribution-NonCommercial): free to use, share and modify, but not for commercial purposes. Same license as on maxforlive.com.
