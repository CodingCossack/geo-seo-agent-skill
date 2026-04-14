# Packaging and installation

## Canonical package

`geo-seo-toolkit/` is the canonical skill bundle. The root `SKILL.md` is the
only public entry point.

Use the root bootstrap scripts to install or verify global placements:

- `bootstrap/install-global.sh`
- `bootstrap/uninstall-global.sh`
- `bootstrap/verify-global.sh`

## Codex / OpenAI local authoring

Repo-scoped placement:

- `.agents/skills/geo-seo-toolkit/`

User-scoped placement:

- `$HOME/.agents/skills/geo-seo-toolkit/`

## OpenAI hosted skill upload

Zip the single top-level `geo-seo-toolkit/` folder and upload that zip as one
skill bundle.

## Claude

Project-scoped placement:

- `.claude/skills/geo-seo-toolkit/`

User-scoped placement:

- `~/.claude/skills/geo-seo-toolkit/`

Optional Claude-only subagents live under `adapters/claude/agents/`. They should
be copied into `.claude/agents/` or `~/.claude/agents/` only when you want
parallel delegation for large audits.

## Cursor and Gemini CLI

- `adapters/cursor/README.md` documents the locally verified manual Cursor adapter path.
- `adapters/gemini-cli/README.md` documents conservative manual Gemini CLI usage.

Neither adapter changes the canonical bundle layout.

## Separation of concerns

Do not put repo-wide behavioral guidance inside this skill bundle.

- Use repo `AGENTS.md` for Codex / OpenAI project guidance.
- Use `CLAUDE.md` for Claude project guidance.
- Keep the skill bundle focused on reusable GEO workflow logic.
