# The Reasoning Codex

[![GitHub Pages Deploy](https://github.com/markeyser/the-reasoning-codex/actions/workflows/ci.yml/badge.svg)](https://github.com/markeyser/the-reasoning-codex/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

**A collection of open-source playbooks on building reliable, specialized, and grounded AI systems.**

## 🏛️ The Manifesto

This portfolio is built on a single, powerful thesis: **The future of deployed AI is not in creating a single, god-like generalist model, but in forging an army of smaller, highly-specialized, and fine-tuned experts.**

While frontier models demonstrate breathtaking general capabilities, they fail at the critical "last mile" where real-world value is created: in the nuanced, jargon-filled, and task-specific data of individual domains and organizations. This codex is a collection of playbooks dedicated to the science and engineering of creating these specialist models.

Our approach is founded on three core tenets:

1. **The Primacy of Domain Knowledge (DAPT/CPT):** True "understanding" begins with learning the language of the domain. The unsupervised pre-training phase is the **foundational, non-negotiable step** to give a model a genuine, grounded understanding of a domain's unique vocabulary and implicit ontology.
2. **The Power of Task Specialization (SFT):** High performance comes from focus. The goal is not to create a model that is mediocre at a hundred different tasks, but to create a model that is **state-of-the-art at the *one task* that matters.** Supervised Fine-Tuning is the crucible where this specialization happens.
3. **The Necessity of Behavioral Alignment (RL):** A correct answer is not enough; the answer must be useful, safe, and aligned with the desired final behavior. The final training phase (e.g., Reinforcement Learning) is where we shape a model's output to be a reliable and trustworthy custom solution.

We believe that the path to robust, reliable, and high-performance AI lies not in the brute force of a single, massive model, but in the **precision, efficiency, and deep specialization of smaller, open-source models that are expertly and scientifically fine-tuned to the data and the task at hand.**

## 📚 Published Courses

This repository contains the source code for a series of technical training courses published online.

### **[➡️ Visit the Live Site: The Reasoning Codex](https://markeyser.github.io/the-reasoning-codex/)**

The live site is built and deployed automatically from the Markdown files in the `/docs` directory of this repository using MkDocs with the Material theme and GitHub Pages.

#### Current Courses

- **[From Zero-Shot to Expert: A Deep Dive into Retrieval Domain Adaptation](https://markeyser.github.io/the-reasoning-codex/01-retrieval-course/00-01-index/)**
  *A comprehensive, graduate-level course on building and fine-tuning state-of-the-art retrieval systems for specialized domains. This playbook covers the entire journey, from foundational IR theory and a deep dive into modern architectures (BM25, SPLADE, ColBERT), to the advanced, two-phase training workflow (DAPT → SFT) required to transform a generalist model into a high-performance domain expert.*

- **Training the Agent: A Deep Dive into Policy Optimization with RLFT** - *Coming Soon...*

## 🚀 Local Development

This site is built with Python, [Poetry](https://python-poetry.org/), and [MkDocs](https://www.mkdocs.org/) with the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme.

To run the site locally:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/markeyser/the-reasoning-codex.git
   cd the-reasoning-codex
   ```

2. **Install dependencies with Poetry:**

   ```bash
   # Ensure you have Poetry installed
   poetry install
   ```

3. **Activate the virtual environment:**

   ```bash
   poetry shell
   ```

4. **Serve the site:**

   ```bash
   mkdocs serve
   ```

The site will now be available at `http://127.0.0.1:8000` with live reloading.

## ⚖️ License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
