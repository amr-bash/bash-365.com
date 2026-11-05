---
applyTo: "pages/**/*.md,index.md,about.md,contact.md,tools.md,ai-operations.md,_layouts/**,_includes/**,assets/brand/**,.claude/**"
description: "The BASH brand — name, mission, voice, colors, logo, and doctrine — the single source of truth every agent and author follows"
date: 2026-07-07T12:00:00.000Z
lastmod: 2026-11-04T12:00:00.000Z
---

# The BASH brand

This is the **single source of truth** for who BASH is and how it presents itself. When copy, a layout, an asset, or an agent has to make an identity decision, it is made here — not from memory and not per-page. Editorial mechanics (banned phrases, SEO limits, formatting) live in [`content-style.instructions.md`](./content-style.instructions.md); this file is the layer above it: what the brand *is*.

## Name and etymology

- **BASH Consulting** — trading name of the practice. Also written **BASH Consultants**.
- **BASH** expands to **Bourne Again Solutions Hero** — a deliberate play on the Unix **Bourne Again
SHell** (`bash`), the tool that turns typed intent into executed work. The name says the thing the firm does: it is where a business's terminal-level intent becomes real, running systems.
- **Capitalization:** the brand is **BASH** in full caps. The shell is lowercase `bash` in
monospace. Never write the brand as "Bash" or "bash". "BASH Consulting" on first mention; "BASH" thereafter.
- **Founder:** Amr Abdel-Motaleb (BS Finance, MS Information Systems), Denver, Colorado. He is the
  author byline on all content: `Amr Abdel-Motaleb`.

## Mission and positioning

**Mission.** Bring enterprise-grade IT — cloud, Enterprise Resource Planning (ERP), customer and asset management, data architecture, and an AI overlay — within reach of small and medium businesses (SMBs) that were priced out of it. People over profits: we scope honestly, tell a client when something is not a fit, and build systems a business can own and leave with.

**Positioning line (canonical).** *Enterprise-grade IT for small business — cloud, ERP, data, and AI-augmented automation, from Denver, Colorado.*

**Who we serve.** Owners, operators, and in-house IT leads at SMBs (roughly 5–200 staff), Denver metro first, remote across the United States. Full reader profile in `content-style.instructions.md`.

## The doctrine (what makes the brand coherent)

Every page, service, and internal tool should be legible as an expression of four commitments. They are the through-line partners are held to and clients are sold on.

1. **Deterministic foundations first, AI as an overlay — never the load-bearing wall.** If a step can
be a script, it is a script. The model is spent where judgment is genuinely needed. Deterministic steps fail loudly and predictably; keep them under anything a model touches.
2. **Governed, not improvised.** Rules live in files, recurring work runs from versioned playbooks,
automation checks work before it ships, and a named person approves anything customer-facing. This repository is the reference implementation — see [`/ai-operations/`](../../ai-operations.md).
3. **Build in the open; own what you build.** Systems are documented, inspectable, and portable so a
   client is never locked in — to a vendor or to us. Partners demonstrate this in public.
4. **Easy but hard.** The door is open to anyone; the bar is the best work. This is the ethos behind
the partner path ([`/tools/partners/qualification/`](../../pages/_toolkit/qualification.md)) and the tone of everything: welcoming at the entrance, uncompromising on quality.

## Verbal identity

Voice mechanics are governed by `content-style.instructions.md` (confident-not-boastful, plain English first, active voice, lead with the business outcome, one CTA, enact-don't-announce). This section is the voice itself: who is talking, to whom, and how.

### The voice in one paragraph

BASH sounds like a controller who learned to code, explaining the fix across the desk. It is a practitioner talking to a peer: plain English, short declarative sentences, the number or the risk first, and the mechanism right after. It treats the books and the systems as one thing. A ledger is a codebase, a close checklist is a pipeline, a reconciliation is a test, and an approval is a review. It respects what finance and operations people already know, and it tells them, without flattery, that they are closer to building their own systems than they think.

### What changed in the November 2026 refresh, and why

The voice evolved; it was not replaced. Every rule above and below still holds.

| Was | Now | Why |
|---|---|---|
| "We'll handle the IT for you" (the reader as a buyer of technology) | "You already understand the logic; we help you own the system" (the reader as a capable builder) | The planned series *The ledger is a codebase* positions finance and accounting people as the next technical powerhouses. The voice has to treat them as builders, not as a downstream audience. |
| Finance + IT fluency as a credential ("we speak both languages") | Finance + IT fluency as a method: translate each idea both ways, in the sentence itself | A credential is a claim; a translation is proof the reader can check on the page. |
| Generic SMB-IT phrasing on the static pages ("navigate IT disarray", "compete more effectively", "streamline operations") | The same concrete register the posts already use: name the workbook, the close, the tie-out | The posts had already moved; the home, about, contact, and services pages lagged behind them. |
| One voice for every page | A layered voice: base, campaign overlays, and AI-voiced news-desk characters, with hard rules locked at every layer | Campaigns and recurring desk characters make the news sections feel lived-in without diluting the house voice. |
| Several CTA wordings ("Schedule a consultation", "Schedule a free consultation", "Book a free consultation") | One CTA, one wording: **Book a free consultation**, linking to `/contact/` | One action, said the same way everywhere, is easier to trust and to measure. |

### Tone

- **Peer, not vendor.** Write as one practitioner to another. No pitch voice, no hype, no flattery.
- **Calm confidence.** State the claim, then show the mechanism. Earn certainty with specifics, not adjectives.
- **Respect for the reader's craft.** Assume the reader understands their own numbers better than we do. Our job is the system around them.
- **Dry wit is allowed, sparingly** — a knowing aside, a file named `Sheet1 (final)(v3)`. It never comes at the reader's expense.
- **Terminal literacy, lightly.** The `bash` motif can surface knowingly (a prompt, a command, a shell metaphor) where it earns its place — never as costume, and never at the expense of a reader who does not live in a terminal.

### Sentence shape

- **Lead with the finding.** First sentence of a section says what is true or what it costs. Context comes second.
- **Short declaratives carry the argument.** Mostly 8–20 words. A long sentence is fine when it walks through a mechanism step by step; it is not fine as a warm-up.
- **One idea per paragraph, one paragraph per source line.** Paragraphs run two to four sentences on pages; posts may run longer.
- **Translate in place.** When a finance idea meets a technology idea, pair them in the same sentence: "A reconciliation is a test: it either ties or it fails."
- **Concrete nouns over abstractions.** "The workbook in cell M14" beats "legacy processes". "Month-end close" beats "financial operations".
- **No throat-clearing.** Cut openers like "It's important to note", "When it comes to", "In order to".

### Vocabulary

**Use:** the finance side (close, tie out, reconcile, general ledger (GL), AR/AP, accrual, audit trail, maker-checker, segregation of duties, total cost of ownership (TCO)); the systems side (pipeline, test, version history, review, rollback, landing zone, integration, RPO/RTO); and the bridge between them (own, inspect, leave with, written down, runs the same way every time).

**Avoid:** everything on the banned list in `content-style.instructions.md`, plus pitch verbs that promise without showing ("transform", "supercharge", "streamline" with no number), condescension toward non-technical readers ("even you can", "don't worry, it's simple"), and hype about the reader ("rockstar", "wizard", "ninja"). Never call a finance professional "non-technical".

### How the site talks to visitors versus clients

- **Visitors (public pages and posts)** are evaluating us and their own options. Give them something useful whether or not they hire us: a threshold, a checklist, a way to test their own setup. Second person, present tense. One CTA, at the end, never mid-argument.
- **Clients (proposals, delivery notes, toolkit docs written for the engagement)** already chose us. Be more direct: what we did, what changed, what they own now, what to watch. Name the decision they need to make and by when. No selling.
- **Both:** never imply a client relationship, outcome, or number we cannot show. Describe categories of work, in ranges.

### Calls to action

- **One CTA per page**, in the closing section, worded **Book a free consultation** and linking to `/contact/`. A secondary *navigation* link (for example "Explore our services") is not a second CTA, but it never competes visually with the primary button.
- **Say what happens next, plainly.** The sentence before the CTA says what the first call is for: a conversation about your systems and the one or two problems that matter most, and a clearer picture whether or not you hire us.
- **No urgency theatre.** No countdowns, "limited spots", or "don't miss out".

### Layered voices (base, campaign, character)

The voice is a stack of three layers, so one site can carry a steady house voice, time-boxed campaigns, and recurring staff characters on the news desk (`/news/`). The mechanism is site-neutral: another site reuses it by copying this section and [`_data/characters.yml`](../../_data/characters.yml) (schema `characters/v1`).

| Layer | Defined in | Selected by | Scope |
|---|---|---|---|
| **Base** | This section ("The voice in one paragraph" through "Calls to action") | Always on | Every page and post |
| **Campaign overlay** | `campaigns:` in `_data/characters.yml` | Front matter `campaign: <id>` | A series of pieces, e.g. `ledger-is-a-codebase` |
| **Character** | `characters:` in `_data/characters.yml`, plus a matching byline entry in `_data/authors.yml` | Front matter `voice: <id>` and `author: "<name>"` | One piece, written by one news-desk persona |

**Precedence.** For style (vocabulary additions, rhythm, concerns, signature moves) the most specific layer wins: character over campaign over base. A post may select at most one campaign and one character. Pages under `pages/_services/`, `pages/_toolkit/`, `index.md`, `about.md`, and `contact.md` always speak in the base voice; characters write only in `pages/_posts/` (the news sections).

**Non-overridable at every layer.** No layer may relax any of these:

1. No invented statistics, client names, client outcomes, logos, certifications, or awards.
2. The banned phrases in `content-style.instructions.md` and every `scripts/content_lint.py` gate (front matter, description length, sentence-case headings, one paragraph per source line).
3. The CTA rules: one CTA, worded **Book a free consultation**, linking to `/contact/`.
4. **The honesty rule.** Every character is an **AI-voiced persona**. Its `role` says so, its byline bio carries its `disclosure` line verbatim, and every piece it writes opens with that line in italics. A character is never presented as a real person, employee, client, or credentialed professional, never claims a certification or employer, and never quotes a "customer". Pieces are drafted with AI and approved by a named human (Amr Abdel-Motaleb) before publishing.

**Front matter example.**

```yaml
author: "Ines Calder"            # byline; must match _data/authors.yml and characters.yml
voice: security-officer          # character id
campaign: ledger-is-a-codebase   # optional campaign id
```

The full news-desk concept, the first character (Ines Calder, security desk), sample paragraphs in her voice, and the in-character drafting stretch goal are in [`docs/news-desk.md`](../../docs/news-desk.md).

### Before and after

| Before | After |
|---|---|
| Helping small businesses navigate through the world of IT disarray | Your books already run like software. We help you own the systems around them. |
| If you are a small or medium-sized business looking to adopt enterprise-grade technology, streamline operations, and compete more effectively, we would like to help. | If month-end runs on a workbook only one person understands, or your systems no longer agree with the general ledger, start here. The first call is free and covers your systems and the one or two problems that matter most. |
| We provide cost-effective IT architecture tailored to each business. | Good decisions need numbers that tie out. We design the architecture so they do. |
| AI can transform your back office. | AI drafts; a person approves; the audit trail records both — the same maker-checker control your finance team already runs. |

### Hard rules that did not change

- **We are a practitioner, not a platform.** Write from experience, never from hype. No "revolutionary", "cutting-edge", "world-class".
- **Finance + IT is the differentiator.** Speak both languages; that dual fluency is the brand's edge.
- **Never claim** certifications, headcount, client logos, revenue, or awards. Describe *categories* of work and what compliance frameworks *require*; never claim BASH is certified. Never invent statistics or client outcomes.
- **Banned phrases, front-matter gates, and formatting** stay as defined in `content-style.instructions.md`, `posts.instructions.md`, `services.instructions.md`, and `scripts/content_lint.py`.

## Visual identity

The theme (`bamr87/zer0-mistakes`, skin **`aqua`**) carries typography and layout — do not override it mid-page. The brand-specific assets and values:

### Logo

- Canonical mark: [`assets/brand/favicon.svg`](../../assets/brand/favicon.svg) (masthead + favicon).
- Logo library: [`assets/brand/logo/`](../../assets/brand/logo/) — the **B** mark and full BASH
  wordmark in versioned variants. Prefer the latest `v2` files.
- Standards (sizes, clear space, layouts): [`assets/brand/logo-standards.txt`](../../assets/brand/logo-standards.txt).
- Never stretch, recolor, or add effects to the mark. On busy imagery, use the mark on a solid chip.

### Color

The **logo palette** is the brand's identity color set; the **theme palette** carries the UI. Keep them distinct — do not repaint the UI in logo colors or vice versa.

| Role | Name | Hex |
|---|---|---|
| Logo — primary | Red | `#a11111` |
| Logo — accent | Yellow | `#ffe900` |
| Logo — deep | Teal | `#376986` |
| UI — primary (theme) | Blue | `#007bff` |
| UI — muted (theme) | Secondary gray | `#6c757d` |

Full UI ramp lives in `_config.yml` under `theme_color:` (hex values **must** stay quoted — an unquoted `#` starts a YAML comment and parses to null). The logo palette is mirrored in [`assets/brand/color_scheme`](../../assets/brand/color_scheme).

### Imagery

- Article and page banners are **AI-generated** from each piece's own title and description by the
preview pipeline (`scripts/generate-preview-images.sh`), then stored under `assets/images/previews/`. Regenerate after a title changes — the image derives from it.
- **Two banner looks, split by audience.** Blog posts keep the retro pixel-art style, where the `bash` motif plays. The services, toolkit, and about sections, which a buyer reads before hiring us, use a professional IT look: isometric systems, blueprints, and consoles in teal and slate navy with one crimson accent, and no people. Both are set in `preview_images` in `_config.yml` (`collection_styles` for the sections); see `docs/preview-images.md`.
- Alt text describes the *content* of an image, never "banner" or "screenshot of…".
- Prefer SVG for diagrams, PNG for screenshots. Diagrams (Mermaid) inherit theme colors.

## Where the brand lives (practice what we preach)

The brand is a set of files, not a memory. Change it in one place and everything inherits the change:

| Brand element | File of record |
|---|---|
| Name, mission, voice, doctrine (this doc) | `.github/instructions/brand.instructions.md` |
| Editorial mechanics | `.github/instructions/content-style.instructions.md` |
| Identity + positioning strings, `powered_by`, socials | `_config.yml` |
| Logo + favicon + palette assets | `assets/brand/` |
| Section voice profiles | `_data/taxonomy.yml` |
| Public statement of the operating model | `ai-operations.md`, `pages/_toolkit/` |

**Before shipping identity-bearing work,** run the `brand-guardian` agent or `/brand-check`. It reads this file and reports drift.
