# Technical foundations worker

Use this worker for renderability, indexability, and technical risk beyond the
basic crawler check.

## Checks

- HTTP status, redirect chains, canonicalization
- meta tags and x-robots behavior
- SSR / SSG / pre-render vs client-side shell risk
- HTML language, viewport, and social preview tags
- security headers
- rough Core Web Vitals risk indicators from static HTML
- URL structure and obvious mobile issues

## Evidence discipline

Call out what is observed in HTML or headers versus what needs live lab or field
measurement.

Do not claim measured CWV values from static HTML alone.

## Severity guidance

- critical: bots cannot see or index meaningful content
- high: key discovery or trust signals missing on revenue pages
- medium: quality-limiting but not blocking
- low: polish or secondary enhancement

Use `rubrics/technical.md` for scoring detail.
