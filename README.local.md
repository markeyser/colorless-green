# The Reasoning Codex

[![GitHub Pages Deploy](https://github.com/markeyser/the-reasoning-codex/actions/workflows/ci.yml/badge.svg)](https://github.com/markeyser/the-reasoning-codex/actions/workflows/ci.yml)
[![Content License: CC BY 4.0](https://img.shields.io/badge/Content-CC%20BY%204.0-blue.svg)](http://creativecommons.org/licenses/by/4.0/)
[![Repo License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**A public portfolio and collection of expert playbooks on building reliable, specialized, and grounded AI systems.**

This repository contains the source for the published content. The code for the projects and experiments discussed here is hosted in separate, dedicated repositories linked within the playbooks.

## **[➡️ Visit the Live Site: The Reasoning Codex](https://markeyser.github.io/the-reasoning-codex/)**

---

## 🏛️ Core Philosophy

This portfolio explores a central thesis: that the path to robust, high-performance AI lies not in the brute force of massive, generalist models, but in the precision and efficiency of smaller, open-source models that are expertly fine-tuned to the data and the task at hand.

The playbooks focus on a rigorous, three-phase methodology for model specialization:

1. **Domain Adaptation** (e.g., DAPT/CPT)
2. **Task Specialization** (e.g., SFT)
3. **Behavioral Alignment** (e.g., RLFT)

---

## 📚 Published Playbooks

- **[From Zero-Shot to Expert: A Deep Dive into Retrieval Domain Adaptation](https://markeyser.github.io/the-reasoning-codex/01-retrieval-course/00-01-index.md)**
  
  *A graduate-level playbook on building and fine-tuning state-of-the-art retrieval systems, covering modern architectures (BM25, SPLADE, ColBERT) and the advanced DAPT → SFT workflow.*

- **[Training the Agent: A Deep Dive into Policy Optimization with RLFT](https://markeyser.github.io/the-reasoning-codex/02-agentic-reasoning-course/index.md)** - *Coming Soon*

  *An advanced playbook on moving beyond prompt engineering to train autonomous AI agents using the CPT → SFT → RLFT stack and methods like GRPO.*

---

## 🚀 Local Development

This site is built with Python, [Poetry](https://python-poetry.org/), and [MkDocs](https://www.mkdocs.org/) with the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme. To run the site locally:

1. `git clone https://github.com/markeyser/the-reasoning-codex.git`
2. `cd the-reasoning-codex`
3. `poetry install`
4. `poetry shell`
5. `mkdocs serve`

The site will be available at `http://127.0.0.1:8000` with live reloading.

---

## ⚖️ Licensing

The structural code of this repository (e.g., `mkdocs.yml`, workflows) is licensed under the **MIT License**.

All written content and diagrams within the `docs/` directory are licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0) License**.
