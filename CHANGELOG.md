# Changelog

All notable changes to JV 2080 Control. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and versions follow [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- **Library page** (button **Library** above Setup): back up the JV's whole user memory (patches, performances,
  rhythm sets, system) to a `.syx` file, restore it with confirmation and an automatic backup first, and record a
  bulk dump started on the JV. Files use the JV's own bulk dump format. (#39)
- **Patch / Perform switch** at the top left: switches the JV between Patch and Performance mode and follows the
  JV's own PATCH / PERFORM buttons. In Perform mode the program block selects performances (USER, PR-A, PR-B, CARD,
  1–32), the name field shows and renames the performance, and **Get** reads the performance. The Parts and
  performance effects pages follow. (#10)
- **Parts page** (Perform mode's main view): all 16 parts side by side with on/off, MIDI channel, patch bank and
  number, level and pan. Get reads them, edits on the JV's panel show up live, and Send (and the on-load push) selects
  the set's performance and writes the parts over it, so a performance is stored in the Live set and in presets. The
  bank menus list only the model's banks and the expansion boards set up on the Setup page, and each part shows its
  patch's name: USER names are read from the JV, preset and board names come from `tools/import_patch_names.py`. (#10)

- **Part page** (Perform mode): the part buttons below the program block (1–16) open a part's settings: output
  (MIX / EFX / DIR1 / DIR2 / PATCH, EFX A/B/C), mix/EFX, chorus and reverb send, coarse and fine tune, and whether it
  receives program change, volume and hold. The **Part** button switches between it and the Parts page. On its left
  the part's Parts page controls (on/off, channel, voices, bank, patch, name, level, pan) again, bigger. (#10)

- **Keys page** (Perform mode): the 16 parts' key ranges as bars over the keyboard, with draggable ends, and the
  performance's key range switch. **Voice reserve** per part on the Parts page, under the pan knob, kept to 64 in all,
  with the voices left ("rest") shown in the page column. (#10)

- **Performance FX** (Perform mode, **FX** button): the performance's EFX (type, 12 parameters, output and sends),
  chorus and reverb, which part's patch EFX feeds EFX-A, B and C, and the performance's clock source and tempo. (#10)

- **Parts from Live tracks** (Perform mode): each part shows the Live track(s) that play it (MIDI tracks whose MIDI
  To is the JV's port, on the part's channel), shown below the parts and lit in the track's colour while it plays. Follows renamed and re-routed tracks by
  itself. (#10)

### Changed
- **Library** and **Setup** are now icon buttons (box and gear) in a column at the top left. The page column has the
  per-tone pages at the top (Tone 1–4, LFO, Ctrl) and the patch-wide ones at the bottom (FX, Patch).
- The Tone tabs are a little shorter, to fit the Library button in the button column.
- The "Effects On/Off" label is gone (the buttons say EFX / Chorus / Reverb), making room for the Patch / Perform switch.
- When a set loads, the device also sets the JV's mode (Patch or Perform) to the one saved in the set. Sets saved
  before this version are in Patch mode.

### Fixed
- The program number only went up to 127; it now reaches 128, the last patch of each bank.

## [0.7.0] - 2026-10-31

### Added
- **Ctrl page** per tone (button **Ctrl** below LFO): the controller matrix (3 controllers × 4 destinations and
  depths) and the control switches (volume, hold-1, bender, redamper, pan), plus the patch-wide controller sources,
  Hold/Peak and EFX control. 126 new automatable parameters. Read back by **Get**. With this, every patch parameter
  of the JV-2080 can be edited from the device. (#8)
- **Patch name editing**: click the name in the program block, type and press Return. The name goes to the JV at
  once and is saved with the set; Send never overwrites the JV's name. Name edits on the JV's panel show up live. (#8)

### Changed
- Patch page: the velocity ranges are shown as vertical bars, one per tone (soft at the bottom, hard at the top),
  like Live's velocity lane; the key ranges stay strips over the keyboard. Each tone has its own color. Drag an
  end of a strip or bar to change the range directly.

### Upgrading
- Sets saved with an older version have no controller values yet; the device starts with the JV's defaults (no
  destinations) and **Send on load** sends them. Click **Get** once and save the set to keep a patch's controller setup.

## [0.6.0] - 2026-10-19

### Added
- **Patch page** (button **Patch** above Setup): patch level, pan, octave, bend range, analog feel, stretch tune, key
  assign, legato, voice priority, tempo ("---" with clock source SYSTEM, like the JV), clock source, category,
  portamento; Structure Types 1&2 / 3&4 and booster with the JV's structure diagrams; per-tone key and velocity ranges and cross fade with a zone graphic. 43 new automatable
  parameters. Read back by **Get**. (#8)

### Changed
- **Send is much faster:** the device writes the patch as about 11 SysEx blocks instead of one message per
  parameter (453 with all pages), so it takes well under a second instead of ~4.5 s. The same applies to the push
  when a set loads. Settings the device doesn't edit yet are left out, so the JV keeps them.
- The Tone tabs moved to the top of their column with **LFO** (per tone) below them; the patch-wide pages **FX** and
  **Patch** sit above **Setup** at the bottom.

### Fixed
- A new device opened on Tone 2 instead of Tone 1.
- "typedmess: int: corrupt object" errors in the Max console after a section was rebuilt.
- A Send while a Get was running made the JV miss a request ("no reply from the JV"); they now take turns.
- FX page: the hint under the EFX dials now reads "(n) = raw value"; most EFX values are shown as real values since 0.5.0.

## [0.5.0] - 2026-10-17

### Added
- **LFO page** per tone (button **LFO** below the Tone tabs): LFO 1 and LFO 2 (wave, rate, delay, fade, offset, key
  trigger, sync) and their depths for pitch, filter, amp and pan, with a preview of each LFO's shape. 96 new automatable parameters, named
  `T<n> LFO1 Rate`, `T<n> Pitch LFO1 Depth`, … Read back by **Get**. (#8)

- **FX page** (button **FX** below the Tone tabs): the patch's effects with a routing graphic like the JV's Effects
  page. Per-tone output assign and mix/EFX, chorus and reverb sends; EFX type and its 12 parameters, labelled per
  type with the value shown as the JV does (dB, Hz, %, pan, choices; rates and delay times still raw, #51); EFX output and sends; chorus and reverb. 44 new automatable parameters. Read back by **Get**. The Effects On/Off buttons follow the JV's
  EFX / CHORUS / REVERB buttons. (#8)

### Upgrading
- Sets saved with an older version have no LFO or effect values yet, so the device starts with LFO depths at 0 and default
  effects and, with *Send on load* on, sends that to the JV. To keep a patch's LFOs and effects, click **Get** once and save the set.

## [0.4.0] - 2026-10-17

### Added
- **JV-1080 and XP-50/80 (experimental)**: Setup → *Model*. Picks the right bank list and the right patch size for
  **Get**: no PR-E, the GM bank shown as PR-D, the PCM card on the JV-1080, and expansion slots A–D. Sound
  parameters are identical to the JV-2080. Not yet tested on real hardware. (#9)
- **Wave names** under each tone's Wave dial, for wave groups whose names were imported with
  `tools/import_wave_names.py`: INT-A, INT-B and SR-JV80 boards 01–11. (#30)
- README: how to control cutoff, resonance, attack and release for the whole patch with the JV's CCs (#31), and a
  description of the Setup page.

### Changed
- The Setup page's text is easier to read: light labels and hints on the dark panel.

## [0.3.0] - 2026-10-17

**Full duplex: the device now reads from the JV as well as writing to it.** This needs the track's MIDI From to
include the JV (see *MIDI setup* in the README).

### Added
- **Get**: loads the JV's current patch into the device: every control on all four tones, plus the **patch name**.
  It also happens automatically after a program change from the device or a MIDI clip (Setup → *Get on program
  change*). (#6)
- **Follow the JV's panel** (Setup → *Follow JV patch changes*, on by default):
  - picking a patch on the JV updates bank, program number, controls and name in the device
  - turning a knob on the JV, e.g. Cutoff, moves the matching control live

  Nothing is echoed back to the JV.
- **Expansion board patches**: the bank menu lists **XP-A1 / XP-A2** (patches 1–128 / 129–255) for every slot set up on
  the Setup page, plus **CARD**.
- A diagnostic device, `diagnostics/JV SysEx Monitor.amxd`, to check that SysEx travels between the JV and Live.

### Changed
- **Program block** top left: patch name, bank and program, and **Send** (device → JV) / **Get** (JV → device) buttons
  on a dark panel. The "Tone Switch" label is gone, and the tone switches moved down.
- The unlabeled square next to the program number is gone. It never had an effect on a JV-2080; see *Follow JV patch
  changes* on the Setup page.
- All parameter messages are built by one tested sender instead of 78 `sxformat` objects. The messages on the wire
  are the same, and the "sxformat: inlet: bang: wrong message int" errors in the Max console are gone. (#7)

### Fixed
- Incoming MIDI was passed through **twice**, and incoming SysEx was echoed back to the JV. (#6)
- When a set loaded, Pitch values could land on **patch common** parameters, e.g. Octave Shift. (#7)
- The bank section sent the bank menu's position as a controller value; it now sends a proper bank select (CC 0 / 32)
  before the program change. Three hidden, automatable "Bank MSB / Bank LSB / Program" parameters are removed.
- Filter **vel sens** allowed 126 and 127, outside the JV's range of 0–125. (#7)

## [0.2.0] - 2026-10-16

### Added
- **Send on load**: when a Live set loads, the device pushes all its settings to the JV after 1 s, so the JV matches
  the device without pressing **push to device**. Can be turned off on the Setup page. (#23)
- Expansion board waves: the Wave group menu now offers SR-01 … SR-19 (SR-JV80 board numbers) besides INT-A/INT-B,
  and sends Wave Group Type, which was never sent before. (#4)
- **Expansion boards** on the Setup page: pick the board in each slot (A–H). The Wave group menu then lists only
  INT-A, INT-B and your boards, like the JV shows them ("XP-A Techno"). (#4)
- **Setup** page, opened with the button below the Tone tabs, with **Device ID** (17–32), for JVs whose Device ID isn't the default
  17 or that share a MIDI port, and **SysEx gap** (1–50 ms, default 10) for JVs that still report "MIDI buffer full". (#5)

### Fixed
- Every key played the same pitch: Pitch Keyfollow ("key") started at 0 instead of +100, and push sent that to
  the JV. New devices now start at +100. In existing sets, set "key" in the Pitch section to 100 for each tone.
- **push to device** now re-sends FXM Depth, Tone Delay Mode and Tone Delay Time. (#4)
- Switching tone tabs didn't reliably hide the previously shown tone's sections; the tab now hides all
  sections and then shows the selected one.
- The Amplifier section now works for all four tones; before, it only controlled Tone 1 and followed no tab. (#1)
- Amp envelope times and levels, Pan, Pan Keyfollow, Random Pan Depth and Alternate Pan Depth now send to the
  JV. They were shown but never sent. Envelope levels use the JV's 0–127 range. (#1)
- **push to device** now also re-sends Amp Bias Position, Bias Level and Velocity Time 4. (#1)
- A newly added device made no sound after **push to device**: the Amplifier's Level started at 0. The Amplifier and
  Filter now start from playable values: Level 80, envelope levels open, a short release, and the Filter on LPF and
  fully open, so Cutoff and Resonance work right away. (#1)
- Tone level had two controls, the left-column Tone Level box and the Amplifier's Level knob, that sent the same
  parameter and could disagree. The knob now mirrors the box: turning either one changes both, and only the box
  sends. (#17)
- **push to device** skipped Tone 2's level. (#17)

### Changed
- Effects On/Off: Reverb now also starts **off**, like EFX and Chorus. These are the JV's global effect switches.
- **Requires Live 12 with Max 9 or newer.** The device is now saved with Max 9. Live 11 / Max 8 users can stay on
  0.1.2. (#12)
- New Live parameter names for the Amplifier: `T<n> Amp …` / `T<n> Pan …`. Tone 1's Amplifier parameters that
  already worked keep their old names, so existing automation still works. (#1)
- The Amplifier Level knob is no longer a separate Live parameter. Automate `Tone1 Level` … `Tone4 Level` instead;
  this only affects automation recorded on Tone 1's Amplifier `Tone Level`. (#17)

## [0.1.2] - 2026-10-16

### Fixed
- "MIDI buffer full" on the JV when pressing **push to device**. SysEx is now sent one message every 10 ms, and a
  waiting message is replaced when a newer value for the same parameter arrives. (#14)
- The **push to device** button was outside the visible area of the device. (#14)
- Some parameter changes were ignored by the JV because the SysEx checksum could come out as the invalid value 128.
  This affected the Filter, Wave, Tone Switch/Level and Effects sections. (#3)
- The Tx Program Change toggle changed the patch's Reverb Level instead of the System setting. (#2)

### Changed
- License is now CC BY-NC 4.0.

### Removed
- Debug "test from device" button from the device UI.

## [0.1.1]

First version tracked in this repository, as published on maxforlive.com.

[Unreleased]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.7.0...HEAD
[0.7.0]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.1.2...v0.2.0
[0.1.2]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/tgoelles/jv2080-max-for-live/releases/tag/v0.1.1
