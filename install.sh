#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"

usage() {
  cat <<'EOF'
Install this skill bundle for one or more AI agents.

Usage:
  bash codex-global-skills/install.sh [--agent AGENT] [--target PATH] [--skills LIST]

Options:
  --agent AGENT   One of: codex, claude, cursor, gemini, antigravity, opencode, pi, all
                  Default: codex
  --target PATH   Override the install directory directly
  --skills LIST   Comma-separated skill names to install
  --list-skills   Print all available skills and exit
  -h, --help      Show this help

Examples:
  bash codex-global-skills/install.sh
  bash codex-global-skills/install.sh --agent claude
  bash codex-global-skills/install.sh --agent gemini
  bash codex-global-skills/install.sh --agent all
  bash codex-global-skills/install.sh --agent claude --skills project-quick-onboard,solution-direction
EOF
}

list_available_skills() {
  find "$SOURCE_DIR" -maxdepth 1 -mindepth 1 -type d -printf '%f\n' | sort
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

normalize_skill_list() {
  local raw_list="$1"
  local normalized=()
  local item

  IFS=',' read -r -a items <<< "$raw_list"
  for item in "${items[@]}"; do
    item="${item#"${item%%[![:space:]]*}"}"
    item="${item%"${item##*[![:space:]]}"}"
    [ -n "$item" ] || continue

    if [ ! -d "$SOURCE_DIR/$item" ]; then
      printf 'Unknown skill: %s\n' "$item" >&2
      printf 'Run with --list-skills to see valid names.\n' >&2
      exit 1
    fi

    normalized+=("$item")
  done

  if [ "${#normalized[@]}" -eq 0 ]; then
    printf 'No valid skills were provided.\n' >&2
    exit 1
  fi

  printf '%s\n' "${normalized[@]}" | awk '!seen[$0]++'
}

copy_skills() {
  local target_dir="$1"
  local copied=0

  mkdir -p "$target_dir"

  if [ "${#SELECTED_SKILLS[@]}" -eq 0 ]; then
    mapfile -t SELECTED_SKILLS < <(list_available_skills)
  fi

  for name in "${SELECTED_SKILLS[@]}"; do
    local dir="$SOURCE_DIR/$name"
    [ -d "$dir" ] || continue
    rm -rf "$target_dir/$name"
    cp -R "$dir" "$target_dir/$name"
    copied=$((copied + 1))
  done

  printf 'Installed %d skills into %s\n' "$copied" "$target_dir"
}

agent="codex"
target_override=""
skills_arg=""
declare -a SELECTED_SKILLS=()

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
    --skills)
      skills_arg="${2:-}"
      shift 2
      ;;
    --list-skills)
      list_available_skills
      exit 0
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

if [ -z "$skills_arg" ] && [ -t 0 ]; then
  printf 'Available skills:\n'
  list_available_skills | sed 's/^/- /'
  printf '\nEnter comma-separated skill names.\n'
  printf 'Leave blank to install all: '
  read -r interactive_input
  skills_arg="$interactive_input"
fi

if [ -n "$skills_arg" ]; then
  mapfile -t SELECTED_SKILLS < <(normalize_skill_list "$skills_arg")
fi

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
