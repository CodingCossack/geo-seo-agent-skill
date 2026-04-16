# GEO SEO Agent Skill

GEO SEO agent skill for AI search optimization, answer engine optimization, GEO
audits, AI search visibility, technical SEO, structured data, entity SEO, AI
crawler access, and content citability.

This skill audits and improves how websites surface in ChatGPT, Google AI
Overviews, Perplexity, Gemini, and Bing Copilot. It focuses on crawlability,
renderability, indexability, schema markup, entity signals, citation readiness,
and prioritized remediation.

## What this GEO SEO skill actually does

- audits AI crawler access across `robots.txt`, meta robots, `x-robots-tag`,
  sitemaps, canonicals, redirects, and raw HTML exposure
- checks whether important pages are renderable, indexable, and quotable by AI
  systems
- scores answer-level citability and passage quality for AI answer extraction
- validates or generates `llms.txt`
- reviews schema markup, JSON-LD, entity IDs, and `sameAs` coverage
- evaluates content quality, trust signals, authorship, freshness, and
  information density
- produces remediation plans, executive summaries, markdown audits, JSON report
  data, and PDF exports
- adds platform-specific GEO guidance for ChatGPT, Google AI Overviews,
  Perplexity, Gemini, and Bing Copilot

## Best use cases

- GEO SEO audits for real sites
- AI search optimization and answer engine optimization
- technical SEO checks for AI crawlers and answer engines
- `llms.txt` creation, validation, and prioritization
- schema markup and structured data reviews
- page-level citability analysis
- client-ready GEO reports and implementation plans

## Outputs

- quick audit summary
- full markdown audit
- client-facing report
- report JSON for automation
- PDF report
- concrete fixes instead of generic SEO theory

## Core capability areas

The core value is in the audit and remediation coverage behind the skill:

- `workers/crawlers.md` for AI bot access, `robots.txt`, sitemaps, canonicals,
  and renderability
- `workers/technical.md` for SSR or SSG exposure, indexability, headers,
  mobile-risk checks, and technical SEO foundations
- `workers/citability.md` for quotable passages and answer readiness
- `workers/llmstxt.md` for `llms.txt` validation and generation
- `workers/schema.md` for structured data and entity graph coverage
- `workers/content.md` for trust, expertise, specificity, and content quality
- `workers/platforms.md` for platform-specific GEO nuance
- `workers/reporting.md` for reports, JSON, and PDF outputs

## Fast install

The repo slug stays `geo-seo-toolkit`, so install commands still use that name.

```bash
npx skills add CodingCossack/geo-seo-toolkit -g --agent claude-code codex -y
```

Useful variants:

```bash
# See what the repo contains before installing
npx skills add CodingCossack/geo-seo-toolkit --list

# Install from a full GitHub URL
npx skills add https://github.com/CodingCossack/geo-seo-toolkit

# Install from a local folder
npx skills add /absolute/path/to/geo-seo-toolkit
```

Update later:

```bash
npx skills update geo-seo-toolkit -g
```

## Manual install

### Codex global

```bash
mkdir -p "$HOME/.agents/skills"
ln -s "$(pwd)" "$HOME/.agents/skills/geo-seo-toolkit"
```

### Codex project-scoped

```bash
mkdir -p /path/to/project/.agents/skills
ln -s "$(pwd)" /path/to/project/.agents/skills/geo-seo-toolkit
```

### Claude Code global

```bash
mkdir -p "$HOME/.claude/skills"
ln -s "$(pwd)" "$HOME/.claude/skills/geo-seo-toolkit"
```

### Claude Code project-scoped

```bash
mkdir -p /path/to/project/.claude/skills
ln -s "$(pwd)" /path/to/project/.claude/skills/geo-seo-toolkit
```

### Cursor manual adapter

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

## Bootstrap scripts

The repository includes idempotent install, uninstall, and verification scripts:

```bash
./bootstrap/install-global.sh
./bootstrap/verify-global.sh
./bootstrap/uninstall-global.sh
```

Useful variants:

```bash
./bootstrap/install-global.sh --copy
./bootstrap/install-global.sh --codex-only
./bootstrap/install-global.sh --claude-only --no-claude-agents
```

## Zip packaging

Build a clean zip from the repo root:

```bash
./scripts/build-zip.sh
```

Output:

```text
dist/geo-seo-toolkit-skill.zip
```

Claude custom skill upload expects the skill folder inside the zip, not loose
files at the zip root.

Manual unzip install:

```bash
unzip dist/geo-seo-toolkit-skill.zip -d "$HOME/.claude/skills"
# or
unzip dist/geo-seo-toolkit-skill.zip -d "$HOME/.agents/skills"
```

## Cursor and Gemini CLI

Cursor and Gemini CLI are not the canonical packaging model for this toolkit.

- Cursor has a thin verified manual adapter in `adapters/cursor/README.md`
- Gemini CLI has documentation-only adapter guidance in
  `adapters/gemini-cli/README.md`

## Verify it loaded

### Claude Code

Direct invocation:

```text
/geo-seo-toolkit
```

### Codex

Good direct prompt:

```text
Use the geo-seo-toolkit skill. Start with the smallest worker set that matches the task, tie all claims to observed site evidence, and return concrete GEO fixes rather than generic SEO advice.
```

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
