# Stage R — Research

Explore the codebase and answer the Q-stage questions. **Run with no task context** — only the questions from `1-Q-questions.md` and the repo.

## Repo Context Pre-flight (run before answering questions)

Scan for convention files. Do not assume they exist — check and read whichever are present:

- `CLAUDE.md` in repo root — Claude Code rules
- `CONTRIBUTING.md` or `docs/CONTRIBUTING.md` — contribution conventions
- `.cursor/rules` or `.cursorrules` — Cursor AI rules
- `.github/copilot-instructions.md` — Copilot rules
- `CONVENTIONS.md`, `ARCHITECTURE.md`, or `STACK.md` — wherever the project keeps them

**Output:** Prepend a `## Repo Context` section at the top of `2-R-research.md`:
- One or two bullets per file found, with the critical rule or pattern it contains
- Do not dump full file contents — extract only what's relevant to the questions

## Rules

- One `##` section per question (`## Q1`, `## Q2`, etc.)
- Code blocks for actual file contents
- Bullet points for facts
- **No opinions, no recommendations, no "you should"**
- All file paths `./`-prefixed from repo root

## Gate

Present summary of findings. Flag any unexpected gaps or surprises. Wait for review — reviewer may add comments directly to `2-R-research.md`. Do not proceed to D until approved.
