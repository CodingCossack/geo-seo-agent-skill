# Reporting worker

Use this worker to turn observed findings into a deliverable.

## Output modes

- quick markdown summary
- full markdown audit
- client-facing report
- JSON data for PDF rendering
- PDF via script

## Sequence

1. Normalize findings into one non-duplicative list.
2. Apply `rubrics/prioritization.md`.
3. Draft markdown with `templates/report.md` or `templates/quick-audit.md`.
4. If a PDF is requested, serialize the report data with
   `templates/report-data.json` and render using
   `scripts/generate_pdf_report.py`.

## Style rules

- keep evidence concrete
- translate technical findings into impact where the audience is non-technical
- avoid marketing fluff
- do not insert unverified market statistics
