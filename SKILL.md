---
name: geo-seo-toolkit
description: >
  Use for a site-specific GEO / AI-search audit or implementation task on a real
  URL or domain. Covers crawler access, renderability and indexability,
  answer-level citability, llms.txt, structured data and entity signals,
  platform-specific AI search issues, and report generation from those findings.
  Do not use for generic SEO chat, generic copywriting, or agency CRM / proposal
  work unless the user explicitly asks for those inside a GEO engagement.
---

# GEO / AI Search Toolkit

This directory is one public front door for the toolkit. Treat everything else in
this package as internal support material, not as separate public skills.

## What this skill owns

- site-specific GEO / AI-search audits
- single-page or section-level citability analysis
- AI crawler access, robots, renderability, and indexability checks
- llms.txt validation or generation
- structured data and entity-graph review
- platform-specific GEO notes for Google AI Overviews, ChatGPT web, Perplexity,
  Gemini, and Bing Copilot
- synthesis into remediation plans, executive summaries, JSON data, or PDF
  reports
- manual business-op flows only when the user explicitly asks for them

## What this skill does not own by default

- generic SEO or marketing advice with no concrete site or artifact
- generic sales CRM work disconnected from a GEO engagement
- unsourced market-size claims, ROI claims, pricing claims, or invented
  benchmarks
- hidden slash-command routing to dozens of public sub-skills

## Activation rules

Use this skill when at least one of these is true:

- the user provides a URL or domain and asks about GEO, AI search visibility,
  AI crawler access, schema, llms.txt, citability, or AI answer readiness
- the user wants a GEO remediation plan or client-ready report derived from
  actual audit findings
- the user explicitly asks for a GEO proposal, prospect update, or monthly delta
  comparison tied to a real site or prior audit

Do not activate this skill for:

- broad SEO discussion with no target site
- pure copywriting with no audit or implementation angle
- routine CRM bookkeeping unless the user explicitly asks for the GEO business
  workflow

## Routing rules

Load the smallest set of worker files that can satisfy the task. Do not load the
entire bundle by default.

- `workers/audit.md` for full or multi-domain audits
- `workers/crawlers.md` for robots, bot access, renderability, and indexability
- `workers/technical.md` for deeper rendering, meta, performance-risk, and
  technical analysis
- `workers/citability.md` for passage-level answer readiness
- `workers/content.md` for E-E-A-T, coverage depth, and content structure
- `workers/schema.md` for structured data and entity graph work
- `workers/llmstxt.md` for llms.txt validation or generation
- `workers/brand-entity.md` for brand/entity presence checks
- `workers/platforms.md` for platform-specific GEO notes
- `workers/reporting.md` for quick audit, full report, JSON, or PDF outputs
- `workers/business-ops.md` only when the user explicitly asks for prospect,
  proposal, or monthly comparison work

Use supporting references only when needed:

- `references/workflow.md` for audit mode selection and orchestration
- `references/scoring-model.md` for composite scoring and synthesis
- `references/output-contracts.md` for output shapes and filenames
- `references/source-hygiene.md` for claim discipline and evidence rules
- `rubrics/*.md` for scoring details
- `templates/*.md` and `templates/*.json` for output generation
- `schemas/*.json` for schema starting points
- `scripts/*.py` for deterministic extraction, scoring, llms.txt generation, and
  PDF rendering

## Operating modes

### 1. Quick triage

Use when the user wants a fast read or a narrow answer.

1. Fetch the target with `scripts/fetch_page.py` or equivalent web retrieval.
2. Run only the relevant worker(s).
3. Output a compact summary with the top blockers, likely impact, and next
   actions.

### 2. Focused check

Use for one bounded area such as schema, llms.txt, bots, or citability.

1. Load the single worker plus its rubric if needed.
2. Avoid composite scoring unless the user explicitly wants it.
3. Return concrete fixes, not generic GEO theory.

### 3. Full audit

Use when the user wants a complete GEO assessment.

1. Start with `workers/audit.md` and `references/workflow.md`.
2. Run discovery on the homepage and any priority pages.
3. Pull in only the worker set justified by the site and request.
4. Synthesize with `references/scoring-model.md`.
5. Produce the output defined in `references/output-contracts.md`.

### 4. Reporting

Use `workers/reporting.md` plus the report templates when the user wants a
client-facing or stakeholder-facing deliverable. Use `scripts/generate_pdf_report.py`
only after the report JSON exists.

### 5. Manual business workflow

Only after explicit user intent, load `workers/business-ops.md`. These flows are
manual and side-effectful by nature. Do not enter them implicitly.

## Execution discipline

- Prefer deterministic scripts when they reduce extraction or formatting errors.
- Keep claims tied to observed site evidence unless external facts are freshly
  verified.
- Treat `scripts/brand_scanner.py` and `scripts/citability_scorer.py` as
  heuristics, not ground truth.
- Do not invent platform metrics, market stats, or ROI multipliers.
- Do not behave like a command index. This skill routes internally.

## Optional platform adapters

- `adapters/claude/` contains optional Claude-only subagents and install scripts.
- These adapters are not the source of truth. The canonical logic stays in this
  bundle.
