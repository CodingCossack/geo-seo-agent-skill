# Claude adapter

This adapter is optional. The canonical source of truth is the root skill bundle.

## Install the skill

Use the shared bootstrap installer from the canonical bundle root:

```bash
/Users/dmytro/ai-toolkits/geo-seo-toolkit/bootstrap/install-global.sh --claude-only
```

Add `--with-claude-agents` if you also want the optional Claude adapter agents.

If you need a manual install, expose the canonical directory at either:

- `.claude/skills/geo-seo-toolkit/` for project scope
- `~/.claude/skills/geo-seo-toolkit/` for user scope

Prefer a symlink so Claude still points at the canonical source.

## Optional subagents

The files in `agents/` are thin Claude-only wrappers around the canonical worker
files. Install them only if you want parallel delegation for large audits.

Copy them to one of:

- `.claude/agents/`
- `~/.claude/agents/`

Do not treat the subagents as canonical instructions.
