# Stage D — Design Concept

Lock shared understanding before any code is written. This is the most important stage — a bad design caught here costs nothing; a bad design caught in I costs everything.

## What to produce (~200 lines in `3-D-design.md`)

- **Current State** — what exists today relevant to this task
- **Desired End State** — numbered list of what will be true after this task is complete
- **Resolved Decisions** — table of every design choice + its resolution (each must trace to R evidence)
- **Patterns to Follow** — exact references to existing code patterns from R stage
- **Open Questions** — anything unresolved (must be empty before moving to S)
- **What Is NOT in Scope** — explicit exclusions

## Rules

- Every decision in Resolved Decisions must trace back to R stage evidence or explicit reviewer input
- All file paths use `./` prefix from repo root
- No implementation detail — that goes in P
- End with: `*Reviewed and agreed by: {reviewer name}, {date}*`

## Gate

Reviewer edits the doc directly. All open questions must be resolved first. Only proceed to S when reviewer confirms approval.
