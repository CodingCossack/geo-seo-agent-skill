# Schema and entity graph worker

Use this worker for structured data, machine-readable meaning, and entity graph
coverage.

## Workflow

1. Inspect JSON-LD or other structured data already present.
2. Evaluate relevance, completeness, and obvious syntax issues.
3. Check whether key entities have stable IDs and coherent `sameAs` links.
4. Where markup is missing or weak, start from `schemas/*.json`.

## Common target patterns

- `schemas/organization.json`
- `schemas/local-business.json`
- `schemas/article-author.json`
- `schemas/software-saas.json`
- `schemas/product-ecommerce.json`
- `schemas/website-searchaction.json`

## Output

Return:

- what exists now
- what is missing
- one corrected or recommended snippet per priority entity type
