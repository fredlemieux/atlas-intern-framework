# Intern Checklist -- Week 1

Your setup tasks and daily habits from day one.

## Day 1 Setup

- [ ] Clone the repo and run `./scripts/install.sh`
- [ ] Install all tools (see `TOOLS.md`)
- [ ] Set up Obsidian -- open `vault/` as a vault
- [ ] Create your personal folder: `cp -r vault/Interns/_TEMPLATE vault/Interns/YourName`
- [ ] Read `Company/Onboarding/WELCOME.md`
- [ ] Read `CLAUDE.md` in the repo root -- this is how Claude behaves when you work
- [ ] Run `gh auth login`
- [ ] Run `claude` in the repo root -- verify it loads and responds

## Day 2-5: First Task

- [ ] Read the CRISPY methodology (`/crispy` in Claude)
- [ ] Start your first task using CRISPY -- Clarify before coding
- [ ] Write a session log every day (`/intern-log`)
- [ ] Push to git every day, even WIP
- [ ] If you discover something useful, add it to `vault/Shared/`

## Daily Habits (Every Day, No Exceptions)

1. **Start of day:** Review yesterday's session log, check what you planned for today
2. **During work:** Use CRISPY for non-trivial tasks, commit frequently with descriptive messages
3. **End of day:** Run `/intern-log`, push to git

## The Social Contract

- You benefit from what previous interns learned in `vault/Shared/`
- You contribute back: patterns, gotchas, debugging techniques, research
- This is not optional -- it's how the team compounds knowledge

## AI Hygiene (Every Time You Use Claude)

- [ ] Read what Claude writes before committing it
- [ ] Verify output -- run the code, check edge cases
- [ ] If you can't explain it, don't commit it
- [ ] Document dead ends in your Scratchpad folder
- [ ] Ask "why" not just "how"

## Questions Policy

Write questions down. Ask Claude first with context. If Claude can't resolve it, escalate to your manager with:
1. What you're trying to do
2. What you've tried
3. What Claude said
4. What specifically you're stuck on
