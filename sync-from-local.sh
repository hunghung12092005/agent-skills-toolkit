#!/usr/bin/env bash

set -euo pipefail

SOURCE_DIR="${HOME}/.codex/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$SCRIPT_DIR/skills"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory not found: $SOURCE_DIR" >&2
  exit 1
fi

rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

copied=0
for dir in "$SOURCE_DIR"/*; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  cp -R "$dir" "$TARGET_DIR/$name"
  copied=$((copied + 1))
done

printf 'Synced %d skills from %s into %s\n' "$copied" "$SOURCE_DIR" "$TARGET_DIR"
