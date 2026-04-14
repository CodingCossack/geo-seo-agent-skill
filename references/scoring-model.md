# Composite scoring model

Only assign a composite GEO score for a true multi-area audit.

## Buckets

- Access and renderability — 25
- Citability and answer extraction — 20
- Content trust and depth — 20
- Structured data and entity graph — 15
- Brand and third-party entity signals — 10
- Platform-specific fit — 10

Total: 100

## Bucket guidance

### Access and renderability

Measure what crawlers can actually fetch and understand:

- robots directives
- HTTP status and canonicalization
- meta robots and x-robots-tag behavior
- server-side rendering or equivalent pre-rendered HTML
- sitemap discoverability

### Citability and answer extraction

Measure whether a model can quote a clean answer block:

- answer appears early
- passage stands alone with low referential ambiguity
- claims are specific and attributable
- structure is easy to extract

### Content trust and depth

Measure depth and trust signals, not generic verbosity:

- visible expertise and accountability
- coverage depth for the topic
- freshness where relevant
- concrete examples, data, or methodology
- low fluff density

### Structured data and entity graph

Measure whether the site exposes machine-readable meaning:

- relevant schema types present
- syntax valid enough to consume
- entity IDs and `sameAs` links coherent
- organization / author / product / local business coverage where relevant

### Brand and third-party entity signals

Use this bucket conservatively. It is directional.

- obvious entity records such as Wikipedia or Wikidata if they exist
- credible third-party profiles and review surfaces
- consistent branded presence across important platforms

### Platform-specific fit

Use this bucket only when platform nuance is requested.

- Google AI Overviews / Gemini fit
- ChatGPT web fit
- Perplexity fit
- Bing Copilot fit

## Severity bands

- 85–100: strong
- 70–84: workable
- 50–69: weak
- below 50: blocked

Scores are shorthand, not proof. The evidence and action plan matter more.
