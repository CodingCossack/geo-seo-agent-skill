# Citability worker

Use this worker when the task is answer extraction, passage quality, or
"will AI systems quote this page?"

## Primary tool

- `scripts/citability_scorer.py <url>`

## Method

1. Score the page or sampled sections with the script.
2. Inspect the top and bottom passages manually.
3. Explain why the best passages are quotable and why the weakest ones fail.
4. Provide rewrite guidance using the rubric.

## What good looks like

- direct answer appears early
- passage stands alone without unresolved pronouns
- claims are concrete and attributable
- structure is easy to quote
- fluff is low

Use `rubrics/citability.md` for scoring and `templates/quick-audit.md` or
`templates/report.md` for presentation.
