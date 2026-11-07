# `drafts/x/` — the approval queue for X

A staging area, not an outbox. Each `*.md` at the top level of this folder is one proposed post for the BASH X account (`@bamr87`), waiting on a person.

This queue is the optional GitHub automation. The account is connected and managed in zer0-CMS's studio, which can compose, approve and publish without it; both share `.github/x-log.json`, so nothing goes out twice.

The gate is the LinkedIn queue's (`drafts/linkedin/README.md`): a draft is written here at `status: pending` — by `scripts/x.sh draft`, or by hand — and lands in a pull request. A person edits it and **merges** it; the merge is the approval. `.github/workflows/x-publish.yml` then runs zer0-CMS's X lane live: it checks the token is `@bamr87`'s, posts the draft, records it in `.github/x-log.json`, and sets the draft to `status: published` with its `post_id`.

What a post is: the body, then the page's URL on a line of its own (unless the body already has it). X draws the link card from the page's own card tags, so there is no image to pick. The whole post must fit X's 280 characters as X counts them — a link counts 23 — and the preview says how many it uses.

What keeps a stray file from publishing:

- only `pending` and `approved` drafts publish (`zer0.json` → `distribution.x.acceptStatuses`), and `pending` only as a merged draft in the workflow on `main`; a `published` one never publishes again;
- a token for any account other than `@bamr87` is refused before anything is sent;
- an attempt X did not confirm is marked `unconfirmed` in the ledger, and no run sends that draft again until a person checks the account (`scripts/x.sh record DRAFT ID`, the digits of `x.com/…/status/ID`);
- only top-level files are read, so `examples/` never publishes, and a file with no front matter (this README) is not a draft;
- a page already in the X ledger is not posted twice — one shared on LinkedIn still can be, since each network keeps its own ledger;
- an error from the brand guard (a banned phrase, a post over 280 characters) blocks the post.

Preview the exact post, its length, the guard's findings and every gate, with no network call:

```bash
scripts/x.sh preview
```

X bills each request: a post carrying a link costs more than one without, so the lane posts only drafts a person merged. The lane, its gates and its settings: zer0-CMS `docs/DISTRIBUTION.md` § X.
