---
applyTo: "_includes/**,_layouts/**,_sass/**,_data/**,_plugins/**,_config*.yml,Gemfile,Gemfile.azure"
description: "Local override conventions for the jekyll-theme-zer0 remote theme — what to override, what to leave alone"
date: 2026-05-18T12:00:00.000Z
lastmod: 2026-05-18T12:00:00.000Z
---

# Jekyll Theme Override Instructions

The site uses `jekyll-theme-zer0` as a **remote theme** (declared in `_config.yml`). Local files in `_includes/`, `_layouts/`, `_sass/`, `_data/`, and `_plugins/` **override** the corresponding theme files at build time.

## Override rules

1. **Match the theme's file path exactly** to override a single file (e.g. override `_includes/header.html` by creating one with the same name locally).
2. **Don't fork the whole theme locally.** Only commit files you've actually changed. Empty/identical overrides cause drift.
3. **Don't modify the theme version** in `Gemfile` without testing a full Docker build.
4. **Custom plugins** in `_plugins/` (e.g. `obsidian_links.rb`) are loaded after theme plugins; document any side effects at the top of the file.

## Config layering

The site builds with **two configs merged**:

```bash
docker-compose exec jekyll bundle exec jekyll build --config '_config.yml,_config_dev.yml'
```

- `_config.yml` — production defaults (used by GitHub Pages)
- `_config_dev.yml` — local-dev overrides only (e.g. `url`, `baseurl`, draft toggles)
- `_config.azure.yml` — Azure Static Web Apps deployment (paired with `Gemfile.azure`)

**Never** put dev-only values in `_config.yml`.

## Data files (`_data/`)

- `_data/navigation/` — site nav structure. Keep top-level items ≤ 6.
- `_data/entity/` — business entity / contact info. Single source of truth for contact details rendered across the site.
- Use YAML, not JSON, for consistency with the theme.

## Includes (`_includes/`)

- Only `contact.html` is overridden locally today. Add new includes here only when the theme's version is genuinely insufficient.
- Always test rendered output in the Jekyll dev server before commit.

## Sass / CSS

- The theme ships its own Bootstrap 5 build — do not load a second Bootstrap.
- Project-specific styles go in `_sass/` overrides; never edit `assets/css/` output files directly.

## Before commit

- [ ] `docker-compose exec jekyll bundle exec jekyll build --config '_config.yml,_config_dev.yml'` succeeds
- [ ] No stray override files identical to the theme version
- [ ] Dev-only config kept in `_config_dev.yml`
- [ ] No second Bootstrap pulled in
