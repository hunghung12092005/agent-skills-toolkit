---
name: project-quick-onboard
description: Quickly understand a newly received codebase by mapping the project structure, stack, entry points, run commands, major modules, data flow, risky areas, and likely next steps. Use when the user asks to understand a project quickly, get an overview of an unfamiliar repo, onboard into a codebase, or identify where to start working.
---

# Project Quick Onboard

Use this skill when the user has just received a project and needs a fast, useful technical overview.

Goal: reduce time-to-first-contribution.

Do not wander. Build a concise map of how the project works and where the user should look first.

## Main Workflow

Work in this order:

1. Identify the stack and runtime
2. Find how the project starts
3. Map the folder structure
4. Identify core modules and feature boundaries
5. Trace important flows
6. Surface risks, unknowns, and likely next steps

## Step 1: Identify the Stack Fast

Check these first:

- `package.json`, `pnpm-lock.yaml`, `yarn.lock`, `package-lock.json`
- `requirements.txt`, `pyproject.toml`, `Pipfile`
- `go.mod`, `Cargo.toml`, `pom.xml`, `build.gradle`
- `docker-compose.yml`, `Dockerfile`
- framework config files like `next.config.*`, `vite.config.*`, `nuxt.config.*`, `tsconfig.json`

Answer quickly:

- What language(s) and framework(s) are used?
- Is it frontend, backend, monorepo, full-stack, CLI, or mixed?
- What package manager and tooling are in play?
- Is there one app or several apps/packages?

## Step 2: Find the Real Entry Points

Locate where execution actually begins:

- app boot files
- server startup files
- routing setup
- provider composition
- env/config loading
- build and run scripts

Examples:

- React / Next.js: `app/`, `pages/`, `main.tsx`, `src/main.*`
- Node backend: `server.ts`, `app.ts`, `index.ts`
- Python: `main.py`, `app.py`, framework bootstrap

If scripts exist, determine which command likely matters most:

- local dev
- build
- test
- lint
- migrations / workers / background jobs

## Step 3: Map the Structure

Create a practical tree, not an exhaustive dump.

Focus on:

- app directories
- shared libraries
- API layer
- state management
- UI/component system
- utilities
- config
- tests

Explain what each top-level area is for.

## Step 4: Understand Core Architecture

Infer the architectural style:

- feature-based vs layer-based
- monolith vs modular packages
- server-rendered vs SPA vs hybrid
- REST vs GraphQL vs RPC
- local state vs global store

Call out:

- where business logic lives
- where data fetching happens
- where auth is handled
- where shared UI or shared domain code lives

## Step 5: Trace Important Flows

Pick only the flows that matter most:

- app startup
- request -> controller -> service -> data access
- page -> hook/store -> API -> render
- auth/login/session flow
- background job or queue flow

Summarize each flow in a few lines so the user can follow it later in code.

## Step 6: Surface What Matters

Always include:

- likely hotspots for bugs or complexity
- missing docs or ambiguity
- generated code or vendor-like folders to ignore
- legacy areas vs actively maintained areas
- safest place to start for common changes

If obvious, suggest:

- where to implement a new feature
- where to debug a failing flow
- where to review performance

## Output Format

When reporting, prefer this shape:

1. `Project type:` one-line classification
2. `Stack:` major technologies
3. `How to run:` important commands if discoverable
4. `Codebase map:` top-level modules and responsibilities
5. `Key flows:` startup, data, auth, or main business flow
6. `Watchouts:` risks, messy areas, or unknowns
7. `Best starting points:` concrete files/folders to read first

Keep it high signal. The user should be able to act immediately.

## Good Behavior

- Prefer primary files over guessing from folder names
- Read enough files to verify architecture before summarizing
- Distinguish facts from inference
- If the repo is large, sample strategically instead of reading everything
- Point to exact files when they are likely onboarding anchors

## Do Not

- Do not paste huge directory trees
- Do not summarize every folder equally
- Do not spend most of the time on styling or tiny utilities
- Do not claim understanding of flows you did not trace
- Do not drown the user in low-priority detail

## Fast Heuristic Pass

If you need a very fast first pass:

1. Read root manifests and config
2. Read the main app/server entry files
3. Inspect top-level directories
4. Trace one core user flow
5. Report stack, structure, start points, and risks
