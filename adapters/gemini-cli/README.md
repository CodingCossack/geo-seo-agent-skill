# Gemini CLI adapter

Gemini CLI is not the canonical architecture for this toolkit.

## What was verified locally

- `gemini` is installed on this machine.
- `gemini --help` exposes CLI commands, MCP management, and extensions management.
- The home directory contains `~/.gemini/GEMINI.md` and `~/.gemini/skills/`.

## What was not verified

- The local CLI help does not document a stable native skill-bundle install contract equivalent to Codex or Claude.
- Because that contract is not documented locally, this toolkit does not install an automated Gemini target or invent a Gemini-specific package shape.

## Recommended use

Use the canonical bundle directly from:

- `/Users/dmytro/ai-toolkits/geo-seo-toolkit`

Practical options:

- Reference `/Users/dmytro/ai-toolkits/geo-seo-toolkit/SKILL.md` and the needed internal worker/reference files in your Gemini workflow.
- Mirror the relevant operating guidance into a project or user `GEMINI.md` only as a thin manual adapter, while keeping the canonical logic in this bundle.

## Why there is no installer here

The goal is one source of truth. Until Gemini CLI exposes a locally verifiable and documented native skill install contract for this machine, the correct adapter is documentation-only manual use against the canonical bundle.
