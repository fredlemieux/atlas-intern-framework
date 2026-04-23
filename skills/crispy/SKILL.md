---
name: crispy
description: Structured problem-solving methodology before writing code. Use for any non-trivial implementation task.
---

## Trigger

`/crispy` -- run full workflow from Q stage
`/crispy task-name` -- run with a named task (optional, for artifact folder naming)
`/crispy task-name --from D` -- resume from a specific stage (Q/R/D/S/P/I/L)
`/crispy task-name --stage Q` -- run a single stage only

## What it does

CRISPY is a 7-stage gated workflow for implementing tasks with AI assistance. Each stage produces a numbered `.md` artifact. The intern (or their manager) reviews and approves each stage before the next begins.

## Audit trail

All artifacts live in `{repo-root}/.crispy/{task-slug}/` (gitignored). Structure:
```
1-Q-questions.md    <- clarifying questions (reviewed before R)
2-R-research.md     <- codebase facts (reviewed before D)
3-D-design.md       <- design concept doc (approved before S)
4-S-structure.md    <- phase outline + checkpoints (approved before P)
5-P-plan.md         <- tactical implementation plan
6-I-notes.md        <- implementation notes + commit log
7-L-retrospective.md <- what went well/poorly + lessons learned
```

## Stage routing

| Stage | Gate | What happens |
|-------|------|--------------|
| Q -- Questions | Reviewed before R runs | Intern lists clarifying questions about the task |
| R -- Research | Reviewed before D | Explore the codebase, answer Q questions with facts |
| D -- Design | Approved before S | Design concept: current state, desired state, decisions |
| S -- Structure | Approved before P | Break into vertical phases with testable checkpoints |
| P -- Plan | Spot-checked before I | Tactical step-by-step implementation plan |
| I -- Implement | Commit per verified phase | Follow the plan, one phase at a time |
| L -- Learn | After completion | Retrospective: what went well, what was hard, what to improve |

## Stage Details

### Q -- Questions

Generate focused questions about the task. These should be about *what exists* in the codebase and *what the task requires*, not about implementation approach.

- 5-8 numbered questions
- Each answerable by reading the codebase or asking the manager
- Cover: existing patterns, data models, conventions, edge cases, acceptance criteria

**Gate:** Present questions. Wait for review and any additions before proceeding.

### R -- Research

Explore the codebase and answer the Q-stage questions.

**Repo context pre-flight (run first):**
- Check for `CLAUDE.md`, `CONTRIBUTING.md`, `ARCHITECTURE.md`, or equivalent convention files
- Read and summarise any relevant rules or patterns
- Prepend a `## Repo Context` section to the research output

**Rules:**
- One `##` section per question
- Code blocks for actual file contents
- Bullet points for facts
- No opinions, no recommendations -- pure facts
- All file paths must be repo-root-relative with `./` prefix

**Gate:** Present summary of findings. Flag gaps or surprises. Wait for review.

### D -- Design Concept

Lock shared understanding before any code is written.

Produce (~200 lines in `3-D-design.md`):
- **Current State** -- what exists today
- **Desired End State** -- numbered list of what will be true after this task
- **Resolved Decisions** -- table of every design choice + resolution (traced to R evidence)
- **Patterns to Follow** -- exact references to existing code patterns from R
- **Open Questions** -- anything unresolved (must be empty before moving to S)
- **What Is NOT in Scope** -- explicit exclusions

**Gate:** Manager/mentor reviews and approves. All open questions resolved first.

### S -- Structure Outline

Phases and checkpoints, not implementation detail.

- Numbered vertical phases (each independently testable)
- Per phase: files to touch, what changes, checkpoint to verify
- No code -- just what and where
- Each phase should be committable as a single atomic commit

**Vertical (correct):** each phase delivers something testable end-to-end.
**Horizontal (wrong):** all DB changes, then all service changes, then all frontend changes.

**Gate:** Reviewed and approved before planning begins.

### P -- Plan

The tactical document for implementation.

- Per phase from S: exact files, exact changes, code snippets where helpful
- All paths `./`-prefixed from repo root
- After every phase checkpoint, include a STOP block:

```
---
## STOP -- Phase N complete

Present checkpoint output and wait for confirmation.
Do NOT begin Phase N+1 until reviewed and approved.

---
```

- Include pre-push checks at the end (format, lint, test, type-check -- whatever the project uses)

**Gate:** Spot-checked before implementation.

### I -- Implement

Execute the plan phase by phase.

- One phase at a time, then stop
- Present changes after each phase, wait for confirmation
- Commit after each verified phase with a descriptive message
- If the codebase doesn't match what the plan describes, stop and flag it

Log to `6-I-notes.md` after each phase:
```
## Phase N -- {title}
- Committed: {hash} {message}
- Checkpoint: {what was verified}
- Notes: {any surprises or deviations}
```

### L -- Learn (Retrospective)

After the task is complete, reflect on the CRISPY run.

Produce `7-L-retrospective.md`:
- **What went well** -- which artifacts were most useful?
- **What was hard** -- where did assumptions miss reality?
- **Lessons learned** -- what would you do differently next time?
- **Knowledge to share** -- anything worth adding to `vault/Shared/`?

**Gate:** Review with manager. Extract reusable lessons into `vault/Shared/`.

## Conventions

**File paths:** Always use `./` prefix from repo root. Bare paths are ambiguous.

**File links in artifacts:** Use markdown links with line numbers as plain text:
- Format: `` [`filename.ts`](../../path/to/filename.ts) -- line 42 ``
- Range: `` [`filename.ts`](../../path/to/filename.ts) -- lines 21-31 ``

**Loop variable names:** Never abbreviate -- `for user in users`, never `for u in users`. Applies to all generated code.

## Workflow

1. Create `.crispy/{task-slug}/` directory
2. Run each stage by following the instructions above
3. **Stop after each stage and present output for review**
4. Only proceed when the reviewer confirms
