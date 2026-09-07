---
name: handoff
description: Write a structured CKPT handoff so the next session resumes cold. Stamp is <NODE-ID> CKPT <MASTER>.<LOCAL>. Invoke before a context limit, at session end, on checkpoint/handoff/wrap up, and before risky interrupts.
---

# Handoff — session continuity

Sessions die. A handoff is the resume point.

## Stamp

```
<NODE-ID> CKPT <MASTER>.<LOCAL>  ·  <seat>  ·  <date> <HH:MM TZ>
```

- `NODE-ID` — this brain. Required. A bare number is incomplete on a network.
- `MASTER` — shared epoch (network) or `1` (standalone).
- `LOCAL` — this brain's millidigit. **Counter.** Zero-pad to 2 digits while small (`.00`, `.07`); it may grow past 99 (`.159`).
- Compare as two integers, never as a float.
- All seats on this brain **add on** to `LOCAL`. No per-agent restart.
- After a network fold, `MASTER` +1 and `LOCAL` resets to `.00` (first write `.01`).

If the project already has a stamp convention that matches this shape, use it. If it only has `CKPT-N`, upgrade the next write to the full stamp.

## Where

Default: `handoff/LATEST_HANDOFF.txt` or `handoff/LATEST.md` at the project root. Prepend or append per project rule; default is **prepend** a new block so the tip is current. Do not rotate the live file to archive unless the project says so.

Commit state to `main`. Do not park the only copy on a PR branch.

## Format

```
<NODE-ID> CKPT <MASTER>.<LOCAL>  ·  <seat>  ·  <date> <HH:MM TZ>

## SUMMARY
<2–5 sentences: what changed and why.>

## PROGRESS
### <TASK-ID> — <Title>
  ✅ <done>
  ⏳ <now>
  ☐ <next>
  ❌ <blocked — on what / whom>

## NEXT ACTION
<One concrete start-cold step. Paths, commands, lines.>

## SYSTEM STATE
<Ports, daemons, branch, RAM if relevant. Credential NAMES only.>

## FILES CHANGED
- <path> — <what/why>
```

## Steps

1. Read the current handoff. Take this brain's high-water `LOCAL` and add 1. Do not invent `.01` because you are a different VP.
2. Draft the sections. NEXT ACTION must be startable with a cold context.
3. List files you actually touched.
4. Write the block. Prepend unless the project appends.
5. If qpulse is installed, refresh the pulse in the same sitting.
6. Tell the user the full stamp and path. One line.

## Don't

- Secrets in the file.
- Transcript / diary.
- Fake ✅.
- Float-sort millidigits.
- Per-agent millidigit restart.
- Handoff only on a feature branch when other brains need it.
