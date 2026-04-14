# Brand and entity presence worker

Use this worker only when the user asks about brand visibility, authority, or
entity recognition beyond on-site markup.

## Primary tool

- `scripts/brand_scanner.py <brand_name> [domain]`

## Scope

This is heuristic. Treat it as a directional scan of third-party presence.

Check for:

- major branded profiles and communities
- obvious entity records such as Wikipedia or Wikidata when relevant
- review or discussion surfaces that materially affect trust or discovery in the
  user’s market

Use `rubrics/brand-entity.md` to keep scoring conservative.
