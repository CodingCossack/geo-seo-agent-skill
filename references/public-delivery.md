# Public delivery

Use this reference for URL identity, technical delivery, crawl and index
controls, rendering, migrations, generated sites, and edge behaviour.

## Establish the real URL contract

Derive the canonical host and route set from current configuration, provider
state, and public responses. Test the material matrix rather than one
convenient URL:

| Dimension | Include when relevant |
| --- | --- |
| Protocol and host | HTTP/HTTPS, apex/`www`, old/new domain, preview/platform-default domain |
| Path | canonical path, known alias, retired path, unknown path, trailing-slash form |
| Encoding | percent-encoded and Unicode forms of non-ASCII paths; punycode and Unicode hosts |
| Query | exact queryless canonical; query-bearing form only if it has a real contract |
| Method | GET and HEAD when crawlers, caches, or redirects may treat them differently |
| Consumer | ordinary client and each crawler category that the task concerns |

Record material hops and the final status, URL, headers, and meaningful body. A
saved redirect rule or successful API response proves configuration
persistence, not delivery. A `301 -> 200` chain is wrong when the target
contradicts the intended contract: redirecting retired pages to a `noindex`,
irrelevant, or generic target is content loss that engines treat as a soft
404, not a migration.

## Attribute the response to the layer that produced it

Before editing any layer, establish which phase actually answered:

- read the response's own attribution: cache status and age headers, edge
  server and mitigation markers, release or version headers;
- inspect relevant zone-level rules when evidence implicates the edge; these
  may run before the application, so application tests cannot prove them;
- platform URL normalisation (slash collapsing, case, encoding) can rewrite
  requests before your code; a normalisation or redirect written in the
  application may be dead code in production — prove where it executes with a
  live request only that layer could answer;
- a dashboard rule that saved successfully still loses to DNS or origin
  behaviour beneath it (a CNAME to a third-party host, an origin-side
  redirect). Verify the live result, not the control plane.

Keep SEO URL-normalisation (case, slash, host) away from machine namespaces —
API routes, server-function transports, assets — and away from non-GET
methods: a cacheable `301` on a POST or an internal transport path breaks the
application while looking like tidy canonicalisation.

## Keep the URL consumers coherent

Choose one canonical and indexable URL set. Compare its projections:

- emitted files or runtime routes;
- internal links and navigation;
- HTTP redirects and status codes;
- `rel="canonical"`, robots meta, and `X-Robots-Tag`;
- sitemap files and sitemap indexes;
- structured-data URLs and stable entity IDs;
- feeds or search-engine notification state.

Treat missing, duplicate, or extra URLs as defects only where that consumer's
contract requires agreement. A canonical annotation is a hint, not a command:
conflicting redirects, sitemaps, internal links, or protocol variants can make
the engine select a different canonical than you declared — Search Console
reports this as "Duplicate, Google chose different canonical".

For an internationalised domain or non-ASCII slugs, the punycode/percent-
encoded form and the Unicode form are one identity: emit one consistent form
per surface deliberately, compare them only after normalisation, and expect
edge rules to match the percent-encoded request path. Search Console accepts
the punycode host form.

Preview and platform-default hostnames (`*.pages.dev`, `*.workers.dev`,
`*.vercel.app`, staging subdomains) can become indexable duplicates of the
real site. Redirect them, apply `noindex`, or prevent public access according
to their contract, and check them after launch.

## Use honest retirement behaviour

- Redirect only when a clear equivalent or consolidated replacement exists,
  and confirm the target is itself indexable and relevant.
- Return `404` or `410` when content is gone and no useful equivalent exists.
- Do not funnel unrelated retired URLs to a home page or generic hub.
- Keep error and retired pages out of canonicals, sitemaps, structured data,
  and conversion controls; an error page that emits a canonical or business
  schema is a soft-404 signal.

Select `404`, `410`, redirect, or retained historical content from the product
contract: preserving equity for a superseded page with a true replacement and
refusing to resurface stale sensitive content are both legitimate, opposite
decisions. Do not universalise one status.

## Treat crawl, render, and index controls as different layers

Check, in order as needed:

1. DNS, TLS, proxying, and origin binding;
2. CDN, WAF, bot, rate-limit, authentication, and geo controls;
3. application or Worker routing;
4. `robots.txt` permission;
5. response status and `Content-Type`;
6. meaningful rendered or server-delivered content;
7. meta robots and `X-Robots-Tag`;
8. canonical and sitemap membership.

A permissive `robots.txt` cannot bypass an upstream WAF block, and a crawler
must be able to fetch a page before it can read a `noindex` on it. Google
treats a robots.txt fetch returning 4xx (except 429) as "no robots.txt" and
5xx as a temporary full-crawl stop, per its current
[robots.txt documentation](https://developers.google.com/crawling/docs/robots-txt/robots-txt-spec).

## Rendering and crawlability of content

- Google renders JavaScript subject to crawl and rendering limits. Other
  search and assistant crawlers may not. Put primary content, links, and
  critical metadata in server-delivered HTML unless every consumer in scope
  is documented and observed to render them.
- Crawlers follow real `<a href>` links. Buttons, JavaScript handlers, and
  client-side search boxes are not crawl paths; give every indexable page a
  crawlable link route and paginated real URLs behind any infinite scroll.
- When mobile and desktop delivery can differ, compare the rendered surfaces
  rather than inferring parity from responsive source. See
  [Google's JavaScript guidance](https://developers.google.com/search/docs/crawling-indexing/javascript/javascript-seo-basics)
  and [mobile-first indexing](https://developers.google.com/search/docs/crawling-indexing/mobile/mobile-sites-mobile-first-indexing).

## Verify generated and cached delivery

Source, a successful build, generated output, preview, origin, custom domain,
and edge cache are separate states.

- Rebuild before judging generated output; scan the real output for both
  required content and retired residue, and remember that a stale build
  directory can resurrect removed code.
- The exact queryless canonical URL is the completion surface. A cache-busted
  query can prove origin state while the canonical URL stays stale. Ensure the
  freshness and invalidation contract fits the content, fix the layer that
  owns a stale response, and re-test the exact URL.
- For cached sitemaps or feeds, compare canonical and origin responses by
  generation ID, content hash, URL count, and `lastmod` where available. Do
  not use a cache bypass as the final user-facing proof.
- Compare GET and HEAD status, redirect target, content type, and cache
  headers when both methods are served; fixes applied to one method have
  missed the other before.
- Tie public responses to the deployed revision and data generation when the
  platform exposes them. An uploaded version is not a promoted deployment; a
  merged commit is not a release; an app release without its matching data
  snapshot can break routes that were healthy.

## Language and regional variants

When locale variants exist, keep each genuine translation or regional page's
canonical in the appropriate language. Verify valid locale codes, self and
return annotations, `x-default` where intended, and agreement between HTML or
sitemap `hreflang` projections. When canonical and `hreflang` disagree, the
  the conflict can cause alternates to be ignored. Do not canonicalise genuine
  variants together merely to simplify the route set. Use Google's current
[localised-version guidance](https://developers.google.com/search/docs/specialty/international/localized-versions).

## Site moves

For a domain or path migration, verify the mapping itself, not only transport:

- each important old URL maps to the best true new equivalent, and the
  equivalence of anchor meaning is checked, not assumed from an existing
  redirect;
- redirects preserve path and query where that is part of the contract;
- new pages self-canonicalise and use the new host in links and sitemaps;
- migration-only `noindex` or robots blocks are removed at release —
  redirecting old URLs onto still-`noindex` targets recreates the loss the
  migration was meant to prevent;
- old and new properties and dashboards are inspected separately;
- redirects remain for the transition required by real consumers.

Current Google guidance is the authority for Google-specific behaviour:

- [Site moves](https://developers.google.com/search/docs/crawling-indexing/site-move-with-url-changes)
- [Canonical URLs](https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls)
- [Redirects](https://developers.google.com/search/docs/crawling-indexing/301-redirects)
- [Sitemaps](https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap)

Recheck these sources when implementation depends on current platform rules.
