# Workflow selection and orchestration

Choose the lightest mode that fits the request.

## Mode selection

Use quick triage when the user wants a fast diagnosis or only one page.

Use a focused check when the request is explicitly about one domain area:

- crawler access / robots / rendering
- citability / answer blocks
- schema / JSON-LD / entity graph
- llms.txt
- platform-specific optimization
- content quality / E-E-A-T

Use a full audit when the request spans multiple areas or the user asks for a
complete GEO assessment.

## Discovery sequence for a full audit

1. Normalize the URL and identify canonical host.
2. Fetch the homepage with `scripts/fetch_page.py <url> full` or equivalent.
3. Identify site type from the homepage and navigation: local business, SaaS,
   ecommerce, publisher, service business, documentation-heavy product, or other.
4. Pull a small, representative page set: homepage, one core commercial page,
   one content page if present, and one product or docs page if relevant.
5. Select workers based on the request and observed site structure.

## Default worker mix

For most full audits, start with:

- `workers/crawlers.md`
- `workers/technical.md`
- `workers/schema.md`
- `workers/citability.md` or `workers/content.md` depending on whether the site
  is content-heavy

Then add:

- `workers/llmstxt.md` for domain-level AI guidance checks
- `workers/brand-entity.md` only when the user asks about brand/entity presence
  or when authority is clearly a limiting factor
- `workers/platforms.md` only when the user wants platform nuance

## Synthesis discipline

Do not create duplicate findings across workers. Merge them under one issue with:

- observed evidence
- why it matters for GEO
- severity
- one best fix or a short ordered fix set

Use `references/scoring-model.md` only for full audits or when the user asks for
scoring. Focused checks should usually avoid pseudo-precision.

## Optional Claude-only parallelization

If the toolkit is installed in Claude and the task is large enough to justify
parallel work, optional subagents from `adapters/claude/agents/` can be used.
Those adapters are wrappers around the worker files. They are not canonical.
