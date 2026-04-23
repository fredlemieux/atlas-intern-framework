# ATLAS Setup Guide

Step-by-step instructions for setting up the full ATLAS framework.

## 1. Fork or Clone This Repo

```bash
git clone https://github.com/{org}/atlas-intern-framework.git
cd atlas-intern-framework
```

## 2. Install Required Tools

Follow the checklist in [TOOLS.md](./TOOLS.md). Verify each tool works before continuing.

## 3. Run the Setup Script

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

This copies skills to `~/.claude/skills/` and creates a local `vault/` from the template.

## 4. Set Up the Vault in Obsidian

1. Open Obsidian
2. Click "Open folder as vault"
3. Select the `vault/` folder inside this repo

You should see the folder structure with `Interns/`, `Shared/`, and `Company/`.

## 5. Create Your Intern Folder

```bash
cp -r vault/Interns/_TEMPLATE vault/Interns/YourName
```

Replace `YourName` with your actual name (e.g., `vault/Interns/Francisco`).

## 6. Set Your Name in CLAUDE.md

Open `CLAUDE.md` in the repo root. The vault path section references `{YOUR_NAME}` -- Claude will use this to know where to write your session logs. When you run `/daybook`, Claude will ask for your name if it hasn't been set.

## 7. Authenticate with GitHub

```bash
gh auth login
```

This enables the PR workflow. Follow the prompts to authenticate.

## 8. Start Claude Code

```bash
claude
```

Run this from the repo root. Claude automatically loads `CLAUDE.md` and all installed skills.

Try these commands:
- `/crispy` -- start a structured problem-solving session
- `/daybook` -- log your session (do this at the end of every day)
- `/debug` -- systematic debugging when you hit a bug

## 9. Manager Setup (Additional Steps)

If you're the manager setting up ATLAS for your team:

1. **Create the vault repo.** The `vault/` folder should be its own Git repo (or a submodule) so all interns push to the same shared vault.
2. **Add interns as collaborators** on both the vault repo and the project repos.
3. **Schedule weekly review.** 30 minutes per week per intern. Review their git activity, walk through a CRISPY artifact, promote good research to `Shared/`.
4. **Stock `Company/Onboarding/`** with your team's standards, conventions, and any domain-specific context.
5. **Set commit and PR conventions** in your project's `CLAUDE.md` or `CONTRIBUTING.md`.

## What Happens Next

- **Day 1:** Read `Company/Onboarding/WELCOME.md`, install tools, get familiar with CRISPY
- **Day 2-5:** Start first task using `/crispy`, write session logs daily, push to git daily
- **Week 1 end:** First weekly review with manager
- **Ongoing:** Contribute to `Shared/`, refine your CRISPY process, build the knowledge base
