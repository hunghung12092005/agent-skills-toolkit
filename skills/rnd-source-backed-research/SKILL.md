---
name: rnd-source-backed-research
description: Perform R&D-style research with source-backed findings. Use when the user wants investigation, landscape analysis, comparison, validation, or recommendations that should include citations when available, especially from GitHub, arXiv, and Google Scholar.
---

# RnD Source Backed Research

Use this skill when the task is research, validation, ecosystem scanning, technical comparison, or evidence-based recommendation.

Goal: produce practical R&D findings with explicit sources instead of unsupported claims.

## Core Rule

When useful sources exist, include them.

Prefer this source order:

1. GitHub repositories, docs, issues, or code
2. arXiv papers
3. Google Scholar discoverability for academic work
4. Other primary or official sources

If no reliable source is available, say that clearly instead of implying certainty.

## Workflow

Follow this order:

1. Define the exact research question
2. Identify what must be verified
3. Collect the strongest available sources
4. Separate facts from inference
5. Compare options or findings
6. Summarize conclusions with citations

## Step 1: Define the Research Question

Restate the request in concrete terms:

- what is being investigated
- what decision the research should support
- whether the user wants market scan, technical comparison, repo validation, or literature-style review

If the request is broad, narrow it into a clear evaluation target.

## Step 2: Identify What Must Be Verified

Look for claims that should not be asserted without evidence:

- whether something exists
- whether a repo or project is active
- whether a method is novel
- whether benchmarks are real
- whether a technique is supported by papers
- whether a project has community traction

Treat these as evidence checkpoints.

## Step 3: Collect Strong Sources

Prefer primary sources over summaries.

### GitHub

Use GitHub when researching:

- open-source repos
- implementation details
- adoption signals
- release activity
- examples, issues, or discussions

Check for:

- repo README and docs
- source code
- stars, forks, recency, and commit activity
- issue discussions when they clarify behavior

### arXiv

Use arXiv when:

- the topic is research-heavy
- the user asks about methods, models, or novel techniques
- academic grounding matters

Prefer citing the paper title, year, and the specific claim it supports.

### Google Scholar

Use Google Scholar when:

- you need evidence that a paper or idea has academic presence
- citation context matters
- you want to confirm the research trail beyond a single paper

Do not overstate authority from citation count alone.

## Step 4: Separate Facts from Inference

Clearly distinguish:

- direct facts supported by a source
- interpretations derived from multiple sources
- open uncertainty where the evidence is incomplete

Avoid blending observation and conclusion into one unsupported statement.

## Step 5: Compare Findings

When comparing repos, tools, or methods, evaluate practical dimensions such as:

- what problem each one solves
- maturity
- implementation quality
- evidence quality
- maintenance health
- likely adoption cost
- major risks or gaps

Keep comparisons decision-oriented.

## Step 6: Summarize with Citations

End with a concise conclusion that answers the user’s actual question.

When sources exist, include them directly in the final output.

Good citation behavior:

- cite the repo or paper exactly where it supports the claim
- use more than one source when a conclusion depends on multiple signals
- keep citations relevant, not decorative

## Output Format

When reporting R&D results, prefer:

1. `Question:` what was investigated
2. `Findings:` key facts with citations
3. `Comparison:` differences, strengths, or tradeoffs when relevant
4. `Conclusion:` the best current answer
5. `Sources:` GitHub, arXiv, Google Scholar, or other primary links used

## Good Behavior

- Optimize for evidence quality, not volume
- Prefer primary sources
- Be explicit when a conclusion is an inference
- Use recent repo/project evidence when recency matters
- Quote only what is necessary and summarize the rest

## Do Not

- Do not make market or research claims without evidence
- Do not cite low-signal sources when stronger ones exist
- Do not treat GitHub stars alone as proof of quality
- Do not treat one paper as full consensus
- Do not hide uncertainty when the evidence is mixed
