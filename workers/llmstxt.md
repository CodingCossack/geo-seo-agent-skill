# llms.txt worker

Use this worker for domain-level AI guidance files.

## Primary tool

- `scripts/llmstxt_generator.py <url> validate`
- `scripts/llmstxt_generator.py <url> generate`

## Checks

- whether `/llms.txt` exists
- whether format is parseable and useful
- whether the file points models to the site’s most important content
- whether a fuller companion file is worth generating

Use `templates/llms.txt` when you need a clean editable starting point.
