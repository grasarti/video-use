#!/bin/bash
# Installs video-use as a Claude Code skill in cloud sessions:
# Python deps via uv, and a symlink of the repo into ~/.claude/skills.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

if command -v uv >/dev/null; then
  uv sync
else
  pip install -e .
fi

mkdir -p "$HOME/.claude/skills"
ln -sfn "$CLAUDE_PROJECT_DIR" "$HOME/.claude/skills/video-use"
