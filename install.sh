#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="${HOME}/.codex/skills"

mkdir -p "$TARGET_DIR"

copied=0
for dir in "$SOURCE_DIR"/*; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  rm -rf "$TARGET_DIR/$name"
  cp -R "$dir" "$TARGET_DIR/$name"
  copied=$((copied + 1))
done

printf 'Installed %d skills into %s\n' "$copied" "$TARGET_DIR"
