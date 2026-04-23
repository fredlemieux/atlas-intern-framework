# ATLAS -- AI Team Learning and Accountability System

A framework for managing software engineering interns who use Claude Code (or similar AI coding assistants). ATLAS provides structure, visibility, and knowledge retention so that AI tools amplify capability instead of chaos.

## What ATLAS Is

Four interlocking components:

1. **Shared Knowledge Vault** -- Git-backed Obsidian vault with per-person folders and a shared research layer. Knowledge stays when interns leave.
2. **CRISPY Methodology** -- Structured problem-solving before touching code: Clarify, Research, Identify, Structure, Produce, Yield.
3. **Oversight Layer** -- Git as ground truth. Daily pushes, weekly manager review, PRs as learning moments.
4. **Skill Development** -- AI foundations in week 1, prompting standards, AI hygiene, knowledge contribution as a social contract.

## Live Slides

The framework presentation is served via GitHub Pages:
`https://{org}.github.io/atlas-intern-framework`

Open `index.html` locally to view without deploying.

## Repository Structure

```
.
├── index.html                  # Framework presentation (GitHub Pages)
├── CLAUDE.md                   # Intern-facing Claude Code instructions
├── setup/
│   ├── SETUP.md                # Step-by-step setup guide
│   ├── TOOLS.md                # Required tool checklist
│   ├── MANAGER_CHECKLIST.md    # Week 1 manager checklist
│   └── INTERN_CHECKLIST.md     # Week 1 intern checklist
├── vault-template/             # Obsidian vault template (copy to vault/)
│   ├── Interns/_TEMPLATE/      # Per-intern folder template
│   ├── Shared/                 # Cross-team knowledge
│   └── Company/                # Standards and onboarding
├── skills/                     # Claude Code skills
│   ├── crispy/                 # Structured problem-solving
│   ├── debug/                  # Systematic debugging
│   ├── review/                 # Code review pipeline
│   ├── daybook/                # End-of-session logging
│   └── retrospective/          # Weekly/monthly progress reports
└── scripts/
    └── install.sh              # One-shot setup script
```

## Quick Start

1. Fork or clone this repo
2. Run `./scripts/install.sh`
3. Follow `setup/SETUP.md` for the full walkthrough

See `setup/MANAGER_CHECKLIST.md` and `setup/INTERN_CHECKLIST.md` for week 1 priorities.

## Contributing

ATLAS improves through real-world use. If you've run an intern cohort with it, found gaps, or built extensions — PRs and issues are very welcome.

Ideas worth contributing:
- Additional skill variants (onboarding, code-review, standup)
- Vault template improvements
- Language/tool-specific CRISPY conventions
- Hook configurations for auto-triggering daybook

Fork it, try it, improve it.

## License

MIT
