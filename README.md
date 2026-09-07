# brainframe-handoff

Portable skill: write a structured **CKPT** so the next session resumes cold.

Companion to [brainframe-qpulse](https://github.com/CjPetersonIX/brainframe-qpulse).  
Part of the public BrainFrame **wrapper** skill set — not the full OS.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/CjPetersonIX/brainframe-handoff/main/install.sh | bash
```

Default: `~/.claude/skills/handoff/`. Override with `SKILLS_DIR=...`.

## CKPT stamp (2026.09)

Do not use a bare `CKPT-42` as the only identifier once more than one brain exists.

```
<NODE-ID> CKPT <MASTER>.<LOCAL>
```

| Piece | Meaning |
|---|---|
| `NODE-ID` | This machine / brain (`MAC-BRAIN-01`, `HOME-01`, …) |
| `MASTER` | Shared epoch on a network; `1` if this box is alone |
| `LOCAL` | Millidigit — **how many updates this brain stacked since last fold** |

Rules:

- The millidigit is a **counter**, not a decimal. `.07` = 7, `.159` = 159. Compare as `(int(master), int(local))`. Never parse the stamp as a float (`.20` vs `.159` reverses if you do).
- Every agent **on this brain** increments the **same** millidigit. VP3 does not start a private `.01`.
- A network fold (`/masterq` or your hub) bumps `MASTER` and resets each brain to `.00`.
- Between folds, keep counting. Disconnected brains come back carrying their millidigit — that is the receipt.
- Write handoffs to the project's agreed file on **`main`**. A checkpoint that only exists on a feature branch is invisible to other brains.

Standalone example:

```
HOME-01 CKPT 1.12  ·  VP1  ·  2026-09-07 13:05 PDT
```

Network example:

```
MAC-BRAIN-02 CKPT 5289.07  ·  VP3  ·  2026-09-07 13:05 PDT
```

Full format and bans: [`SKILL.md`](SKILL.md).

## Safety

Never write secret values. Name the credential (`needs TOOL_API_SECRET from vault`).

Public reference skill. Adopt freely.
