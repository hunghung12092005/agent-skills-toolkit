---
name: repo-purpose-risk-review
description: Evaluate a repository by explaining what it is for, what it does well, and what risks or weaknesses it has. Use when the user wants a repo assessment, project value review, architecture strengths, maintenance concerns, or practical pros and cons before adopting, using, or extending a codebase.
---

# Repo Purpose Risk Review

Use this skill when the user wants an evaluation of a repository, not just a structural walkthrough.

Goal: explain the repo's purpose, strengths, and risks in a decision-useful way.

## Core Rule

Do not stop at listing files or technologies.

Always answer three things:

1. What this repo is for
2. What it appears to do well
3. What risks, weaknesses, or adoption concerns exist

## Workflow

Follow this order:

1. Identify the repo's purpose
2. Verify how it works at a high level
3. Assess practical strengths
4. Assess practical risks
5. Judge likely fit and maintenance cost
6. Summarize clearly

## Step 1: Identify the Purpose

Determine:

- what problem the repo solves
- who it is likely built for
- whether it is a product, tool, template, library, starter, or internal app
- what the primary use case seems to be

Use README, manifests, entry points, configs, and core modules to infer this.

If the purpose is ambiguous, say so and give the best-supported interpretation.

## Step 2: Verify the High-Level Shape

Check enough code to understand:

- main stack
- runtime or deployment style
- major modules or boundaries
- whether the codebase feels experimental, production-oriented, or educational

This is not a full onboard. Read enough to support evaluation.

## Step 3: Assess Strengths

Look for practical advantages such as:

- clear scope
- good folder structure
- coherent architecture
- useful automation or tooling
- high signal documentation
- strong type safety
- good separation of concerns
- reusable abstractions
- evidence of active maintenance

Strengths should be concrete, not generic praise.

## Step 4: Assess Risks

Look for decision-relevant risks such as:

- unclear ownership or stale maintenance
- weak docs
- hidden complexity
- fragile setup
- missing tests
- over-coupled modules
- dead code or abandoned patterns
- unclear deployment assumptions
- dependency risk
- hard-to-extend architecture

Prefer real risks over hypothetical fear.

## Step 5: Judge Fit

Explain whether the repo seems good for:

- adoption as-is
- learning/reference use
- extension for production work
- reuse of only selected parts

If the repo is strong in one context but risky in another, say that directly.

## Step 6: Summarize

End with a practical judgment:

- promising and clean
- useful but narrow
- good idea with rough implementation
- risky to adopt without cleanup
- better as inspiration than foundation

## Output Format

When reporting, prefer:

1. `Purpose:` what the repo is for
2. `How it works:` short technical framing
3. `Strengths:` concrete advantages
4. `Risks:` concrete weaknesses or concerns
5. `Best use:` when this repo is a good fit
6. `Recommendation:` adopt, study, extend cautiously, or avoid

## Good Behavior

- Distinguish facts from inference
- Evaluate usefulness, not just code style
- Keep praise specific
- Keep risks decision-oriented
- Mention uncertainty when the repo is thin or incomplete

## Do Not

- Do not turn this into a file-by-file walkthrough
- Do not confuse interesting ideas with production readiness
- Do not praise a repo just because it uses trendy tools
- Do not invent risks that are unsupported by the codebase
