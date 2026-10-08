![BRAINFRAME](brainframe-banner-magenta.png)

# brainframe-handoff

Portable CKPT skill. Not BrainFrame OS.


## Relation to BrainFrame OS (first glance)

1. **This repo is NOT the fleet OS.** Portable CKPT / handoff skill only.
2. **Fleet live truth** = [BrainframeOS README](https://github.com/CjPetersonIX/BrainframeOS/blob/main/README.md) + [`docs/ops/2026-09-23_t786u_FIRST_GLANCE_CURRENT_STATE.md`](https://github.com/CjPetersonIX/BrainframeOS/blob/main/docs/ops/2026-09-23_t786u_FIRST_GLANCE_CURRENT_STATE.md).
3. **CKPT format:** `<NODE-ID> CKPT <MASTER>.<LOCAL>` · millidigit is a per-brain counter · fleet epoch tip **5291 OPEN** (5292 VOID).
4. **MasterQ / map / rules:** [`comms/Q-PULSE.md`](https://github.com/CjPetersonIX/BrainframeOS/blob/main/comms/Q-PULSE.md) · [`BRAINFRAME_MAP.md`](https://github.com/CjPetersonIX/BrainframeOS/blob/main/BRAINFRAME_MAP.md) · BrainframeOS README rules.

---

Stamp: `<NODE-ID> CKPT <MASTER>.<LOCAL>` — millidigit is a **counter**. One per brain.

```bash
curl -fsSL https://raw.githubusercontent.com/CjPetersonIX/brainframe-handoff/main/install.sh | bash
```

Bundle: [brainframe-skills](https://github.com/CjPetersonIX/brainframe-skills)  
Wrappers: [LITE](https://github.com/CjPetersonIX/Brainframe-litebrain-wrapper) · [FULL](https://github.com/CjPetersonIX/Brainframe-fullbrain-wrapper)  
Pulse: [brainframe-qpulse](https://github.com/CjPetersonIX/brainframe-qpulse)

[`SKILL.md`](SKILL.md)
