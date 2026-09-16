# Preview image pipeline

How the AI-generated banner images for posts and section pages work, and the rules that keep frontmatter, filenames, and the generator in sync.

## The facts

| Item | Value |
|---|---|
| Generator | `scripts/features/generate-preview-images` (wrapper: `scripts/generate-preview-images.sh`) |
| Engine (zer0 stack) | The `zer0-image-generator` gem in the root `Gemfile` — `bundle exec jekyll preview-images --list-missing` inside the dev container reports what lacks a banner, from the same `preview_images` block. It replaced the vendored `_plugins/preview_image_generator.rb`, whose Liquid filters and tags nothing rendered |
| Provider / model | OpenAI `gpt-image-2` by default (configured in the `preview_images` block of `_config.yml`; DALL-E 3 is retired on this account). **xAI Grok Imagine** (`grok-imagine-image-2.0`) is the second option, on a Grok OAuth token — see below |
| Size / quality | `1536x1024` landscape, `high` |
| Style | Two looks. **Posts:** retro pixel art, 8-bit video game aesthetic (`style` + `style_modifiers`). **Services, toolkit, about:** a professional IT look — isometric enterprise systems, technical blueprints, and operations consoles in teal and slate navy with one crimson accent, no people (`collection_styles`). The `preview_images` block in `_config.yml` is the single source of truth for both |
| Output directory | `assets/images/previews/` |
| API key | `OPENAI_API_KEY`, loaded from `.env` at the repo root (never committed). The xAI option needs no key in this repo: it reads the Grok OAuth token Kilo Code already stores |
| Cost | Roughly $0.15–0.20 per image at current pricing — cheap for one post, real money for a `--force` run across the whole site |

## Filename rule

The image filename is derived from the post's `title:`, not its file path:

1. Lowercase the title.
2. Replace every run of non-alphanumeric characters with a single `-`.
3. Strip leading and trailing `-`.
4. Truncate to 50 characters (a trailing `-` left by truncation is kept).

Example: `"bashos: the new command-line operating system"` → `bashos-the-new-command-line-operating-system.png`.

The extension is the image's real format: OpenAI renders are `.png`, xAI Grok Imagine renders are `.jpg`. The generator writes whichever it saved into front matter.

Because the filename comes from the title, **changing a title orphans its image**. Regenerate previews only after titles are final, and if you retitle a published piece, regenerate (or rename) its preview in the same change.

## Frontmatter path rule

Use the short form in frontmatter:

```yaml
preview: /images/previews/<slug>.png
```

The build auto-prefixes `/assets` (the `assets_prefix` / `auto_prefix` keys in `_config.yml`), so `/images/previews/foo.png` resolves to `assets/images/previews/foo.png`. Do not write `/assets/images/previews/...` in frontmatter — both work at render time, but the short form is the house convention and what the generator writes back.

## Running the generator

```bash
# See what's missing without spending anything
./scripts/generate-preview-images.sh --dry-run
./scripts/generate-preview-images.sh --list-missing

# Generate for everything that lacks a preview
./scripts/generate-preview-images.sh --collection posts

# Regenerate one post's image after a title change
./scripts/generate-preview-images.sh --force --file pages/_posts/tech/2026-07-06-my-post.md
```

`--force` regenerates even when an image already exists — pair it with `--file` for a single post rather than running it site-wide.

The business-facing sections use the gem, because the shell script only knows the global retro style and would ignore `collection_styles`. They are not in `collections:`, so name them:

```bash
# Services, toolkit, and about pages — the professional look
bundle exec jekyll preview-images --collection toolkit --dry-run
bundle exec jekyll preview-images --collection services --force
bundle exec jekyll preview-images -f pages/_toolkit/my-new-doc.md
```

Outside the dev container, the gem's engine runs the same way as a bare script from the repo root: `python3 "$(gem contents zer0-image-generator | grep preview_generator.py)" --collection about`.

## The xAI option: Grok Imagine on a Kilo Code login

A second renderer that runs on the Grok subscription instead of OpenAI billing. Grok also writes each image prompt and reviews the render, so no Claude token is needed either. Only the gem engine has it; the shell script stays OpenAI-only. The services, toolkit, and about banners were made this way.

```bash
KILO_AUTH_PATH="$HOME/.local/share/kilo/auth.json" XAI_AUTH=oauth \
  bundle exec jekyll preview-images --collection toolkit -j 6 \
  --provider xai --model grok-imagine-image-2.0 --prompt-engine xai --review xai
```

- **Credential.** The engine reads the Grok OAuth token from Kilo Code's store (`KILO_AUTH_PATH`; the default path is already on its search list). `XAI_OAUTH_TOKEN` or `~/.grok/auth.json` work too, and `XAI_API_KEY` is the paid fallback. `XAI_AUTH=oauth` pins the subscription token so a stale login fails loudly instead of billing the key.
- **Expiry.** Kilo's access token is short-lived. When it has expired, the engine refreshes it at `auth.x.ai` with the refresh token Kilo saved and writes the new pair back into Kilo's store, so Kilo keeps working too. Only a failed refresh (`invalid_grant`) means signing in to Grok in Kilo Code again.
- **One run at a time.** Parallel workers inside one run share a single refresh. Two runs started side by side can each refresh, and the second can spend a refresh token the first just rotated. Run collections one after another and use `-j` for speed.
- **Output.** Imagine answers JPEG at 1248×832 (3:2), about 200 KB. The file is saved as `<slug>.jpg`.
- **Engine version.** Kilo's store and Grok art direction need zer0-image-generator PR #23. The token refresh, the 3:2 shape, `.jpg` naming, and the Cloudflare-safe `User-Agent` are on the `feat/xai-imagine-kilo-refresh` branch on top of it. None of that is in the published gem (0.6.0) yet. Until it is, run that checkout's engine directly: `python3 ../zer0-image-generator/lib/zer0_image_generator/preview_generator.py` with the same flags.
- **Settings that carry over.** `collection_styles`, `size` (sent as the nearest Imagine aspect ratio, so `1536x1024` becomes `3:2`), and the front-matter path rules apply unchanged. The `gpt-image-2` model and `quality` do not; the `--model` flag replaces them for the run.

## House rule: the final review pass

The last polish pass over any content batch is always run by the strongest available model at the top level (currently Opus-class) — not delegated to a subagent. That pass confirms titles are final *before* previews are generated, and checks that no reader-facing text names a piece's creative device. Order of operations: write → review → finalize titles → generate previews.
