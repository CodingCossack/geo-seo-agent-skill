# Measurement and proof

Use this reference for Search Console, analytics, ranking or traffic
incidents, release identity, fixtures, dashboards, and completion claims.

## Name the state you observed

Keep these planes separate:

| Plane | What it can prove |
| --- | --- |
| Source and data | intended owner and current inputs |
| Generated output | what the build emitted |
| Commit and CI | what revision was recorded and checked |
| Deployment or origin | what version the runtime serves before edge effects |
| Edge and exact public URL | what users and crawlers receive now |
| Provider configuration | what a control plane says is saved or active |
| Crawler request | fetchability for that request and category |
| Search dashboard | the engine's recorded crawl, canonical, index, or performance state at its timestamp |
| Search result | what the engine served for that query, locale, device, and time |
| Analytics or conversion | measured visits or actions under that tracking contract |

Do not collapse these into "done". A commit is not a release; an uploaded
version is not necessarily promoted; a local test is not live behaviour; a
saved dashboard rule is not its public effect; and a cache bypass is not the
canonical URL's state. Tie a public claim to the deployed revision and data
generation when the platform exposes them. If the release cannot be
identified, state that gap.

## Diagnose outcome changes without inventing causality

Low impressions or clicks can result from access, indexability, selected
canonical, page value, demand, competition, ranking, migration lag,
seasonality, tracking, or several causes at once. Use the outcome as a
trigger for investigation. Confirm or reject hypotheses with URL-level and
time-aligned evidence.

Start with affected page classes and queries, not a site-wide checklist.
Compare the change date with deployments, migrations, route or data changes,
crawler logs, index records, and analytics configuration. Do not claim
recovery from technical eligibility alone; observe the later outcome when the
outcome is the goal. Do not label a change severe or migration-caused until
the baseline, demand, tracking contract, and affected page classes are known.

## Use dashboards precisely

- Confirm the exact property (domain vs URL-prefix) and account ownership;
  during a migration, inspect old and new properties separately — a stale row
  in one can be the historical footprint of a different site generation, not
  evidence about the current release.
- Separate the live URL test from the engine's indexed record. "Discovered",
  "Crawled — currently not indexed", "Processing", and a successful live test
  are each distinct states; none is "indexed", and the indexed record updates
  asynchronously after any fix.
- A sitemap submission, recrawl request, API `200`, or accepted quota form
  proves acceptance or pending work, not crawling or indexing — and a
  sitemap's "last read" date is the engine's fetch cadence, not your deploy
  signal.
- Aggregate dashboard metrics (crawl buckets, bot categories) without exact
  path and status are leads: reproduce the response before treating one as a
  defect, and expect stale index snapshots (an old redirect, a pre-migration
  crawl) to explain "errors" that no longer exist live.
- The `site:` operator is a lead, not an index count. Bing Webmaster Tools
  has its own sitemap/index states and an AI Performance report for citation
  measurement where available.

Current references:

- [Search operators and their limits](https://developers.google.com/search/docs/monitor-debug/search-operators)
- [URL Inspection API](https://developers.google.com/webmaster-tools/v1/urlInspection.index/urlInspection.index)

## Match proof to the failure

Use a case that would still fail if the root cause remained:

- wrong target: derive the host, repository, and property from current
  configuration, then test DNS, TLS, GET/HEAD, and the terminal body;
- recurring symptom: retrieve the prior fix and its closing evidence first;
  test the exact gap between that evidence and the surface that now fails;
- canonical drift: compare one canonical URL set across every consumer and
  add a changed-over-time case;
- crawler block: test the public user-agent matrix and inspect the owning
  edge event, not only `robots.txt`;
- generated residue: rebuild, then inspect generated output, route set,
  sitemap, internal links, metadata, and the exact public URL;
- stale cache: test the exact queryless canonical edge response as well as
  origin, and never use the bypass as completion proof;
- schema truth: compare rendered visible facts, the source authority, and
  live structured data on the deployed page;
- large route set: identify the release dataset and test records beyond every
  bound or fixture;
- external notification: record request, acceptance, later crawl/index state,
  and measured appearance separately.

Tests that repeat the same literal source, generated policy, or fixture are
not independent evidence, and a verification gate can itself be broken —
when a gate's verdict is load-bearing, confirm the gate can still fail.
Prefer the seam where a false public result becomes observable.

## Bound the claim and stop

An audit is complete when it identifies the material root causes within
scope, ties each to current evidence, and states what would prove a fix. An
implementation is complete when the owning change is validated locally and at
every authorised external seam required by the outcome.

Do not extend the task to every low-value SEO possibility. Report remaining
material gaps and stop when further progress needs a product decision,
account access, deployment authority, engine recrawl, or time-based outcome
evidence.
