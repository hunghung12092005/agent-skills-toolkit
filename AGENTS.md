# Guidance for AI Agents Working in This Repo

This repository contains portable AI skills intended to work across Codex, Claude, Cursor, Gemini/Antigravity, and similar agents that support skill or rule folders.

## Repo structure

- `skills/` - Each subdirectory is one skill.
- A skill directory should contain a `SKILL.md`.
- The skill directory name should match the `name` field in that skill's frontmatter.
- `skills/llms.txt` is the lightweight discovery index for agents and tooling that prefer a single skill catalog file.

## SKILL.md requirements

- Frontmatter must include:
  - `name`
  - `description`
- Keep the body focused on workflow, decision rules, and guardrails.
- Put larger supporting material in adjacent files only when needed.

## Compatibility conventions

- Prefer lowercase, hyphenated skill names.
- Keep descriptions explicit about when the skill should trigger.
- Avoid agent-specific instructions inside the skill body unless they are broadly compatible.
- When adding a new skill, also update:
  - `README.md`
  - `skills/llms.txt`
  - install instructions if a new agent target is introduced

## Installation targets

The install script supports these common agent directories:

- Codex: `~/.codex/skills`
- Claude Code: `~/.claude/skills`
- Cursor: `~/.cursor/skills`
- Gemini / Antigravity: `~/.gemini/antigravity/skills`
- OpenCode: `~/.config/opencode/skills`
- Pi: `~/.pi/agent/skills`
