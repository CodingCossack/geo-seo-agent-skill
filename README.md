# GEO SEO Toolkit

Portable skill bundle for **GEO / AI-search audits and implementation work**.

This repository is the **skill folder itself**. That is intentional. It means people can use it however they already work:

- install it with `npx skills`
- symlink or copy it into local Codex or Claude Code skill directories
- point Cursor at the same canonical folder
- build a clean zip for upload or handoff
- use the Gemini CLI adapter docs without turning Gemini into the canonical layout

The toolkit is built for real site work, not generic SEO chat:

- crawler access, robots, renderability, and indexability
- answer-level citability and passage readiness
- `llms.txt` validation or generation
- structured data and entity-graph review
- platform-specific GEO notes for ChatGPT, Google AI Overviews, Perplexity, Gemini, and Bing Copilot
- remediation plans, executive summaries, report JSON, and PDF exports

---

## The fast answer

### Do I need to connect this repo to `skills.sh`?

No.

If this repo is on GitHub, people can install it directly with `npx skills add <owner>/<repo>`. `skills.sh` is useful for discovery, but it is not required for installation.

### Does this repo already work with `npx skills`?

Yes.

The Skills CLI accepts GitHub repos, full GitHub URLs, and local paths. This repo keeps a valid `SKILL.md` at the root, so it is installable as a single-skill bundle.

---

## Pick the install path that matches how you work

### 1. I want the easiest install and easiest updates

Use the Skills CLI.

From GitHub:

```bash
npx skills add CodingCossack/geo-seo-toolkit -g --agent claude-code codex -y
```

Useful variants:

```bash
# See what the repo contains before installing
npx skills add CodingCossack/geo-seo-toolkit --list

# Install from a full GitHub URL instead of owner/repo shorthand
npx skills add https://github.com/CodingCossack/geo-seo-toolkit

# Install from a local folder instead of GitHub
npx skills add /absolute/path/to/geo-seo-toolkit
```

Update later:

```bash
npx skills update geo-seo-toolkit -g
```

Why use this path:

- single command
- agent-aware placement
- easy updates later
- works cleanly for Codex and Claude Code

### 2. I want to install it manually into a local project or global skills folder

Use the raw repo folder directly.

#### Codex - global

```bash
mkdir -p "$HOME/.agents/skills"
ln -s "$(pwd)" "$HOME/.agents/skills/geo-seo-toolkit"
```

#### Codex - project-scoped

```bash
mkdir -p /path/to/project/.agents/skills
ln -s "$(pwd)" /path/to/project/.agents/skills/geo-seo-toolkit
```

#### Claude Code - global

```bash
mkdir -p "$HOME/.claude/skills"
ln -s "$(pwd)" "$HOME/.claude/skills/geo-seo-toolkit"
```

#### Claude Code - project-scoped

```bash
mkdir -p /path/to/project/.claude/skills
ln -s "$(pwd)" /path/to/project/.claude/skills/geo-seo-toolkit
```

#### Cursor - manual local adapter

```bash
mkdir -p "$HOME/.cursor/skills"
ln -s "$(pwd)" "$HOME/.cursor/skills/geo-seo-toolkit"
```

If you prefer copies instead of symlinks:

```bash
mkdir -p "$HOME/.agents/skills/geo-seo-toolkit"
rsync -a --delete --exclude '.git' --exclude 'dist' ./ "$HOME/.agents/skills/geo-seo-toolkit/"
```

```bash
mkdir -p "$HOME/.claude/skills/geo-seo-toolkit"
rsync -a --delete --exclude '.git' --exclude 'dist' ./ "$HOME/.claude/skills/geo-seo-toolkit/"
```

### 3. I want the built-in bootstrap scripts

The repository includes idempotent install, uninstall, and verification scripts:

```bash
./bootstrap/install-global.sh
./bootstrap/verify-global.sh
./bootstrap/uninstall-global.sh
```

By default `install-global.sh` installs:

- the Codex global skill
- the Claude global skill
- the optional Claude adapter agents

Useful variants:

```bash
./bootstrap/install-global.sh --copy
./bootstrap/install-global.sh --codex-only
./bootstrap/install-global.sh --claude-only --no-claude-agents
```

### 4. I want a zip I can upload or hand around

Build a clean zip from the repo root:

```bash
./scripts/build-zip.sh
```

Output:

```text
dist/geo-seo-toolkit-skill.zip
```

The zip contains the `geo-seo-toolkit/` folder as its root and excludes repo noise.

#### Claude upload

Claude custom skill upload expects the skill folder inside the zip, not loose files at the zip root.

#### Manual unzip install

```bash
unzip dist/geo-seo-toolkit-skill.zip -d "$HOME/.claude/skills"
# or
unzip dist/geo-seo-toolkit-skill.zip -d "$HOME/.agents/skills"
```

### 5. I want Codex or Claude to install it for me

That is valid too.

Minimal prompt:

```text
Install this GEO SEO Toolkit skill. Keep the folder name geo-seo-toolkit and make sure the final path ends in SKILL.md. For Codex use $HOME/.agents/skills/geo-seo-toolkit. For Claude Code use $HOME/.claude/skills/geo-seo-toolkit.
```

---

## Cursor and Gemini CLI

Cursor and Gemini CLI are not the canonical packaging model for this toolkit.

- Cursor has a thin verified manual adapter documented in `adapters/cursor/README.md`
- Gemini CLI has documentation-only adapter guidance in `adapters/gemini-cli/README.md`

For Gemini CLI specifically, this repo does **not** claim a native skill-bundle install contract. Use the canonical bundle directly and mirror only the minimal instructions you need.

---

## Verify it loaded

### Claude Code

Direct invocation:

```text
/geo-seo-toolkit
```

Claude can also auto-load the skill when the task matches the root description.

### Codex

Codex can load the skill explicitly or implicitly depending on the client. A good direct prompt is:

```text
Use the geo-seo-toolkit skill. Start with the smallest worker set that matches the task, tie all claims to observed site evidence, and return concrete GEO fixes rather than generic SEO advice.
```

---

## What this skill actually helps with

Use it when you are working on:

- site-specific GEO / AI-search audits
- single-page or section-level citability checks
- robots, bot access, renderability, and indexability validation
- `llms.txt` generation or review
- schema and entity-graph review
- client-ready remediation reports, JSON data, or PDF exports
- manual GEO proposal, prospect, or monthly delta workflows tied to a real site

This repo keeps exactly one public `SKILL.md`. Everything else is internal support material:

- `workers/` for internal task routing
- `references/` and `rubrics/` for synthesis and scoring
- `templates/` and `schemas/` for outputs and structured data starters
- `scripts/` for deterministic extraction and report generation
- `extras/` for explicit business workflow extras
- `adapters/` for thin platform-specific bridges

---

## Repository layout

```text
.
├── README.md
├── SKILL.md
├── PACKAGING.md
├── adapters/
├── bootstrap/
├── examples/
├── extras/
├── migration/
├── references/
├── rubrics/
├── schemas/
├── scripts/
├── templates/
├── tests/
└── workers/
```
