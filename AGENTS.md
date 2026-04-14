# Repo Maintenance Notes

This repository is the canonical GEO toolkit bundle.

- Keep exactly one public skill entry point at `SKILL.md`.
- Treat everything under `workers/`, `rubrics/`, `templates/`, `schemas/`, `examples/`, `scripts/`, `extras/`, and `adapters/` as internal support material or platform adapters.
- Keep project-specific operating instructions outside this bundle; use the consuming project's `AGENTS.md` or `CLAUDE.md` instead.
- Use `bootstrap/install-global.sh`, `bootstrap/uninstall-global.sh`, and `bootstrap/verify-global.sh` for local global installs. Do not edit installed copies under `~/.agents/skills/` or `~/.claude/skills/` directly.
- Treat Cursor and Gemini CLI materials as non-canonical adapters only.
