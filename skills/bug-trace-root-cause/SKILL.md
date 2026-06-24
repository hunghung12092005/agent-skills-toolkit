---
name: bug-trace-root-cause
description: Trace software bugs from symptom to root cause with a disciplined debugging workflow. Use when the user asks to investigate a bug, find the real cause of a failure, explain why an issue happens, narrow down a regression, or avoid shallow patch fixes.
---

# Bug Trace Root Cause

Use this skill when the task is debugging, investigating a failure, or understanding why a bug happens.

Goal: identify the real cause, not just silence the symptom.

## Core Rule

Do not jump straight to a fix.

First establish:

1. What is happening
2. Where it starts
3. Why it happens
4. What change will fix it safely

## Debugging Workflow

Follow this order:

1. Define the symptom precisely
2. Reproduce it or confirm current evidence
3. Bound the problem
4. Trace the execution path
5. Identify the first incorrect state or decision
6. Prove the root cause
7. Apply the smallest correct fix
8. Verify both the fix and nearby regressions

## Step 1: Define the Symptom

Convert vague reports into something testable.

Clarify:

- exact error message
- expected behavior
- actual behavior
- where it appears
- when it started
- whether it is deterministic or intermittent

If the bug report is fuzzy, restate it in precise terms before changing code.

## Step 2: Reproduce or Confirm Evidence

Prefer direct reproduction. If not possible, collect the strongest available evidence:

- failing test
- logs
- stack trace
- screenshots
- network response
- browser console output
- user steps
- recent change history

If you cannot reproduce, say so clearly and continue with evidence-based narrowing.

## Step 3: Bound the Problem

Reduce the search space quickly.

Ask or infer:

- frontend, backend, infra, data, or integration?
- all users or a subset?
- all environments or one environment?
- all inputs or a specific shape?
- new bug or regression?

Look for the nearest working boundary:

- last good commit
- last correct response
- last valid state in code flow
- first component or function where behavior diverges

## Step 4: Trace the Path

Trace the real execution path from input to failure:

- request -> handler -> service -> database
- event -> state update -> render -> side effect
- props -> hook -> API -> component output
- queue -> worker -> external service -> retry path

Do not inspect everything equally. Follow the path most connected to the symptom.

## Step 5: Find the First Wrong Thing

The root cause is usually the first wrong assumption, value, branch, lifecycle step, or contract break.

Look for:

- incorrect input shape
- stale or missing state
- bad null handling
- wrong condition or branch
- race condition
- lifecycle ordering issue
- schema mismatch
- environment/config mismatch
- async timing bug
- mutation of shared state
- invalid cache assumptions

Prefer the earliest bad state over downstream explosions.

## Step 6: Prove the Root Cause

Before fixing, make sure the cause explains the symptom.

A strong root cause should explain:

- why this symptom appears
- why it appears here
- why it affects these cases and not others
- why it started now, if it is a regression

Good proof sources:

- targeted logging
- reading the exact failing branch
- comparing working vs failing paths
- diffing recent code changes
- isolating a minimal reproduction

Do not claim root cause based on hunch alone.

## Step 7: Fix Conservatively

Once the cause is proven:

- fix the cause, not just the visible crash
- prefer the smallest safe correction
- avoid broad rewrites unless the architecture truly demands it
- add guardrails where they prevent recurrence

Examples of good guardrails:

- input validation
- cleanup in effects
- abort/cancel async work
- stricter typing
- tighter conditionals
- regression tests

## Step 8: Verify Broadly Enough

After the fix, verify:

- original bug is gone
- adjacent flows still work
- no new error path was introduced
- tests reflect the real failure mode when practical

If no test exists, suggest the smallest useful regression test.

## Root Cause Heuristics

### Regressions

Check:

- recent commits
- renamed fields
- refactors that changed call order
- dependency upgrades
- config/env changes
- migrations and data shape changes

### Frontend

Check:

- stale closures
- missing effect cleanup
- async state updates after unmount
- race between requests
- derived state drift
- hydration mismatch
- conditional rendering assumptions

### Backend

Check:

- request validation gaps
- schema drift
- serialization/deserialization mismatch
- transaction boundaries
- retries and idempotency
- feature-flag branching

## Output Format

When reporting debugging results, structure them like this:

1. `Symptom:` what fails
2. `Scope:` where and when it happens
3. `Trace:` the relevant execution path
4. `Root cause:` the first wrong thing and why
5. `Fix:` the smallest safe correction
6. `Verification:` how the fix was checked
7. `Residual risk:` anything still uncertain

If the task is a review-style investigation, findings first.

## Do Not

- Do not fix based on guesswork
- Do not confuse the crash site with the root cause
- Do not stop at “null value here” without explaining why it became null
- Do not rewrite wide areas of code before proving the narrow failure
- Do not claim certainty when reproduction is missing

## Fast Path

When time is tight:

1. capture exact symptom
2. find the failing path
3. identify first wrong value/branch
4. confirm with code evidence
5. fix minimally
6. verify the original scenario
