# Platform-specific GEO worker

Use this worker when the user explicitly wants platform nuance.

## Platforms covered

- Google AI Overviews / Gemini
- ChatGPT web
- Perplexity
- Bing Copilot

## Principles

Do not pretend each platform needs a completely different website. Start with
shared fundamentals:

- crawlable, stable HTML
- direct answer blocks
- coherent entity signals
- machine-readable structured data where relevant

Then layer platform nuance:

- Google surfaces benefit from strong canonicalization, rich entity markup, and
  query-aligned answer sections.
- ChatGPT and Perplexity benefit from pages that are easy to quote, easy to
  verify, and easy to navigate from raw HTML.
- Bing Copilot can benefit from faster discovery workflows such as IndexNow when
  the publishing cadence warrants it.

Only produce this section when the user asked for it or it materially affects the
recommendation.
