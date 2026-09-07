---
name: handoff
description: Write a CKPT handoff. Stamp is NODE CKPT MASTER.LOCAL (XXXX.xxx millidigit counter). Invoke before context limit, session end, or wrap up.
---

# Handoff

```
<NODE-ID> CKPT <MASTER>.<LOCAL>  ·  <seat>  ·  <date TZ>
MAC-01 CKPT 5289.007  ·  VP1  ·  2026-09-07 13:56 PDT
```

- `LOCAL` = this brain's update count this epoch. Pad to 3 digits in text. Integer, not a decimal.
- Every seat on this brain +1s the same `LOCAL`. No per-VP restart.
- Network fold (MasterQ) bumps `MASTER` and resets `LOCAL` to `.000`.
- Standalone: `MASTER` may stay `1` until you join a network.

File: `handoff/LATEST_HANDOFF.txt` on `main`. Prepend.

Q → MasterQ fold: see [brainframe-qpulse/docs/CKPT.md](https://github.com/CjPetersonIX/brainframe-qpulse/blob/main/docs/CKPT.md).
