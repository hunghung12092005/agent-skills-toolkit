---
name: merge-conflict-analysis
description: Analyze code merge conflicts and recommend the safest resolution path. Use when the user has Git conflict markers, overlapping changes between branches, rebase/cherry-pick conflicts, or needs help understanding which side to keep and how to resolve the conflict without breaking behavior.
---

# Merge Conflict Analysis

Use this skill when the task involves Git merge conflicts, rebase conflicts, cherry-pick conflicts, or overlapping code changes that need to be reconciled safely.

Goal: understand both sides of the conflict, preserve intended behavior, and resolve the conflict with the smallest safe change.

## Core Rule

Do not blindly choose `ours` or `theirs`.

First establish:

1. What each side changed
2. Why those changes were made
3. Whether the changes are compatible
4. What final combined version should exist

## Workflow

Follow this order:

1. Locate and classify the conflict
2. Read both sides fully
3. Reconstruct intent
4. Decide the correct merge strategy
5. Produce the resolved code
6. Verify behavior and nearby risk

## Step 1: Locate and Classify the Conflict

Identify:

- merge, rebase, or cherry-pick conflict
- affected file and code region
- whether the conflict is structural, behavioral, or formatting-only

Look for conflict markers:

- `<<<<<<<`
- `=======`
- `>>>>>>>`

Do not edit until the full conflicting block is understood.

## Step 2: Read Both Sides Fully

Treat both sides as potentially important.

For each side, determine:

- what code was added, removed, or moved
- whether it changes logic, naming, data flow, or side effects
- whether it depends on nearby code outside the conflict block

If needed, read surrounding functions, imports, types, tests, and callers.

## Step 3: Reconstruct Intent

Ask:

- what problem was each branch trying to solve
- whether one side is a bug fix and the other is a refactor
- whether both changes should survive together
- whether one side is obsolete because the other already supersedes it

Prefer intent over line-by-line compromise.

## Step 4: Decide the Merge Strategy

Common safe strategies:

- keep one side exactly when the other is outdated or redundant
- combine both sides when they solve different problems
- rewrite the block cleanly when both sides changed the same logic in incompatible ways
- keep the simpler version when the extra change is cosmetic and adds risk

State clearly which strategy is being used and why.

## Step 5: Produce the Resolved Code

When resolving:

- remove all conflict markers
- keep imports, types, and references consistent
- preserve adjacent formatting and style
- avoid hidden regressions from partial merges

Do not leave half-integrated code paths.

## Step 6: Verify Behavior

After resolving, check:

- does the function still compile or type-check logically
- are all referenced variables/imports still valid
- do both intended behaviors survive if they should
- does the final code match the surrounding architecture

If tests exist, prefer verifying the flows touched by the conflict.

## Conflict Heuristics

### Keep Both Sides When

- one side adds validation and the other adds feature logic
- one side renames/refactors while the other adds behavior
- one side updates types/contracts and the other updates implementation

### Prefer One Side When

- one block is only an older version of the other
- one side is dead code after a refactor
- one side duplicates logic already handled elsewhere

### Rewrite Cleanly When

- both sides changed control flow in incompatible ways
- both sides partially solve the same issue
- merging line-by-line would create confusing or broken code

## Output Format

When reporting conflict analysis, prefer:

1. `Conflict:` file and region
2. `Side A:` what this branch changed
3. `Side B:` what the other branch changed
4. `Intent:` what each side was trying to achieve
5. `Resolution:` what should be kept, combined, or rewritten
6. `Why:` why this is the safest merge
7. `Verification:` what should be checked after resolution

## Do Not

- Do not choose a side without understanding intent
- Do not merge both sides mechanically if they conflict semantically
- Do not leave unused imports, duplicated branches, or broken names
- Do not assume the conflict block contains all necessary context
- Do not stop at “this compiles” if behavior may still be wrong
