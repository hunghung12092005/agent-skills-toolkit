---
name: frontend-performance-review
description: Review frontend code for performance and stability issues, especially memory leaks, missing cleanup, unnecessary re-renders, heavy effects, event listener leaks, timer leaks, async race conditions, and DOM/layout thrashing. Use when the user asks to check whether FE code is optimized, safe over time, or causing lag, jank, high memory use, or memory leaks.
---

# Frontend Performance Review

Use this skill when reviewing frontend code for performance, memory safety, and runtime stability.

Primary goal: find real risks first, especially issues that get worse over time.

## What to Prioritize

Review in this order:

1. Memory leaks
2. Repeated work that grows over time
3. Unnecessary re-renders
4. Layout / paint heavy UI updates
5. Large-list rendering and expensive tree updates

If the user asked for a review, findings come first. Keep summaries brief.

## High-Risk Leak Patterns

Look aggressively for these:

- `useEffect` with `addEventListener` but no matching cleanup
- `setInterval`, `setTimeout`, `requestAnimationFrame`, `requestIdleCallback` without cleanup
- WebSocket, EventSource, BroadcastChannel, RxJS subscription, custom emitter subscription without unsubscribe
- Observers without disconnect: `ResizeObserver`, `IntersectionObserver`, `MutationObserver`
- Async work that resolves after unmount and still calls state setters
- Infinite accumulation in refs, caches, Maps, Sets, arrays, or module-level singletons
- Recreating listeners/timers/subscriptions on every render because of unstable dependencies
- Third-party libs initialized repeatedly without destroy/revert/cleanup
- React Strict Mode hazards where effects double-run in dev and expose missing cleanup

## Render and CPU Hotspots

After leak risks, inspect:

- Derived data recomputed on every render when it is expensive
- Parent state updates forcing large subtree re-renders
- Context values recreated every render and invalidating many consumers
- Effects that set state too often or mirror props/state unnecessarily
- Scroll, resize, mousemove, input handlers doing heavy synchronous work
- Large lists without virtualization when item count is high
- Animation code mutating layout-heavy properties repeatedly
- Repeated DOM reads/writes that can cause layout thrashing

## Frontend-Specific Review Heuristics

### React / Next.js

- Check `useEffect`, `useLayoutEffect`, and custom hooks for cleanup completeness
- Flag stale-closure bugs that keep old values alive or resubscribe unnecessarily
- Flag state updates during render or effect loops that trigger cascades
- Prefer `AbortController` or equivalent cancellation for fetches kicked off by effects
- Watch for broad context providers and unstable object/function values
- Watch for client components doing high-frequency state updates for pointer/scroll values

### Vue / Nuxt / Svelte

- Check lifecycle cleanup on unmount / destroy
- Check watchers and subscriptions for teardown
- Check stores or reactive subscriptions that remain active after component disposal

### Vanilla JS

- Check global listeners, singleton registries, timers, observers, and detached DOM node retention
- Check components/widgets for explicit `destroy()` lifecycle and whether callers use it

## Output Format

When reporting findings:

- List issues ordered by severity
- Include file and line reference when possible
- Explain the concrete failure mode, not just the rule
- State whether the problem is a memory leak, render regression, CPU hotspot, or stability risk
- Suggest the smallest safe fix

Use language like:

- `Memory leak:` listener/timer/subscription survives unmount
- `Render churn:` state or props cause avoidable subtree work
- `Layout thrash:` code mixes layout reads and writes in hot paths
- `Stability risk:` async or lifecycle bug may update dead UI or duplicate work

## What Good Looks Like

Prefer patterns like:

- Effects return cleanup functions
- Subscriptions are created once per real dependency change
- Async requests are cancelable or ignored safely after unmount
- High-frequency values use refs, motion values, throttling, or requestAnimationFrame where appropriate
- Large collections use pagination, windowing, or virtualization
- Animations prefer transforms and opacity over layout properties

## Do Not

- Do not nitpick micro-optimizations before checking leak risks
- Do not recommend memoization everywhere by default
- Do not call something a memory leak unless you can explain what remains retained and why
- Do not treat every re-render as a bug; focus on avoidable expensive ones

## Quick Review Pass

If time is limited, inspect these first:

1. All effect hooks and custom hooks
2. Event listeners, timers, observers, subscriptions
3. Async fetch / mutation flows
4. Large list rendering paths
5. Scroll / resize / pointer handlers
