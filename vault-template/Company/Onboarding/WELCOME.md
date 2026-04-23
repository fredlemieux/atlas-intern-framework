# Welcome to the Team

Welcome! This vault is where the team's knowledge lives and grows. Here's how it works.

## Vault Structure

```
vault/
├── Interns/
│   ├── YourName/
│   │   ├── Sessions/     # Your daily session logs
│   │   ├── Research/     # Your research notes on topics you explore
│   │   └── Scratchpad/   # Dead ends, experiments, rough notes
│   └── _TEMPLATE/        # Copy this to create your folder
├── Shared/
│   ├── Research/          # Validated findings anyone can reference
│   ├── Patterns/          # Reusable solutions and code patterns
│   └── Decisions/         # Architecture decisions and rationale
└── Company/
    ├── Standards/         # Team coding standards and conventions
    └── Onboarding/        # You are here
```

## Your Personal Folder

Your `Sessions/`, `Research/`, and `Scratchpad/` folders are yours. Use them freely. Other people can see them -- that's intentional. Cross-pollination happens when you can browse what others are working on and learning.

## Session Logs

At the end of every working session, run `/intern-log` in Claude Code. Claude will have a short conversation with you about what you worked on, then write a structured log to your `Sessions/` folder. This takes about 5 minutes and is not optional.

Your manager reads these logs. They're how the team stays aligned without micromanagement.

## CRISPY

Before any non-trivial coding task, use the CRISPY methodology: Clarify, Research, Identify, Structure, Produce, Yield. This means understanding the problem and researching the codebase before writing a single line of code.

Run `/crispy` in Claude Code to start a CRISPY session.

## The Social Contract

The `Shared/` folder is the team's collective brain. The deal is simple:

- You benefit from everything previous interns discovered and documented
- You contribute back what you learn: patterns, gotchas, debugging techniques, useful references

If you find something that would have saved you time had someone else documented it -- document it. That's the whole contract.

## Git Discipline

- Push to git every day, even work in progress
- Write descriptive commit messages (explain WHY, not just WHAT)
- Never commit code you can't explain

## Questions

Write them down. Ask Claude first, with context. If Claude can't resolve it, bring it to your manager with what you've tried and where you're stuck. The writing-down part matters -- it forces you to clarify what you're actually asking.

## First Steps

1. Read the rest of `Company/Standards/` for team-specific conventions
2. Set up your tools (see `setup/TOOLS.md` in the repo root)
3. Create your personal vault folder
4. Start your first task with `/crispy`
5. Write your first session log at end of day
