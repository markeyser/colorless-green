# AGENTS.md

## Overview

Guidance for agents working on this repo. Keep diagrams consistent and avoid theming issues with MkDocs Material.

## Diagram and Asset Policy

- Do **not** use Mermaid flowcharts; render diagrams as images with a white background.
- Compress any image before committing; pre-commit blocks files >500 KB.
- MkDocs Material injects theme variables into Mermaid and forces text to `var(--md-text-color)` in dark mode, which breaks custom colors—avoid Mermaid to prevent this.
- Recommended workflow:
  - Generate the diagram in Mermaid Live Editor (or similar).
  - Export as PNG/SVG with a white background.
  - Compress the image.
  - Place it in an `assets/` directory at the same level or below the Markdown file that references it (e.g., `docs/glossary/three-pillars-of-domain-ai.md` uses `docs/glossary/assets/domain-ai-three-piplines.png`).
  - Embed via Markdown, e.g. `![Pipelines](assets/pipelines.png)`.

## Project Basics

- This is a MkDocs Material site; content lives under `docs/` and navigation is defined in `mkdocs.yml`.
- When adding a new page, update `mkdocs.yml` to include it in the nav.

## Build and Preview

- Local preview: `mkdocs serve`.
- Deployment: push to the remote GitHub repo; Pages build/updates automatically (no `mkdocs gh-deploy` needed).

## Checks and Style

- Run pre-commit locally: `pre-commit run --all-files` (ensures linting, size checks, etc.).
- Tests (if relevant): `poetry run pytest` or repo-specific test commands.
- Markdown: include alt text for images; keep headings/lists markdownlint-friendly.
- Assets: keep images <500 KB and use `assets/` alongside the referencing Markdown; prefer ASCII unless the file already uses Unicode.
