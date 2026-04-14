# Manual business-ops worker

This worker absorbs the former prospect, proposal, and monthly comparison flows.
It is manual-only. Never enter this workflow implicitly.

## Explicit intents that justify it

- manage a GEO prospect or client record
- generate a GEO proposal from existing audit findings
- compare baseline vs current audit for a monthly or quarterly client update

## Data location

Default persistent path:

`~/.geo-prospects/`

Expected files:

- `prospects.json`
- `proposals/*.md`
- `reports/*.md`
- optional `audits/*.md` or `audits/*.json`

## Supporting resources

- `templates/proposal.md`
- `templates/monthly-delta.md`
- `examples/prospects-demo.json`
- `extras/business/crm_dashboard.py`
- `extras/business/webapp/`

## Guardrails

- do not invent ROI numbers
- do not invent pricing or close-probability math
- keep audit claims tied to observed findings
- if audit evidence is missing, say the proposal assumptions are placeholders
