# The Reasoning Codex

[![GitHub Pages Deploy](https://github.com/markeyser/the-reasoning-codex/actions/workflows/ci.yml/badge.svg)](https://github.com/markeyser/the-reasoning-codex/actions/workflows/ci.yml)
[![Content License: CC BY 4.0](https://img.shields.io/badge/Content-CC%20BY%204.0-blue.svg)](http://creativecommons.org/licenses/by/4.0/)
[![Repo License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**A public portfolio and collection of playbooks on building reliable, specialized, and grounded AI systems.**

This repository is a central hub for my thought leadership in applied AI. It contains the source for my published courses, blog posts, and research commentary. The code for the projects and experiments discussed here is hosted in separate, dedicated repositories linked within the content.

### **[➡️ Visit the Live Site: The Reasoning Codex](https://markeyser.github.io/the-reasoning-codex/)**

---

## 🏛️ The "Specialist" Philosophy

This portfolio is built on a single, powerful thesis: **The future of deployed, high-value AI is not in creating a single, generalist model, but in forging an army of smaller, highly-specialized, and fine-tuned experts.**

While frontier models are powerful, they fail at the critical "last mile" where real-world value is created: in the nuanced, jargon-filled, and task-specific data of individual domains. This codex is a collection of playbooks dedicated to the science and engineering of creating these specialist models, based on a rigorous, three-phase methodology:

1.  **Domain Adaptation (DAPT/CPT):** Teaching the model the language of the domain.
2.  **Task Specialization (SFT):** Teaching the model to perform a specific task with high precision.
3.  **Behavioral Alignment (RL):** Shaping the model's output to be reliable, safe, and aligned with desired outcomes.

This is a portfolio for practitioners who believe that the path to robust and reliable AI lies in the precision and efficiency of expertly fine-tuned, open-source models. It is a signal for—and a filter for—like-minded professionals.

---

## 🚀 Local Development

This site is built with Python, [Poetry](https://python-poetry.org/), and [MkDocs](https://www.mkdocs.org/) with the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme. To run the site locally:

1.  `git clone https://github.com/markeyser/the-reasoning-codex.git`
2.  `cd the-reasoning-codex`
3.  `poetry install`
4.  `poetry shell`
5.  `mkdocs serve`

---

## ⚖️ Licensing

The structural code of this repository (e.g., `mkdocs.yml`, workflows) is licensed under the **MIT License**.

All written content and diagrams within the `docs/` directory are licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0) License**.