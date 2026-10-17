# Changelog

All notable changes to JV 2080 Control. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and versions follow [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- **Expansion board patches**: the bank menu lists **XP-A1 / XP-A2** (patches 1–128 / 129–255) for every slot set up
  on the Setup page, plus **CARD**. With *Follow JV patch changes*, the bank now follows the JV too.
- **Read-back from the JV**: **get** loads the JV's current patch into the device, with every control on all four tones
  and the patch name. After a program change it happens automatically (Setup → *Get on program change*). Needs the
  track's MIDI From to include the JV, e.g. All Ins. (#6)

### Changed
- **Program block** top left: bank and program, the **patch name** in its own field, and **Send** / **Get** text
  buttons that replace the unlabeled "push" and "get" dots. The "Tone Switch" label is gone; the tone switches
  moved down.
- The unlabeled square next to the program number is now **Setup → Follow JV patch changes**. It switches the JV's
  *Transmit Program Change / Bank Select*: when on, picking a patch on the JV's panel sends a program change, and with
  *Get on program change* the device loads that patch. Default off; earlier sets don't carry their old setting over.
- All parameter messages are now built by one tested library (`jvparam.js` / `jvsysex.js`) instead of 78 separate
  `sxformat` objects. Same messages on the wire; values are clamped to the JV's documented ranges. This also removes
  the "sxformat: inlet: bang: wrong message int" errors in the Max console. (#7)

### Fixed
- The bank section's leftovers are removed: a hidden patcher that built the bank select, three automatable
  "Bank MSB / Bank LSB / Program" dials inside it, debug number boxes, and a `ctlout` that sent the bank menu's index
  as a controller value. One script now sends the correct CC 0 / CC 32 before the program change.
- Incoming MIDI was passed through twice (a second passthrough hidden in the bank section), and incoming SysEx was
  echoed back to the JV. Now everything passes once, and SysEx from the JV is never echoed. (#6)
- When a set loaded, the tone sections could send their restored values before knowing which tone they belong to,
  so they landed on **patch common** parameters (e.g. Octave Shift). Senders now wait for their tone address. (#7)
- Filter **vel sens** could be set to 126 and 127, which the JV doesn't accept (its range is 0–125). Found by checking every
  control's range against the manual's address map. (#7)

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

[Unreleased]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.1.2...v0.2.0
[0.1.2]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/tgoelles/jv2080-max-for-live/releases/tag/v0.1.1
