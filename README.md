# geo-seo-toolkit

A progressive-disclosure skill for diagnosing, implementing, releasing, and
verifying search visibility on real sites. It covers conventional SEO and
AI-search surfaces without treating "GEO" as a separate scoring system, and
it is grounded in reconstructed real failures — recurring cases where SEO
work was declared fixed while the public surface still contradicted it.

The entry point is [`SKILL.md`](SKILL.md). It carries the shared judgement
(chain tracing, layer attribution, the public-seam completion gate, URL and
fact-truth rules) and routes to five references:

- public delivery, URL identity, rendering, and edge behaviour;
- content, entities, structured data, images, and backlinks;
- dynamic and programmatic pages;
- crawler and platform controls;
- measurement and proof.

The package contains no synthetic score, generated business facts, schema
starter data, crawler simulator, report generator, CRM, or platform-specific
agent copy. Use the current site's own tools and the target platform's
current first-party documentation.

## Install

```bash
npx skills add CodingCossack/geo-seo-toolkit -g --agent claude-code codex -y
```

Or link a local checkout into the relevant skills directory:

```bash
ln -s /absolute/path/to/geo-seo-toolkit ~/.codex/skills/geo-seo-toolkit
ln -s /absolute/path/to/geo-seo-toolkit ~/.claude/skills/geo-seo-toolkit
```

Invoke it by name when automatic selection would be ambiguous:

```text
Use $geo-seo-toolkit to diagnose why this URL class lost search visibility.
```
