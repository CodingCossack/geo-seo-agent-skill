# Cursor adapter

Cursor is not the canonical architecture for this toolkit.

## What was verified locally

- This machine has a real `~/.cursor/skills/` directory populated with skill folders.
- Existing local Cursor skills are exposed as directories containing a root `SKILL.md`.
- Some local Cursor skills also include optional supporting files such as `metadata.json`, `README.md`, `AGENTS.md`, or `rules/`, but not all of them do.

## Recommended use

Keep the canonical bundle at:

- `/Users/dmytro/ai-toolkits/geo-seo-toolkit`

If you want Cursor to see the toolkit as a skill, manually expose the canonical directory as:

- `~/.cursor/skills/geo-seo-toolkit`

Prefer a symlink so there is still one source of truth:

```bash
ln -s /Users/dmytro/ai-toolkits/geo-seo-toolkit ~/.cursor/skills/geo-seo-toolkit
```

That keeps the single public front door at `SKILL.md` and preserves the same internal worker structure across tools.

## Why there is no dedicated installer here

The toolkit already has first-class install automation for Codex and Claude. For Cursor, the local skill folder convention is visible, but this bundle intentionally avoids turning Cursor-specific packaging into the canonical layout. Manual linking to the canonical directory is the thin adapter.
