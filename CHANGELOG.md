# Changelog

All notable changes to JV 2080 Control. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and versions follow [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Fixed
- The Amplifier section now works for all four tones; before, it only controlled Tone 1 and followed no tab. (#1)
- Amp envelope times and levels, Pan, Pan Keyfollow, Random Pan Depth and Alternate Pan Depth now send to the
  JV. They were shown but never sent. Envelope levels use the JV's 0–127 range. (#1)
- **push to device** now also re-sends Amp Bias Position, Bias Level and Velocity Time 4. (#1)

### Changed
- New Live parameter names for the Amplifier: `T<n> Amp …` / `T<n> Pan …`. Tone 1's Amplifier parameters that
  already worked keep their old names, so existing automation still works. (#1)

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

[Unreleased]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.1.2...HEAD
[0.1.2]: https://github.com/tgoelles/jv2080-max-for-live/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/tgoelles/jv2080-max-for-live/releases/tag/v0.1.1
