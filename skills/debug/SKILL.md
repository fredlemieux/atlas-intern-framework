---
name: debug
description: Use when encountering any bug, test failure, unexpected behavior, or when 2+ fix attempts have failed without resolving the issue
---

# Systematic Debugging

## The Iron Law

```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

If you haven't completed Phase 1, you cannot propose fixes. Random fixes waste time and create new bugs.

## When to Use

Use for ANY technical issue: test failures, bugs, unexpected behavior, performance problems, build failures, integration issues.

**Use ESPECIALLY when:**
- Under time pressure (emergencies make guessing tempting)
- "Just one quick fix" seems obvious
- You've already tried multiple fixes
- You don't fully understand the issue

## The Four Phases

Complete each phase before proceeding to the next.

### Phase 1: Root Cause Investigation

**BEFORE attempting ANY fix:**

1. **Read error messages carefully** -- don't skip past them. Read stack traces completely. Note line numbers, file paths, error codes.

2. **Reproduce consistently** -- can you trigger it reliably? What are the exact steps? If not reproducible, gather more data -- don't guess.

3. **Check recent changes** -- git diff, recent commits, new dependencies, config changes, environmental differences.

4. **Gather evidence in multi-component systems** -- before proposing fixes, add diagnostic logging at each component boundary. Log what enters and exits each layer. Run once to see WHERE it breaks.

5. **Trace data flow backward** -- where does the bad value originate? What called this with the bad value? Keep tracing up until you find the source. Fix at source, not symptom.

### Phase 2: Pattern Analysis

1. **Find working examples** -- locate similar working code in the same codebase
2. **Compare against references** -- read reference implementations COMPLETELY, not partially
3. **Identify differences** -- list every difference between working and broken, however small
4. **Understand dependencies** -- what components, settings, config, environment does this need?

### Phase 3: Hypothesis and Testing

1. **Form single hypothesis** -- state clearly: "I think X is the root cause because Y"
2. **Test minimally** -- smallest possible change, one variable at a time
3. **Verify before continuing** -- did it work? If not, form NEW hypothesis. Don't add more fixes on top.
4. **When you don't know** -- say "I don't understand X." Don't pretend.

### Phase 4: Implementation

1. **Create failing test case** -- simplest possible reproduction, automated if possible. MUST have before fixing.
2. **Implement single fix** -- address root cause. ONE change at a time. No "while I'm here" improvements.
3. **Verify fix** -- test passes? No other tests broken? Issue actually resolved?
4. **If fix doesn't work** -- count how many fixes you've tried.

### The 3-Fix Rule (CRITICAL)

**If 3+ fixes have failed: STOP. Question the architecture.**

Signals of an architectural problem:
- Each fix reveals new shared state/coupling/problem in a different place
- Fixes require "massive refactoring" to implement
- Each fix creates new symptoms elsewhere

**This is NOT a failed hypothesis -- this is a wrong architecture.**

Stop fixing. Step back. Ask:
- Is this pattern fundamentally sound?
- Are we sticking with it through sheer inertia?
- Should we refactor architecture vs. continue fixing symptoms?

Discuss with your mentor or manager before attempting more fixes.

## Red Flags -- STOP and Return to Phase 1

If you catch yourself thinking:
- "Quick fix for now, investigate later"
- "Just try changing X and see if it works"
- "Add multiple changes, run tests"
- "Skip the test, I'll manually verify"
- "It's probably X, let me fix that"
- "I don't fully understand but this might work"
- "One more fix attempt" (when already tried 2+)

**ALL of these mean: STOP. Return to Phase 1.**

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Issue is simple, don't need process" | Simple issues have root causes too. Process is fast for simple bugs. |
| "Emergency, no time for process" | Systematic debugging is FASTER than guess-and-check thrashing. |
| "Just try this first, then investigate" | First fix sets the pattern. Do it right from the start. |
| "I'll write test after confirming fix works" | Untested fixes don't stick. Test first proves it. |
| "Multiple fixes at once saves time" | Can't isolate what worked. Causes new bugs. |
| "I see the problem, let me fix it" | Seeing symptoms is not understanding root cause. |
| "One more fix attempt" (after 2+ failures) | 3+ failures = architectural problem. Question pattern, don't fix again. |

## Quick Reference

| Phase | Key Activities | Success Criteria |
|-------|---------------|------------------|
| **1. Root Cause** | Read errors, reproduce, check changes, gather evidence | Understand WHAT and WHY |
| **2. Pattern** | Find working examples, compare | Identify differences |
| **3. Hypothesis** | Form theory, test minimally | Confirmed or new hypothesis |
| **4. Implementation** | Create test, fix, verify | Bug resolved, tests pass |
