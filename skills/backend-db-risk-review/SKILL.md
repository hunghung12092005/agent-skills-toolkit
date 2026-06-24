---
name: backend-db-risk-review
description: Review backend code for database-related risks such as data corruption, unsafe transactions, race conditions, query inefficiency, migration hazards, locking issues, and broken integrity assumptions. Use when the user wants to assess BE safety around reads, writes, updates, deletes, retries, or concurrent access to a database.
---

# Backend DB Risk Review

Use this skill when reviewing backend code that reads from or writes to a database and the user wants to know what could go wrong.

Goal: identify real backend risks around correctness, integrity, concurrency, and operational safety when code interacts with the database.

## Core Rule

Do not stop at query syntax or ORM style.

Always evaluate:

1. Data correctness
2. Transaction and concurrency safety
3. Operational risk under real production behavior

## Review Workflow

Follow this order:

1. Identify the DB interaction path
2. Classify the operation type
3. Check correctness and integrity assumptions
4. Check transaction and concurrency safety
5. Check performance and scaling risks
6. Check migration and rollback risks
7. Report findings by severity

## Step 1: Identify the DB Path

Trace the path from:

- request or job input
- service/business logic
- ORM or query builder call
- transaction handling
- commit side effects

Understand which tables, entities, or records are touched and whether the path is read-only or mutating.

## Step 2: Classify the Operation

Determine whether the code is doing:

- read
- insert
- update
- delete
- upsert
- batch write
- migration
- retry or compensation logic

The risk profile changes sharply depending on the operation.

## Step 3: Check Correctness and Integrity

Look for:

- missing validation before write
- partial updates that violate invariants
- assumptions that a row exists when it may not
- unsafe null handling
- stale reads driving bad writes
- missing uniqueness checks
- broken referential assumptions
- soft-delete logic that can be bypassed
- idempotency gaps for repeated requests

Prefer risks that can corrupt or silently skew data.

## Step 4: Check Transactions and Concurrency

Look aggressively for:

- writes that should be atomic but are split across multiple queries
- missing transaction boundaries
- transaction scopes that are too broad or too narrow
- race conditions between read-then-write sequences
- double-create or double-charge patterns
- retries without idempotency protection
- lock ordering problems
- inconsistent isolation assumptions
- background jobs and API handlers mutating the same records unsafely

If concurrent behavior can create duplicate, missing, or inconsistent data, that is high severity.

## Step 5: Check Query and Scaling Risks

Inspect for:

- N+1 query patterns
- missing indexes for hot lookups
- full table scans in request paths
- unbounded result sets
- large in-memory post-processing after broad queries
- chatty write loops instead of batch operations
- pagination assumptions that break at scale

Not every slow query is a bug, but hot-path inefficiency is still a production risk.

## Step 6: Check Migration and Rollback Safety

When migrations or schema changes are involved, look for:

- destructive schema changes without safe rollout
- backfill assumptions that may fail on partial data
- app code deployed before schema compatibility exists
- schema changes that break older workers or background jobs
- missing rollback plan
- default values or nullability changes that can lock large tables or fail mid-deploy

Migration risk is often operational, not just code-level.

## Severity Heuristics

### High Severity

- risk of data corruption
- non-atomic multi-step write
- duplicate financial or inventory effects
- race condition on critical records
- migration that can break production deploys

### Medium Severity

- stale read leading to occasional wrong updates
- weak idempotency
- missing guardrails around retries
- hot query performance risk under load

### Low Severity

- style-level query awkwardness
- small inefficiency off hot path
- minor cleanup around ORM usage with low correctness risk

## Output Format

When reporting findings, prefer:

1. `Operation:` what DB path is being reviewed
2. `Risk:` what can go wrong
3. `Why:` exact failure mode
4. `Impact:` corruption, inconsistency, duplication, latency, deploy risk, or maintainability
5. `Recommendation:` smallest safe mitigation

If the task is review-style, findings come first and should be ordered by severity.

## Good Behavior

- Focus on integrity before performance
- Explain the concrete failure mode
- Distinguish theoretical concern from realistic production risk
- Mention when a transaction, unique constraint, or idempotency key would materially reduce risk
- Think about retries, concurrent requests, workers, and deploy ordering

## Do Not

- Do not reduce DB review to “query looks fine”
- Do not ignore concurrency just because tests pass
- Do not assume ORM abstractions guarantee safety
- Do not treat migration risk as separate from backend risk
