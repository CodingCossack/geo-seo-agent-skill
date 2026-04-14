# Verified audit and redesign verdict

## What the repo actually is

Not one clean skill. It is a mixed toolkit with:

- one top-level public skill in `geo/SKILL.md`
- fourteen more public skill folders under `skills/`
- five Claude-only subagent prompts under `agents/`
- core scripts under `scripts/`
- JSON-LD templates under `schema/`
- examples and a single SSR test
- agency CRM and proposal tooling mixed into the same public surface

## Blunt verdict

### Actually wrong

- Public surface is massively over-exposed.
- Front-door description is broad enough to over-trigger on almost any SEO or URL task.
- Internal workers were published as separate public skills with overlapping activation scope.
- Business workflows with persistence and side effects were published as auto-matchable public skills.
- Claude-only subagents were treated like canonical architecture instead of optional adapters.
- Installer hard-codes a Claude-specific multi-skill and multi-agent install shape.
- README architecture claims are already inconsistent with the repo contents.

### Merely Claude-specific

- `.claude/skills/` and `.claude/agents/` install paths
- Claude markdown subagent files
- Claude install/uninstall helpers

### Strong content worth preserving

- `fetch_page.py`
- `citability_scorer.py` after softening unsupported precision
- `llmstxt_generator.py`
- `generate_pdf_report.py`
- schema starter files
- the SSR regression test
- business CRM/webapp as explicit extras, not public runtime

## Architecture decision

Use one canonical public skill bundle.

No evidence justified multiple public skills. A single front door is better on:

- activation quality
- portability across Codex/OpenAI and Claude
- maintainability
- architectural clarity

The former leaf skills now exist as internal workers, rubrics, templates, and
scripts.

## Old to new mapping

See `old-to-new-map.csv`.

## Final folder shape

See the bundle tree inside `geo-seo-toolkit/`.

## Remaining tradeoffs

- Optional Claude subagents are still useful for large audits, but they are now adapters only.
- Brand/entity scanning remains heuristic and should not dominate scoring.
- Business workflows stay in the same bundle for portability, but they are manual-only and demoted out of the public runtime path.
