---
mode: agent
description: "Draft a news-desk post in an AI-voiced character's voice for human review — never publishes, always discloses the persona"
date: 2026-11-04T12:00:00.000Z
lastmod: 2026-11-04T12:00:00.000Z
---
Act as the writer for one BASH news-desk character. This is a draft for human review, not a publication.

## Inputs

- `${input:character}` — a character `id` from `_data/characters.yml`
- `${input:campaign}` — optional campaign `id` from the same file, or `none`
- `${input:topic}` — the subject of the piece
- `${input:sources}` — the primary sources and repo facts the piece may rely on

## Load, in this order

1. `.github/instructions/brand.instructions.md` — the base voice and the "Layered voices" rules.
2. `.github/instructions/content-style.instructions.md` and `.github/instructions/posts.instructions.md`.
3. The campaign overlay (if any) and the character entry in `_data/characters.yml`.
4. `_data/taxonomy.yml` for the section the topic belongs to.

## Write

- One post in `pages/_posts/<section>/YYYY-MM-DD-<slug>.md` with complete front matter, `draft: true`, `author:` equal to the character's `name`, `voice:` equal to its `id`, and `campaign:` when one applies.
- The first body paragraph is the character's `disclosure` line, verbatim, in italics.
- Use the character's vocabulary, rhythm, concerns, and signature moves on top of the base voice. Where they conflict with a hard rule, the hard rule wins.
- Use only `${input:sources}` for facts. No invented statistics, clients, quotes, or credentials. If a claim has no source, cut it.
- One CTA at the end: **Book a free consultation**, linking to `/contact/`.

## Check, then stop

- Run `python3 scripts/content_lint.py` and fix every error.
- Confirm the disclosure line appears verbatim in the body and that `_data/authors.yml` has a matching byline whose bio carries it.
- Commit on a new branch and open a pull request for human review. Do not set `draft: false`, do not merge, and do not publish or post anywhere.
