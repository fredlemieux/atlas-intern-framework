---
name: crispy
description: Structured problem-solving methodology before writing code. Use for any non-trivial implementation task.
---

## Trigger

`/crispy` — run full workflow from Q stage
`/crispy task-name` — run with a named task (for artifact folder naming)
`/crispy task-name --from D` — resume from a specific stage
`/crispy task-name --stage Q` — run a single stage only

## What it does

CRISPY is a 7-stage gated workflow for implementing tasks with AI assistance. Each stage produces a numbered `.md` artifact. A human reviews and approves each stage before the next begins — this is what separates structured AI work from vibe-coding.

## Stages

| # | Stage | Gate | Artifact |
|---|-------|------|----------|
| Q | Questions | Reviewed before R | `1-Q-questions.md` |
| R | Research | Reviewed before D | `2-R-research.md` |
| D | Design | Approved before S | `3-D-design.md` |
| S | Structure | Approved before P | `4-S-structure.md` |
| P | Plan | Spot-checked before I | `5-P-plan.md` |
| I | Implement | Commit per verified phase | `6-I-notes.md` |
| L | Learn | After completion | `7-L-retrospective.md` |

For each stage, read `Stages/{stage}.md` before executing.

## Audit trail

All artifacts live in `{repo-root}/.crispy/{task-slug}/` (gitignored via `.gitignore`).

## Workflow

1. Create `.crispy/{task-slug}/` directory
2. For each stage: read `Stages/{stage}.md`, execute, produce artifact
3. **Stop after each stage and present output for review**
4. Only proceed when the reviewer confirms

## Conventions

**File paths:** Always `./`-prefixed from repo root. Bare paths are ambiguous.

**File links in artifacts:** Clickable markdown links with line numbers as plain text:
- `` [`filename.ts`](../../path/to/filename.ts) — line 42 ``
- `` [`filename.ts`](../../path/to/filename.ts) — lines 21–31 ``

**Loop variable names:** Never abbreviate — `for user in users`, never `for u in users`.

**Never skip hooks** — no `--no-verify`, no bypassing CI checks.
