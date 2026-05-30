---
name: handoff
description: Write a structured checkpoint ("handoff") that lets the next session resume cleanly — what changed, where things stand, the next concrete action, system state, and files touched. Invoke before a context limit, at session end, when the user says "checkpoint", "handoff", "save state", or "wrap up", and proactively when a long session is nearing its limit.
---

# Handoff — session continuity checkpoint

Agent sessions are mortal: context windows fill, terminals close, machines reboot. A
**handoff** is the cheap insurance — a structured note written *before* the lights go out
so the next session (you, tomorrow, or a teammate's agent) resumes without re-deriving
everything from scratch.

The cost of writing one is seconds. The cost of not having one is an hour of re-reading
diffs and guessing what "next" was.

## When to write one

- **Proactively**, when a long session is approaching its context limit — don't wait to be
  cut off mid-thought.
- At the **end of a work session**, even a successful one.
- Before any **risky or interrupting** operation (a migration, a long build, a reboot).
- Whenever the user says checkpoint / handoff / save state / wrap up.

## Where it goes

Append to (or overwrite, per project convention) the project's handoff file. Default:
`handoff/LATEST.md` at the project root. Keep a running `CKPT-N` counter; increment each
time. If the project already has a handoff location or format, match it.

## Format

```
CKPT-<N>  ·  <agent/author>  ·  <date> <HH:MM TZ>

## SUMMARY
<2–5 sentences: what this session was about and what changed. The "why", not just "what".>

## PROGRESS
### <TASK-ID> — <Title>
  ✅ <done step>
  ⏳ <current step — where you actually are right now>
  ☐ <next step>
  ❌ <blocked step — and on what>

## NEXT ACTION
<The single most important thing to do next, concrete enough to start cold.
 File paths, commands, line numbers — not "continue the work".>

## SYSTEM STATE
<Anything the next session needs that isn't in git: running services, env assumptions,
 a server left running on a port, a branch checked out, credentials needed (by NAME only).>

## FILES CHANGED
- <path> — <one-line what/why>
```

## Steps

1. Determine the next `CKPT-N` (read the existing handoff file; increment its highest N).
2. Draft each section. Be specific in **NEXT ACTION** — it's the section that saves the most
   time. "Wire `handleTimeout()` in auth/middleware.ts:88, then run `npm test auth`" beats
   "finish auth".
3. List changed files from your own edits this session (or `git status` / `git diff --name-only`).
4. Write the checkpoint to the handoff file.
5. Tell the user the checkpoint ID and where it was written. One line.

## Don't

- **Never put secret values in the handoff.** Reference credentials by name
  (`needs DB_URL from vault`), never by value. Handoff files are easy to commit by accident.
- Don't write a transcript. A handoff is a *resume point*, not a diary — skip blow-by-blow.
- Don't claim a step is done if it isn't. A wrong ✅ sends the next session down a dead end.
- Don't summarize already-finished tasks at length; lead with what's live and what's next.

## Pairing

If a status-dashboard skill (`qpulse`) is installed, treat **handoff + pulse as a pair**:
refresh the pulse whenever you write a handoff, so the live board and the saved state agree.
