# Crawler access and discoverability worker

Use this worker for robots, AI bot access, rendering exposure, and domain-level
crawl guidance.

## Primary tools

- `scripts/fetch_page.py <url> robots`
- `scripts/fetch_page.py <url> page`
- `scripts/fetch_page.py <url> sitemap`
- `scripts/fetch_page.py <url> full`

## Checks

1. robots.txt availability and syntax
2. directives for GPTBot, ClaudeBot, PerplexityBot, Google-Extended, and generic
   wildcard rules
3. meta robots and x-robots-tag directives
4. sitemap presence and discoverability
5. canonical host and redirect behavior
6. whether meaningful HTML is present without client-side execution

## Output

State clearly:

- allowed
- blocked
- partially blocked
- ambiguous

Then give the smallest fix that removes the blocker.

## Escalate to technical worker when

- rendering is unclear
- meta / header combinations are contradictory
- heavy JS likely hides content from bots
