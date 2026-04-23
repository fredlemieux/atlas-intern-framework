---
name: review
description: Use when reviewing code quality, verifying work, or running two-stage review on implementation tasks
---

# Code Review Pipeline

Two-stage quality gate for code review. Spec compliance first, then code quality. Never reverse the order.

## When to Use

- After completing an implementation task
- When reviewing a pull request
- When verifying that work matches requirements
- Before merging any non-trivial change

## The Two-Stage Review

### Stage 1: Spec Compliance Review

**Question:** Does the code do what was asked?

Check:
- **Missing requirements** -- did anything get skipped?
- **Extra/unneeded work** -- was anything over-engineered?
- **Misunderstandings** -- was the wrong problem solved?
- **Claims vs reality** -- does the code actually implement what the author says it does?

**Critical rule:** Do not trust self-reports. Read the actual code independently.

Only proceed to Stage 2 if Stage 1 passes.

### Stage 2: Code Quality Review

**Question:** Is it well-built?

Check:
- Each file has one clear responsibility
- Tests verify behavior (not just mock behavior)
- Code follows existing codebase patterns
- No pre-existing issues conflated with new changes
- Names are clear and accurate
- Error handling is appropriate
- Edge cases are considered

## Review Checklist

```
Stage 1: Spec Compliance
[ ] All requirements addressed
[ ] No unnecessary additions
[ ] Code matches stated intent
[ ] Tests cover the requirements

Stage 2: Code Quality
[ ] Follows existing patterns
[ ] Clear naming
[ ] Appropriate test coverage
[ ] Error handling present
[ ] No obvious performance issues
[ ] Commit messages are descriptive
```

## Providing Feedback

When providing review feedback:

1. **Be specific** -- point to exact lines, not vague areas
2. **Explain why** -- not just "this is wrong" but why it matters
3. **Suggest alternatives** -- don't just criticize, offer a better approach
4. **Distinguish severity** -- blocking issues vs. nice-to-haves
5. **Acknowledge good work** -- call out things done well

## Quick Reference

```
1. Read the requirements/task description
2. Read the actual code (not just the summary)
3. Stage 1: Does it do what was asked? (spec compliance)
4. Stage 2: Is it well-built? (code quality)
5. Provide specific, actionable feedback
```
