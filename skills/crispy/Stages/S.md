# Stage S — Structure Outline

Phases and checkpoints, not implementation detail. Think of this as the "table of contents" for the build.

## What to produce in `4-S-structure.md`

- Numbered vertical phases (each independently testable before the next begins)
- Per phase: files to touch, what changes, concrete checkpoint to verify correctness
- "Out of Scope" section confirming D-stage exclusions
- No code — just what and where, not how

## Vertical vs Horizontal

**Vertical (correct):** each phase delivers something testable end-to-end
**Horizontal (wrong):** all DB changes → all service changes → all UI changes

Vertical phases mean partial failures are detectable and partial rollbacks are possible.

## Checkpoints

Each phase checkpoint must be a concrete, runnable verification — not "confirm it works":
- A specific test command to run
- A query to execute and the expected result
- A specific UI interaction and the expected outcome

## Rules

- All paths `./`-prefixed from repo root
- Each phase should be committable as a single atomic commit
- If a phase can't be verified independently, split it further

## Gate

Reviewer reviews. Corrections welcome inline. Proceed to P only when approved.
