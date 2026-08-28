# Content and entities

Use this reference for page usefulness, internal discovery, entity facts,
structured data, local business, portfolio evidence, images, and backlinks.

## Build for the user and the real query

Identify the audience, intent, and action the page must support. Prefer
original, first-hand, specific information that resolves that intent. Do not
create pages, sections, headings, or phrasing solely to satisfy a guessed AI
or keyword shape.

There is no universal ideal word count, passage length, heading pattern,
statistic density, or "citability score". Direct answers, clear structure,
attributable facts, and useful evidence help people and systems use a page,
but do not claim a ranking or citation effect without measurement.

Check normal discovery before special surfaces:

- the page is linked from relevant crawlable HTML (`<a href>`, not a JS
  handler or client-side search);
- anchor text and surrounding context describe the destination honestly;
- indexed pages do not link into `noindex` or preview routes as their main
  path, and near-duplicate pages have a deliberate identity and purpose;
- scaled pages add real value beyond rearranged or copied source text.

Use current Google guidance as a baseline:

- [Helpful, reliable, people-first content](https://developers.google.com/search/docs/fundamentals/creating-helpful-content)
- [Spam policies](https://developers.google.com/search/docs/essentials/spam-policies)

## Keep one authority for each fact

Trace names, addresses, service areas, contact details, dates, prices, hours,
ratings, authorship, project scope, credits, and social profiles to current
evidence. Visible content and machine-readable projections should use the
same factual authority. Search the relevant consumers when a fact changes; a
parser passing proves syntax, not truth.

Do not let a generator or "brand consistency" normaliser rewrite
evidence-bearing historical names, credits, dates, legal entities, or
delivery scope. Current presentation and historical attribution can be
separate fields when both are true; a rule broad enough to launder history
will eventually delete facts.

## Structured data

- Select a type supported for the real page and desired platform feature.
- Derive values from the page's verified data owner. Omit unknown optional
  facts; visibly absent beats silently invented.
- Do not emit example ratings, reviews, prices, availability, shipping,
  returns, founders, employee counts, addresses, profiles, or service areas.
- Keep structured-data URLs, entity IDs, canonicals, visible copy, and logos
  coherent — including one deliberate encoding of an internationalised
  domain per surface.
- Prefer server-delivered markup when non-rendering consumers matter. Google
  can process JavaScript-injected structured data, but it must be checked in
  Google's rendered output and can be less reliable for fast-changing facts.
- Structured-data policy violations are judged on the markup, not on
  indexability — `noindex` does not excuse non-compliant markup, and
  self-serving review markup is ineligible regardless.
- Validate syntax and current feature requirements, then inspect the deployed
  page. A source snippet or local rich-result test does not prove live
  output, and a "recommended field missing" warning is not an eligibility
  blocker — read the verdict precisely.

When required identity values are absent, request them or use unmistakable
tokens such as `{{CANONICAL_URL}}`. Do not substitute `example.com`, `www`,
or another plausible production value.

Use current first-party documentation rather than generic schema templates:

- [Structured data overview](https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data)
- [Organisation markup](https://developers.google.com/search/docs/appearance/structured-data/organization)
- [Local business markup](https://developers.google.com/search/docs/appearance/structured-data/local-business)

## Local business and profiles

Treat the official site, Business Profile, directories, and third-party
profiles as separate controlled surfaces. Confirm ownership and the actual
business before editing them, and record each surface's real state:
"verification processing" is not a visible listing, editing public profile
fields is not account recovery, and a registrar cart is not a registered
domain. Keep the real business name as identity; place services and
geography in their intended fields rather than keyword-stuffing the name.
Do not gate or selectively solicit reviews.

Use a profile in `sameAs` only when it identifies the same entity and is
current. Do not create Wikipedia, Reddit, YouTube, review-site, or directory
presences from a universal checklist. Relevance, eligibility, audience,
control, and factual support must pay for each surface. Consistency with the
business's own profile matters more than blanket directory-wide uniformity.

Google's current business-detail guidance is at
[Establish business details](https://developers.google.com/search/docs/appearance/establish-business-details).

## Portfolio projects and images

Keep these decisions separate:

- source and provenance, including relevant embedded metadata in the deployed
  public file;
- rights or licence for the destination;
- visual subject and project identity;
- the organisation's confirmed scope;
- editorial approval and hero choice;
- filename, alt text, caption, credit, and structured metadata;
- generated output and live rendering.

Possession, a blank credit, review approval, or a good filename proves none
of the other states. Alt text describes the image in its page context and
supports accessibility; it is not a keyword field. Preserve confirmed company
scope without turning project-wide facts into company achievements.

Use [Google image guidance](https://developers.google.com/search/docs/appearance/google-images)
for current discovery and metadata behaviour.

## Backlinks and mentions

Do not include backlink work unless it serves the requested outcome. A claimed
link exists when a live public page renders an outbound `href` to the intended
URL. Keep lead, submission, publication, indexability, link treatment,
referral, and measured effect separate: a form submit, plain-text mention,
moderation queue, or unreproducible search claim is not an acquired link. A
`nofollow` or `noindex` link can still have referral or entity value; state the
actual outcome instead of scoring it universally.
