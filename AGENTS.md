# Repository instructions

This repository is the canonical source for one skill: `geo-seo-toolkit`.

- Keep `SKILL.md` as the only entry point and the judgement shared by all SEO
  tasks. Detailed, distinct concerns live in `references/`, with boundaries
  clear enough that an agent loads only what the task needs.
- Ground every rule in evidence: a recurring real failure, a confirmed final
  fix, or current first-party documentation. Prefer a stable principle plus a
  link and a direction to recheck over copied crawler lists, thresholds, or
  volatile product behaviour.
- Do not add composite SEO or GEO scores, invented benchmarks, example
  business facts, schema starter values, crawler simulators, report
  generators, CRM material, or claims that technical eligibility proves
  traffic. When a mechanism is unsound, remove it — softening its wording has
  been tried and does not work.
- Add a script, template, fixture, adapter, or duplicated agent instruction
  only for a named active consumer and a repeated error that normal site
  tools cannot handle reliably.
- Keep project-specific URL, entity, release, and provider contracts in the
  consuming project.
- Validate frontmatter, internal links, external links, and changed factual
  claims before release; behavioural spot-checks on realistic blind prompts
  are worth more than prose review. Test the public seam only when authority
  and access allow it.
- Codex and Claude installations symlink to this checkout: never leave the
  working tree in an incoherent intermediate state; stage large rewrites
  elsewhere and integrate coherently.
