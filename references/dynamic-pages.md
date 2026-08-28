# Dynamic and programmatic pages

Use this reference for large or changing route sets, jobs, inventories, search
and pagination, lifecycle transitions, semantic extraction, and notification
feeds.

## Separate the decisions

Do not hide several product decisions behind one `eligible` flag. Model and
persist separate states when the domain needs them, for example:

- visible to users;
- available or historically retained;
- indexable;
- included in a sitemap;
- eligible for a rich-result schema type;
- eligible for a notification API;
- reachable from normal internal links.

Each projection should share the same underlying facts without pretending the
decisions are identical. When one decision changes, check for copied rules
that still govern another affected projection.

## Keep canonical identity stable

Canonical aliases need stable semantic identity. Current result-set equality
alone does not make two routes permanent duplicates: inventories, prices, and
page membership can change. Base permanent aliases on route meaning, not a
single membership snapshot.

For search, filters, facets, and pagination, decide which combinations are
useful landing pages and which are crawlable, indexable, canonical, internally
discoverable, and sitemap-eligible. Prevent unbounded discovery, but do not
canonicalise distinct useful pages together merely to reduce crawling — and
remember canonicals address indexing signals, not crawl control. Pagination
needs stable ordering and bounded parameters; otherwise changing inventory can
duplicate or hide records and unbounded page values can create useless URLs.

Scaled thin pages are a policy risk, not only a quality risk: Google's
[spam policies](https://developers.google.com/search/docs/essentials/spam-policies)
treat mass-produced pages that add no value over their source data as scaled
content abuse. Create a programmatic page class only
where each page serves a distinct real query with real content, and gate new
child routes on demand or product evidence rather than generating the full
combinatorial tree first.

## Preserve unknowns

Missing or ambiguous source evidence must stay missing or ambiguous until a
verified contract resolves it. Do not default an unknown job to `Full-time`,
an unknown country to a likely market, an absent price unit to yearly, an
unproved venue or seniority to a common category, or an unknown remote state
to false. A production distribution dominated by one default value, or a
schema branch that never fires, is a signal to inspect the producer, not proof
of an error by itself.

Prefer one factual owner with provenance. Storage, search, metadata, visible
UI, structured data, and feeds should project the same fact or omission.
Consumer-specific repairs must not change its meaning. Presentation-only
formatting is not itself a defect.

## Prove reachability and completeness

A performance bound is valid only for a deliberately bounded surface. Do not
let a candidate limit, page clamp, membership cap, or fixture dataset stand
where the contract requires complete public reachability or sitemap coverage.
When counts are unexpectedly small, check bounds and fixture fallbacks.

- Record the release dataset identity and size when public coverage depends on
  it. A fixture proves code behaviour, not production breadth.
- Measure internal reachability on the live surface at production scale. Every
  indexable page needs a crawlable `<a href>` path; a client-side search box or
  JS-only listing is not one.
- Test cases beyond each boundary: low-ranked and late records, the first item
  past a limit or clamp, dense records with many memberships, routes absent
  from the fixture but present in release data, and inventory that changes
  after a canonical or lifecycle decision.

## Jobs and short-lived records

Choose the exact public contract for each state. Define and test the precedence
between lifecycle, identity, redirects, and canonicalisation; their order can
change the status or target. One possible contract is:

| State | Expected surface |
| --- | --- |
| Live canonical record | `200`, self-canonical, truthful visible data, eligible schema only when complete enough |
| Live record at a wrong or stale slug | one permanent redirect to the durable public URL |
| Superseded duplicate | one permanent redirect to the live winner, while the winner lives |
| Never-published or unknown ID | `404`, `noindex`, no canonical or rich-result schema |
| Withdrawn or expired published record | the chosen retirement or retention contract, without stale active schema or conversion controls |

Do not copy this table blindly when the product intentionally retains useful
historical pages; preserve that decision and prove it. Prove the contract on
the awkward paths — legacy IDs, duplicate losers, the framework's own
error-status handling, which can overwrite a stamped status — and keep
retired URLs out of the sitemap; a sitemap listing 404/410 URLs is hygiene
debt that misdirects crawling.

For Google JobPosting pages:

- visible job facts and `JobPosting` values must agree — salary, location,
  and employment terms in schema that the page does not show invite manual
  actions;
- update or remove expired postings promptly (`validThrough` in the past,
  `404`/`410`, or markup removal);
- Google Indexing API notifications are limited to `JobPosting` pages and
  `BroadcastEvent` in `VideoObject`; an accepted notification (HTTP 200) asks
  for processing and proves nothing about crawling, indexing, appearance, or
  timing — respect the current quota and reconcile
  accepted requests against later crawl and index state instead of logging
  "submitted" as success;
- keep a sitemap for wider coverage even when eligible jobs use the API.

Verify the current contract before implementation:

- [Job posting structured data](https://developers.google.com/search/docs/appearance/structured-data/job-posting)
- [Indexing API](https://developers.google.com/search/apis/indexing-api/v3/using-api)

## End-to-end proof

Use production-shaped evidence at the layers needed by the claim. Do not mock
or bypass the layer whose semantic agreement you claim to prove. Include a
changed-over-time case when lifecycle or changing membership is the risk.
