#!/usr/bin/env bash
#
# brainframe-handoff — installer
#
#   curl -fsSL https://raw.githubusercontent.com/The9thRealm/brainframe-handoff/main/install.sh | bash
#
# Installs the Handoff skill into your agent's skills directory. Non-interactive,
# idempotent. Defaults to Claude Code (~/.claude/skills); override with SKILLS_DIR.
#
set -euo pipefail

SKILL="handoff"
REPO_RAW="https://raw.githubusercontent.com/The9thRealm/brainframe-handoff/main"
SKILLS_DIR="${SKILLS_DIR:-$HOME/.claude/skills}"
DEST="$SKILLS_DIR/$SKILL"

c_ok()   { printf '\033[92m  ✓\033[0m %s\n' "$1"; }
c_step() { printf '\033[96m▸ %s\033[0m\n' "$1"; }

c_step "Installing $SKILL → $DEST"
mkdir -p "$DEST"

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SRC_DIR/SKILL.md" ]; then
  cp "$SRC_DIR/SKILL.md" "$DEST/SKILL.md"
  [ -f "$SRC_DIR/VERSION" ] && cp "$SRC_DIR/VERSION" "$DEST/VERSION"
  c_ok "copied from local checkout"
else
  curl -fsSL "$REPO_RAW/SKILL.md" -o "$DEST/SKILL.md"
  curl -fsSL "$REPO_RAW/VERSION" -o "$DEST/VERSION" 2>/dev/null || true
  c_ok "fetched from $REPO_RAW"
fi

printf '\033[92m%s installed.\033[0m  Say "checkpoint" / "handoff" before ending a session.\n' "$SKILL"
