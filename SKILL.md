---
name: geo-seo-toolkit
description: >-
  Use whenever search or AI-search visibility of a real site is at stake:
  diagnosing indexing, ranking, crawling, or citation problems; implementing or
  reviewing canonicals, redirects, robots and crawler policy, sitemaps,
  rendered HTML, structured data, or programmatic URL sets; launching,
  migrating, or retiring public pages or domains; and verifying that any such
  change is actually live and correct on the public surface. Covers Search
  Console and analytics diagnosis, JobPosting and other schema, local business
  and portfolio SEO, CDN/WAF/cache and AI-crawler access, and re-checking work
  previously declared fixed. Do not use for generic marketing copy, sales CRM,
  or outreach without a real site and evidence.
---

# SEO and AI Search

Search visibility is a chain. A correct tag, green build, passing test, saved
dashboard rule, accepted submission, or crawler `200` proves only its own
layer. For each material symptom or URL class in scope, find the first broken
owner in its real chain, fix that owner rather than downstream symptoms, then
prove the result at the surface that carries the user outcome.

## Start with the requested outcome

Establish before broad investigation:

- the exact domain, host, URL class, audience, and search surface in scope;
- whether the task is diagnosis, implementation, release, or measurement;
- the intended URL and content contract, including any migration or retirement;
- which repository, dataset, deployment, edge, and external property currently
  own that contract.

Resolve names from repository and provider configuration, not from prose.
Before broader inspection, make one direct check that the current workspace or
connected property owns the target. If it does not, locate or request the
correct one instead of mining the wrong workspace. When local code is used to
explain public behaviour, establish how that revision relates to origin and
the deployed release.

## Trace one contract end to end

Follow only the layers relevant to the symptom:

`source fact or URL owner -> generated output or data -> committed revision -> deployed release (code + data) -> CDN/WAF/edge cache -> crawler access -> engine record -> measured outcome`

Attribute every observed public response to the layer that actually produced
it before changing any layer. Zone redirect rules, WAF and bot controls,
managed robots files, platform URL normalisation, and edge caches can act
before your application code — and your code's own tests can never prove that
phase ordering. When two layers disagree, report both states instead of
choosing the more convenient one. Do not audit every layer by default; stop
expanding when evidence identifies the owner and the smallest coherent fix.

## Work the root cause

1. Reproduce the exact symptom on the exact host, path, protocol, method, and
   relevant user agent or account property.
2. If this symptom was declared fixed before, first find the prior fix and the
   evidence that closed it. That shows what was proved and which later surface
   now contradicts it; do not repeat the same fix without explaining the gap.
3. Inspect current source, generated artefacts, runtime data, deployed
   revision, edge response, and dashboard state only as needed to locate the
   first divergence.
4. Find the existing owner of the URL, entity fact, indexability decision, or
   crawler control. Fix that owner instead of adding another override, then
   check the consumers affected by that decision.
5. Prove the change at the lowest seam that contains the risk, then at the
   public seam below.
6. Report each state separately. Never turn eligibility or submission into a
   claim of indexing, ranking, citation, traffic, or conversion.

## The public seam gates "done"

Before calling any public-facing change complete, fetch the exact queryless
canonical URL on the production host — GET, plus HEAD when redirects or caches
are involved — and tie the response to the deployed release (and data
generation) when the platform exposes one. None of the following count as that
proof: a local build, a preview or platform-default host, a feature branch, a
cache-busted or query-variant URL, a green test suite, a merged commit, an
accepted submission, or a dashboard rule that reports "saved". Each proves
only its own plane; say which plane you proved.

## Non-negotiable judgement rules

- Where surfaces refer to the same URL identity, redirects, canonicals,
  internal links, sitemaps, alternate hosts or encodings, structured data, and
  notifications should agree. The chosen host or slash policy is
  project-specific.
- Canonical identity is a semantic decision. Current content or result-set
  equality alone does not prove that two routes are permanent duplicates.
- A redirect is right only when its target is a true equivalent that is itself
  indexable and relevant. Transport success (`301 -> 200`) with a wrong,
  `noindex`, or generic target is content loss, not migration.
- Missing, ambiguous, rejected, and not-evaluated data are not positive facts.
  Do not replace them with plausible employment terms, locations, dates,
  prices, categories, ratings, profiles, or business details — visibly absent
  beats silently invented.
- Normal crawlable HTML, links, and public content are primary. Crawler-only
  files, Markdown mirrors, bot routes, or schema do not repair a weak, false,
  or client-side-only page.
- A deterministic tool or test can be consistently wrong, and a check that
  re-reads the same generated literal or fixture is not independent evidence.
  Treat tool output as an observation whose assumptions must match the
  contract.
- Do not assign a composite SEO, GEO, citability, authority, or platform score
  unless the user supplied a calibrated model. Rank findings by demonstrated
  blockage, breadth, user impact, and fix leverage.
- A technical repair proves technical eligibility, not SEO success. Traffic
  and ranking changes are evidence to investigate, not proof of one cause.

## Route to the smallest relevant reference

- For hosts, DNS/TLS, redirects, canonicals, robots, rendering, IDN and
  encoded URLs, sitemaps, migrations, generated output, CDN/WAF/edge
  behaviour, or caching, read
  [references/public-delivery.md](references/public-delivery.md).
- For helpful content, internal discovery, entity truth, structured data,
  local business, portfolio evidence, images, or backlinks, read
  [references/content-and-entities.md](references/content-and-entities.md).
- For programmatic routes, jobs, changing inventories, semantic defaults,
  pagination, lifecycle, error pages, or notification feeds, read
  [references/dynamic-pages.md](references/dynamic-pages.md).
- For Google AI features, ChatGPT search, Claude, Perplexity, bot categories,
  `robots.txt` policy, WAF and bot-management controls, IndexNow, or
  `llms.txt`, read
  [references/platform-controls.md](references/platform-controls.md).
- For Search Console, analytics, ranking loss, release identity, fixtures,
  dashboards, or a claim that work is fixed or complete, read
  [references/measurement-and-proof.md](references/measurement-and-proof.md).

Read more than one reference only when the task crosses those boundaries.

## Authority and finish

An audit or diagnosis does not authorise code changes, deployment, Search
Console submission, provider settings, profile edits, outreach, or
publication. An implementation request authorises the smallest coherent
in-scope change and its proportionate validation. The indexability of a route
class, a canonical consolidation, a retirement status, and a crawler policy
are each product decisions: never change one as a side effect of another
task, and stop and ask when the missing decision is the product owner's to
make. Preserve unrelated repository and external state; report material
incidental findings instead of fixing them unasked.

Finish with:

- the root causes and owning layers;
- what changed, including intentional URL or content-contract changes;
- evidence for each local, deployed, public, dashboard, and search-engine
  claim you actually make;
- any material gap that prevents a stronger claim.

Do not call the work fixed while the relevant public, cached, or external
state still contradicts it — and if you cannot observe that state, say so
instead of assuming it.
