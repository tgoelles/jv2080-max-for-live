# JV SysEx Monitor (test device for #6)

A throwaway test device. It finds out whether SysEx from the JV reaches a Max for Live device in Live, and by which route.
It isn't part of the main device.

It listens with both `sysexin` and plain `midiin`, counts complete SysEx messages per route, and prints each one as hex
to the Max console. Two buttons send data requests (RQ1, device ID 17) for Tone 1 and for patch common.

## Test A: does Live deliver SysEx at all?
1. New MIDI track **B**. Set **MIDI From** to the JV's MIDI port, set **Monitor** to **In**, and add `poc/JV SysEx Monitor.amxd`.
2. On the JV: UTILITY → Transmit, send the temporary patch (manual p.129).
3. Check the counters and the Max console. The JV should send several **DT1** messages (`addr 03 00 …`).

## Test B: does the JV answer our requests?
4. Route track B's **MIDI To** to the JV as well, then press **Request Tone 1**.
   - If replies arrive, **one track can send and receive**, despite Ableton's note.
   - If nothing arrives, move a second copy of the monitor to the track that sends to the JV (the main device's track). Use
     that copy to send the request, and watch track B's copy for the reply.

Report for each test: the counter lines, and one console line for each address seen.
