# JV SysEx Monitor (diagnostic)

Use this to check that SysEx actually travels between the JV and Live, for example when the main device doesn't seem to
reach the synth, or before using features that read data back from the JV.

It listens with both `sysexin` and plain `midiin`, counts complete SysEx messages per route, and prints each one as hex
to the Max console. **Request Tone 1** and **Request patch common** ask the JV for data (RQ1, device ID 17).

## Setup
Use a MIDI track with **MIDI From** set to the JV's **hardware** MIDI port, not another Live track, **All Channels**, and
**Monitor In**. To use the request buttons, also set **MIDI To** to the port that goes to the JV. One track can send and
receive.

## Checks
1. **JV → Live:** on the JV, UTILITY → Xfer → F1 (to MIDI), Source PATCH TEMP, F6 Execute. You should see 5 DT1 messages:
   patch common, 85 bytes, plus 4 tones, 140 bytes each.
2. **Live → JV → Live:** press **Request Tone 1**. You should see one DT1 reply, `addr 03-00-10-00`, 140 bytes.

If nothing arrives, check the track's MIDI From and the MIDI cables (JV MIDI OUT → interface IN). Also make sure the
port's **Track** input is on in Live's MIDI preferences.

Tested 2026-10-16 with Live 12, Max 9.1.5, macOS, JV-2080: both routes receive, and both checks pass (see #6).
