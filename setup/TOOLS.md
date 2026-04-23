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

```bash
npm install -g @anthropic-ai/claude-code
```

Verify installation:

```bash
claude --version
```

You need an Anthropic API key. Set it as an environment variable:

```bash
export ANTHROPIC_API_KEY="your-key-here"
```

Add this to your shell profile (`~/.zshrc` or `~/.bashrc`) so it persists across sessions.

Then run `claude` in any repo to start a session. Claude automatically reads `CLAUDE.md` in the repo root.

## Obsidian

Download from [obsidian.md](https://obsidian.md) (free desktop app).

Used to browse the shared knowledge vault with wikilinks, graph view, and search. Not strictly required for the framework to work (the vault is plain markdown + git), but highly recommended.

## Optional but Recommended

- **Homebrew** (macOS): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- **Node.js v20+**: `brew install node` or use [fnm](https://github.com/Schniz/fnm) for version management
- **A good terminal**: iTerm2, Warp, or Ghostty -- whichever you prefer
