#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"

usage() {
  cat <<'EOF'
Install this skill bundle for one or more AI agents.

Usage:
  bash codex-global-skills/install.sh [--agent AGENT] [--target PATH]

Options:
  --agent AGENT   One of: codex, claude, cursor, gemini, antigravity, opencode, pi, all
                  Default: codex
  --target PATH   Override the install directory directly
  -h, --help      Show this help

Examples:
  bash codex-global-skills/install.sh
  bash codex-global-skills/install.sh --agent claude
  bash codex-global-skills/install.sh --agent gemini
  bash codex-global-skills/install.sh --agent all
EOF
}

resolve_target_dir() {
  case "$1" in
    codex) printf '%s/.codex/skills\n' "$HOME" ;;
    claude) printf '%s/.claude/skills\n' "$HOME" ;;
    cursor) printf '%s/.cursor/skills\n' "$HOME" ;;
    gemini|antigravity) printf '%s/.gemini/antigravity/skills\n' "$HOME" ;;
    opencode) printf '%s/.config/opencode/skills\n' "$HOME" ;;
    pi) printf '%s/.pi/agent/skills\n' "$HOME" ;;
    *)
      printf 'Unsupported agent: %s\n' "$1" >&2
      return 1
      ;;
  esac
}

copy_skills() {
  local target_dir="$1"
  local copied=0

  mkdir -p "$target_dir"

  for dir in "$SOURCE_DIR"/*; do
    [ -d "$dir" ] || continue
    local name
    name="$(basename "$dir")"
    rm -rf "$target_dir/$name"
    cp -R "$dir" "$target_dir/$name"
    copied=$((copied + 1))
  done

  printf 'Installed %d skills into %s\n' "$copied" "$target_dir"
}

agent="codex"
target_override=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --agent)
      agent="${2:-}"
      shift 2
      ;;
    --target)
      target_override="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [ -n "$target_override" ]; then
  copy_skills "$target_override"
  exit 0
fi

if [ "$agent" = "all" ]; then
  for current in codex claude cursor gemini opencode pi; do
    copy_skills "$(resolve_target_dir "$current")"
  done
  exit 0
fi

copy_skills "$(resolve_target_dir "$agent")"
