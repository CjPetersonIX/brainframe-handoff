# brainframe-handoff

```
██████╗ ██████╗  █████╗ ██╗███╗   ██╗███████╗██████╗  █████╗ ███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝
██████╔╝██████╔╝███████║██║██╔██╗ ██║█████╗  ██████╔╝███████║██╔████╔██║█████╗
██╔══██╗██╔══██╗██╔══██║██║██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝
██████╔╝██║  ██║██║  ██║██║██║ ╚████║██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
                  S K I L L   ·   H A N D O F F
```

A portable agent skill for **session continuity**. Before a context limit or session end,
it writes a structured `CKPT-N` checkpoint — what changed, where things stand, the single
next action, system state, and files touched — so the next session resumes cold without
re-reading the whole history.

Part of the [BRAINFRAME skills](https://github.com/The9thRealm/brainframe-skills) collection.

## Install (one line)

```bash
curl -fsSL https://raw.githubusercontent.com/The9thRealm/brainframe-handoff/main/install.sh | bash
```

Installs to `~/.claude/skills/handoff/` by default. Override with `SKILLS_DIR=...`.

## Why

Agent sessions die — context fills, terminals close, machines reboot. Writing a handoff
costs seconds; not having one costs an hour of re-deriving "what was I doing and what's
next". The skill standardizes that note so it's always startable cold.

## The checkpoint

```
CKPT-42  ·  agent  ·  2026-05-30 11:10 PT

## SUMMARY      — what changed this session, and why
## PROGRESS     — per-task ✅ done / ⏳ now / ☐ next / ❌ blocked
## NEXT ACTION  — the one concrete thing to do next (paths, commands, lines)
## SYSTEM STATE — anything not in git the next session needs
## FILES CHANGED— path — one-line what/why
```

See [`SKILL.md`](SKILL.md) for the full format and rules.

## Safety

The skill **never writes secret values** into a handoff — credentials are referenced by
name only (`needs DB_URL from vault`). The bundled `.gitignore` also keeps generated
handoff files out of source control.

## Adopting in other CLIs

`SKILL.md` is plain Markdown — install it as a Claude Code skill, or paste its body into
any agent's rules/system prompt. The format is tool-agnostic.

## License

Public reference skill. Adopt freely.
