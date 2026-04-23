# Required Tools

Verify each tool is installed before proceeding with setup.

## Git

Usually pre-installed on macOS and Linux.

```bash
git --version
```

If missing on macOS: `xcode-select --install`

## GitHub CLI (gh)

```bash
brew install gh
gh auth login
```

Follow the prompts to authenticate with your GitHub account.

## Claude Code

**macOS / Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**macOS (Homebrew):**
```bash
brew install --cask claude-code
```
> Note: Homebrew does not auto-update. Run `brew upgrade claude-code` periodically.

**Windows (PowerShell):**
```powershell
irm https://claude.ai/install.ps1 | iex
```

Verify installation:
```bash
claude --version
```

You'll be prompted to log in on first use (requires a Claude account). Then run `claude` in any project repo to start a session — it automatically reads `CLAUDE.md` in the repo root.

> Full docs: https://code.claude.com/docs/en/overview

## Obsidian

Download from [obsidian.md](https://obsidian.md) (free desktop app).

Used to browse the shared knowledge vault with wikilinks, graph view, and search. Not strictly required for the framework to work (the vault is plain markdown + git), but highly recommended.

## Optional but Recommended

- **Homebrew** (macOS): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- **Node.js v20+**: `brew install node` or use [fnm](https://github.com/Schniz/fnm) for version management
- **A good terminal**: iTerm2, Warp, or Ghostty -- whichever you prefer
