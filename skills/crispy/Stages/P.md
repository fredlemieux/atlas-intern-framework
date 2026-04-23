# Stage P — Plan

The tactical document the implementation agent reads. Built from all prior artifacts.

## What to produce in `5-P-plan.md`

- Branch name at top
- Per phase from S stage: exact files, exact changes, code snippets where helpful
- All paths `./`-prefixed from repo root — no ambiguous relative paths
- **After every phase checkpoint, include a mandatory ⛔ STOP block (see template below)**
- PR title at bottom

## ⛔ STOP block template (REQUIRED after every phase)

Every phase in `5-P-plan.md` must end with this block, verbatim:

```
---
## ⛔ STOP — Phase N complete

Present checkpoint output and wait for explicit confirmation.
Do NOT begin Phase N+1 until reviewer responds with approval.
Proceeding without confirmation violates the CRISPY gate contract.

---
```

This block is read by the implementation agent at execution time. If you are reading this during implementation: **stop here and show the reviewer the Phase N checkpoint results before continuing.**

## File path rules

- Always use `./` prefix for all file paths
- All file references should be markdown links so reviewers can navigate directly:
  - Format: `` [`filename.ts`](../../path/to/filename.ts) — line 42 ``
  - Range: `` [`filename.ts`](../../path/to/filename.ts) — lines 21–31 ``
- Verify line numbers with a search before writing them — never guess

## Pre-push CI gate (REQUIRED)

Include at the end of the plan, before the PR title. Adapt to the project's actual tooling:

- **Python:** `ruff format --check .` · `ruff check .` · `pyright` · `pytest`
- **TypeScript (plain):** `tsc --noEmit` · `eslint .` · `vitest run`
- **TypeScript (nx monorepo):** `pnpm install` · `nx affected -t build check test --base=$(git merge-base origin/main HEAD)`
- **Rust:** `cargo fmt --check` · `cargo clippy` · `cargo test`

```
---
## ⛔ STOP — Run pre-push checks before pushing

Ensure all of the following pass before `git push`:
- Formatter (no files would be reformatted)
- Linter (zero errors)
- Type checker (zero errors)
- Tests (all passing)

If anything fails: fix, commit, re-run. Do NOT push a failing branch.

---
```

## What NOT to include

- No speculation about future requirements
- No alternative approaches — decisions were made in D

## Gate

Reviewer spot-checks the plan. Proceed to I only when approved.
