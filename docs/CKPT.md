# CKPT stamp (handoff)

```
<NODE-ID> CKPT <MASTER>.<LOCAL>
HOME-01 CKPT 5289.007
```

`XXXX.xxx` — master epoch, then millidigit **counter** (`.007` = 7 updates, `.159` = 159). Never a float.

Cross-brain: every box shares `MASTER`. Each box keeps its own `LOCAL`. After MasterQ fold, `MASTER + 1` and every `LOCAL` resets `.000`.

Full Q → MasterQ procedure lives with the pulse skill:
https://github.com/CjPetersonIX/brainframe-qpulse/blob/main/docs/CKPT.md

Handoff and pulse on the same brain must carry the **same** stamp family. Refresh both in one sitting when you can.
