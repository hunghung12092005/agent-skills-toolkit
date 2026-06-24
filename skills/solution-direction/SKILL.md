---
name: solution-direction
description: Suggest solution directions for a problem without immediately implementing a fix. Use when the user wants proposed approaches, tradeoffs, next-step options, or a recommended direction first, especially when they say to only suggest, advise, brainstorm, or not code yet.
---

# Solution Direction

Use this skill when the user has a problem and wants guidance on how to approach it, but does not want immediate implementation.

Goal: give clear, practical solution directions so the user can choose a path with confidence.

## Core Rule

Do not jump into code changes unless the user explicitly asks for implementation.

This skill is for:

- proposing approaches
- comparing options
- surfacing tradeoffs
- recommending a next step
- reducing uncertainty before execution

## Workflow

Work in this order:

1. Define the problem clearly
2. Identify constraints and success criteria
3. Propose 2 to 4 realistic solution directions
4. Explain tradeoffs of each direction
5. Recommend one path when possible
6. Suggest the next practical step

## Step 1: Clarify the Problem

Restate the issue in concrete terms:

- what is going wrong
- what outcome is desired
- whether this is a bug, design decision, architecture concern, or process issue

If the user is vague, make the smallest reasonable assumptions and say they are assumptions.

## Step 2: Identify Constraints

Look for constraints such as:

- time pressure
- risk tolerance
- performance needs
- codebase complexity
- backward compatibility
- team familiarity
- whether the user wants a temporary workaround or a durable fix

These constraints should shape the recommendation.

## Step 3: Propose Real Options

Prefer 2 to 4 strong options, not a long brainstorm list.

Each option should be materially different, for example:

- quick workaround
- moderate refactor
- deeper architectural fix
- process or observability improvement

Avoid fake variety where options are basically the same.

## Step 4: Explain Tradeoffs

For each direction, cover:

- why it could work
- main advantages
- main risks or downsides
- when it is the right choice

Keep this practical and decision-oriented.

## Step 5: Recommend a Path

When enough context exists, recommend one option.

The recommendation should explain:

- why it fits the current problem
- why it is better than the alternatives here
- whether it is low-risk, fast, or more durable

If there is not enough context to recommend safely, say what is missing.

## Step 6: Suggest the Next Step

End with a concrete next step such as:

- inspect specific files
- validate one assumption
- add logging
- try a low-risk experiment
- choose between option A and B
- gather one missing constraint

## Output Format

When responding, prefer this shape:

1. `Problem:` short restatement
2. `Goal:` desired outcome
3. `Options:` 2 to 4 solution directions
4. `Recommendation:` best path for now
5. `Next step:` what to do immediately after

If helpful, include a short `Tradeoffs:` section under each option.

## Good Behavior

- Optimize for decision support, not implementation detail
- Be honest about uncertainty
- Distinguish facts from inference
- Prefer practical options over abstract theory
- Keep recommendations proportional to the problem

## Do Not

- Do not start coding unless asked
- Do not present one obvious answer as if there were no tradeoffs
- Do not dump too many options
- Do not recommend large rewrites without clear justification
- Do not pretend certainty when the context is thin
