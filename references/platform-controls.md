# Platform and crawler controls

Use this reference for AI-search platforms, crawler categories, `robots.txt`,
WAF or CDN bot policy, IndexNow, and `llms.txt`.

## Start with shared search foundations

For Google, AI Overviews and AI Mode retrieve from the core Search index and
quality systems. Google states there is no special AI schema, AI text file,
Markdown variant, or `llms.txt` needed to appear in Search or its AI features.
Prioritise useful original content, clear public delivery, crawlability,
indexability, internal discovery, and accurate structured data where a
supported Search feature needs it.

AI assistants outside Google may use their own or partner indexes and live
fetches. Ensure the relevant documented crawlers can fetch the site and do not
depend on client rendering unless that consumer documents and proves it.
Treat citation as a measured outcome, not a promise inferred from eligibility
or rank in another engine.

Use current Google guidance:

- [Generative AI features](https://developers.google.com/search/docs/fundamentals/ai-optimization-guide)
- [Search technical requirements](https://developers.google.com/search/docs/essentials/technical)

## Distinguish crawler purpose

Do not group every AI user agent as one permission. Operators separate
purposes such as:

- search discovery or indexing (for example `OAI-SearchBot`,
  `Claude-SearchBot`, `PerplexityBot`);
- real-time, user-requested retrieval or agent action (for example
  `ChatGPT-User`, `Claude-User`, `Perplexity-User` — and an operator may
  document that user-triggered fetchers ignore `robots.txt`);
- model training (for example `GPTBot`, `ClaudeBot`);
- other or mixed purposes — operators add crawlers over time.

`Google-Extended` is a `robots.txt` product token, not a request user agent.
It controls specified Gemini uses of content Google crawls; it does not
affect Google Search inclusion or ranking, and it cannot test Googlebot
reachability.

The desired policy is a product and rights decision: allowing search does not
require allowing training, and blocking "AI bots" as one category silently
removes AI-search citation along with training. Multi-purpose crawlers can be
governed by the most restrictive matching rule, so a training block can catch
a crawler that also serves search — check the provider's current semantics.

These rosters and behaviours drift; re-read the operator's current pages
during each implementation instead of copying a bot list into code or this
skill:

- Google: [crawler reference](https://developers.google.com/crawling/docs/crawlers-fetchers/google-common-crawlers)
- OpenAI: [publisher and bot documentation](https://developers.openai.com/api/docs/bots)
- Anthropic: [web crawlers](https://support.claude.com/en/articles/8896518-does-anthropic-crawl-data-from-the-web-and-how-can-site-owners-block-the-crawler)
- Perplexity: [crawlers](https://docs.perplexity.ai/docs/resources/perplexity-crawlers)

## Robots and enforcement are separate

`robots.txt` expresses path-level preferences to compliant crawlers. It does
not prove that a request reaches the file, and it is not a technical access
control. A CDN, WAF, bot product, rate limit, CAPTCHA, authentication, or geo
rule can block a crawler before the application — and several providers now
block AI crawlers by default on new zones, so absence of any deliberate
configuration is not absence of a block.

A request with a manually supplied crawler user agent is a synthetic treatment
check only: it can differ from a verified crawler's result. Do not conclude
real crawler access from it alone. Prefer the provider's verified-bot
classification or the operator's published verification contract when the
platform supports one; if a product only offers user-agent matching, record
that limitation.

When access is in scope:

1. test the exact public host with the operator's current user agent;
2. cover the homepage, `robots.txt`, sitemap, one important content page, and
   a required asset when relevant;
3. record status, redirect chain, challenge markers, cache and release
   headers, and meaningful body — a challenge or block page can itself carry
   `noindex` and feed the engine a de-indexing signal;
4. when available, inspect provider security events or request logs —
   the events name the exact owning rule, but treat aggregate dashboards
   without path and status as leads to reproduce, not proof;
5. identify the exact owning control before changing it;
6. re-test publicly after propagation, and record the change as access
   restored, not visibility or citation achieved.

For Cloudflare, AI Crawl Control blocks use WAF custom rules and can run before
bot products and application code. Its detection, defaults, categories, and
pay-per-crawl behaviour can change, so verify the current
[AI Crawl Control order](https://developers.cloudflare.com/ai-crawl-control/configuration/ai-crawl-control-with-bots/)
and the zone's actual rules before and after a change.

Google's documented `robots.txt` fetch semantics: 4xx (except 429) is treated
as "no robots.txt" (crawl allowed); 5xx or unreachable first halts crawling,
then falls back to the last cached copy. See the current
[robots.txt spec page](https://developers.google.com/crawling/docs/robots-txt/robots-txt-spec).

## `llms.txt` and crawler-specific surfaces

Treat `llms.txt`, Markdown mirrors, bot routes, or agent manifests as optional
distribution artefacts for a named, documented consumer. Google states that
Search ignores `llms.txt`; do not let it displace delivery, access, or content
fixes, and do not invent site facts to generate one.

## Notifications

IndexNow or a platform submission can shorten discovery for supported
consumers (Bing, Yandex, Naver and partners — not Google), but it is not
required for every site and its acknowledgement is not an indexing or ranking
guarantee. Drive IndexNow and the sitemap from the same canonical URL-set
owner so the two projections cannot drift. Verify URL eligibility, key
placement, payload, and the current contract at
[indexnow.org](https://www.indexnow.org/). Record submitted and accepted
separately from crawled, indexed, served, and measured results.
