# Stage I — Implement

Execute the plan phase by phase. One phase = one commit.

## ⛔ Hard gate — no exceptions

The plan (`5-P-plan.md`) contains an explicit **⛔ STOP block** after every phase. When you reach one:

1. Present the checkpoint output to the reviewer
2. Wait for explicit confirmation
3. Do NOT start the next phase until they respond

Do not interpret "looks good" on phase N as permission to run phase N+1. Each phase needs its own checkpoint confirmation. The STOP block in the plan is the gate — treat it as a hard instruction boundary, not a suggestion.

## Rules

- Implement one phase at a time, then stop
- After each phase: present the changes clearly, wait for verification
- **Only commit after the reviewer confirms the phase checkpoint passes**
- Read `5-P-plan.md` before starting — do not deviate without flagging it first
- Commit messages must be descriptive and explain *why*, not just *what*

## On discovering unexpected state

If the codebase doesn't match what the P stage describes, **stop and flag it**. Do not improvise — the mismatch may mean assumptions in D/S/P are wrong and need revisiting before proceeding.

## Commit convention

- `feat:` for new functionality
- `fix:` for bug fixes
- `chore:` for config, migrations, infrastructure
- `refactor:` for restructuring without behaviour change
- Never use `--no-verify` to skip hooks

## Log to `6-I-notes.md`

After each committed phase, append:

```
## Phase N — {title}
- Committed: {hash} {message}
- Checkpoint: {what was verified}
- Notes: {any surprises or deviations from plan}
```
