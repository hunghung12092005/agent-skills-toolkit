#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$SCRIPT_DIR/skills"

usage() {
  cat <<'EOF'
Sync installed skills from a local agent directory back into this repo.

Usage:
  bash codex-global-skills/sync-from-local.sh [--agent AGENT] [--source PATH]

Options:
  --agent AGENT   One of: codex, claude, cursor, gemini, antigravity, opencode, pi
                  Default: codex
  --source PATH   Override the source directory directly
  -h, --help      Show this help
EOF
}

resolve_source_dir() {
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

copy_back() {
  local source_dir="$1"
  local copied=0

  if [ ! -d "$source_dir" ]; then
    printf 'Source directory not found: %s\n' "$source_dir" >&2
    exit 1
  fi

  rm -rf "$TARGET_DIR"
  mkdir -p "$TARGET_DIR"

  for dir in "$source_dir"/*; do
    [ -d "$dir" ] || continue
    local name
    name="$(basename "$dir")"
    cp -R "$dir" "$TARGET_DIR/$name"
    copied=$((copied + 1))
  done

  printf 'Synced %d skills from %s into %s\n' "$copied" "$source_dir" "$TARGET_DIR"
}

agent="codex"
source_override=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --agent)
      agent="${2:-}"
      shift 2
      ;;
    --source)
      source_override="${2:-}"
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

if [ -n "$source_override" ]; then
  copy_back "$source_override"
  exit 0
fi

copy_back "$(resolve_source_dir "$agent")"
