# Full audit worker

Use this worker for a complete or multi-area GEO audit.

## Inputs

- target URL or domain
- audit depth: quick, standard, or deep
- any user priority such as AI bots, schema, reports, or specific platforms

## Procedure

1. Run discovery from `references/workflow.md`.
2. Use `scripts/fetch_page.py <url> full` when deterministic extraction helps.
3. Build a page sample that reflects the site’s real revenue or authority surface.
4. Select only the workers justified by the target and request.
5. Merge overlapping findings before scoring.
6. Use `references/scoring-model.md` only if the user wants a composite score or
   a full audit deliverable.
7. Hand off to `workers/reporting.md` if the user wants a deliverable.

## Minimum evidence expected

- homepage evidence
- one or more priority page checks
- robots or crawlability evidence
- at least one clear technical or content example when you claim a systemic issue

## Avoid

- inventing performance numbers
- scoring a domain from one thin page sample unless the user asked for a quick
  triage
- duplicating the same root cause under every section
