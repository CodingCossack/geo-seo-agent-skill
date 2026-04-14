# Output contracts

Use these shapes consistently.

## Quick audit

Suggested filename: `GEO-QUICK-AUDIT.md`

Sections:

1. target and scope
2. headline assessment
3. top blockers
4. supporting evidence
5. immediate actions

## Full audit

Suggested filename: `GEO-AUDIT.md`

Sections:

1. executive summary
2. audit scope and sampled pages
3. score summary if applicable
4. findings by domain
5. prioritized remediation plan
6. appendix with raw evidence or script outputs as needed

## Client or stakeholder report

Suggested filename: `GEO-REPORT.md`

Use business language without dropping evidence. Pull from `templates/report.md`.

## JSON for PDF rendering

Suggested filename: `GEO-REPORT.json`

Use `templates/report-data.json` as the shape. Then render with:

```bash
python scripts/generate_pdf_report.py GEO-REPORT.json GEO-REPORT.pdf
```

## llms.txt

Suggested outputs:

- `llms.txt`
- optional `llms-full.txt`

## Schema outputs

Place generated or revised JSON-LD snippets next to the report or under a
`generated/` folder if one exists in the user’s workspace.

## Business-op outputs

Only on explicit request:

- `~/.geo-prospects/prospects.json`
- `~/.geo-prospects/proposals/<domain>-proposal-<date>.md`
- `~/.geo-prospects/reports/<domain>-monthly-<yyyy-mm>.md`
