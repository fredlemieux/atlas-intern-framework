---
name: daybook
description: End-of-session conversational logger. Run at the end of every working session to capture what was done, learned, and planned.
---

# Session Log

## Trigger

`/daybook`

## Purpose

Conversational end-of-session logger. Instead of filling in a form, the intern has a short conversation with Claude, which then writes a structured markdown file to their vault folder.

## How It Works

### Step 1: Ask what they worked on

Start with a natural question:

> "What did you work on today?"

Let the intern describe their work in their own words. Don't interrupt with structure -- let them talk.

### Step 2: Probe with follow-ups

Ask 2-3 follow-up questions based on what they said. Good probes:

- "What did you get stuck on?"
- "What surprised you?"
- "Any dead ends worth capturing? Approaches you tried that didn't work?"
- "How are you feeling about the task -- on track, uncertain, blocked?"
- "Did you learn anything about the codebase you didn't know before?"

The goal is to draw out the things they'd otherwise forget to mention -- the dead ends, the "oh that's how it works" moments, the things that took longer than expected.

### Step 3: Check for shared knowledge

Ask:

> "Did you discover anything that others on the team should know about? Something worth adding to Shared/?"

If yes, remind them to add it (or offer to help write the note).

### Step 4: Write the structured log

Write the log to `./vault/Interns/{name}/Sessions/YYYY-MM-DD.md` with these sections:

```markdown
# Session Log -- YYYY-MM-DD

## What I worked on
[Summary of work done, in the intern's own words, cleaned up for clarity]

## Stuck points
[What they got stuck on, how they resolved it or what's still blocking]

## Surprises and dead ends
[Approaches that didn't work, unexpected discoveries, things that took longer than expected]

## Shared
[Anything added to vault/Shared/, or "Nothing today"]

## Tomorrow
[What they plan to work on next]
```

### Step 5: Remind to push

After writing the log:

> "Don't forget to `git add` and `git push` before you close out. Your manager reads these logs async."

## Notes

- The intern's name should be known from their vault folder. If not, ask: "What's your name? I need it for the vault path."
- If a log already exists for today's date, append to it with a `---` separator and a timestamp.
- Keep the tone conversational and supportive. This is a debrief, not an interrogation.
- This skill can be auto-triggered via Claude Code hooks when a session ends. See `setup/TOOLS.md` for hook configuration.

## Auto-Trigger via Hooks

To automatically prompt for a session log when Claude Code exits, add a hook to your project's `.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "type": "command",
        "command": "echo 'Remember to run /daybook before closing!'"
      }
    ]
  }
}
```

This reminds the intern to log before ending their session.
