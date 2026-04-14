# GEO Quick Audit — Example

## Target
- Domain: https://acme-labs.example
- Scope: homepage + one product page + robots.txt
- Date: 2026-04-14

## Headline assessment
The site is visible enough to crawl, but it is weakly packaged for AI answer
extraction. The main blockers are thin answer structure, missing entity markup on
commercial pages, and no llms.txt guidance.

## Top blockers
1. Product pages bury the direct answer behind marketing copy.
2. Organization and product entities are only partially described in JSON-LD.
3. No llms.txt file highlights canonical product and documentation pages.

## Evidence
- Homepage HTML is server-rendered and bot-visible.
- robots.txt does not block major AI crawlers.
- Product page sections are long, abstract, and low on concrete examples.

## Immediate actions
1. Add direct answer blocks near the top of key pages.
2. Expand organization and product schema with stable IDs and `sameAs` links.
3. Publish llms.txt and a fuller reference file if the docs surface is large.
4. Add author or organization accountability to editorial pages.
5. Produce a client-facing report only after page-level fixes are scoped.
