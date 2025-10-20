# Welcome to The Reasoning Codex

This portfolio is built on a single, powerful thesis: **The future of deployed AI is not in creating a single, god-like generalist model, but in forging an army of smaller, highly-specialized, and fine-tuned experts.**

While frontier models demonstrate breathtaking general capabilities, they fail at the critical "last mile" where real-world value is created: in the nuanced, jargon-filled, and task-specific data of individual domains and organizations. This codex is a collection of playbooks dedicated to the science and engineering of creating these specialist models.

Our approach is founded on three core tenets:

1. **The Primacy of Domain Knowledge (DAPT/CPT):** We believe that true "understanding" begins with learning the language of the domain. The unsupervised pre-training phase is the **foundational, non-negotiable step** to give a model a genuine, grounded understanding of a domain's unique vocabulary and implicit ontology.

2. **The Power of Task Specialization (SFT):** We believe that high performance comes from focus. The goal is not to create a model that is mediocre at a hundred different tasks, but to create a model that is **state-of-the-art at the *one task* that matters.** Supervised Fine-Tuning is the crucible where this specialization happens.

3. **The Necessity of Behavioral Alignment (RL):** We believe that a correct answer is not enough; the answer must be useful, safe, and aligned with the desired final behavior. For generative models and AI agents, the final training phase is where we move beyond simple prediction and shape the model's output to be a reliable and trustworthy custom solution.

**Our Bet:** We are making a deliberate and explicit bet against the paradigm of universal, multi-task generalism. We believe that the path to robust, reliable, and high-performance AI lies not in the brute force of a single, massive model, but in the **precision, efficiency, and deep specialization of smaller, open-source models that are expertly and scientifically fine-tuned to the data and the task at hand.**

This is the philosophy of the scalpel over the sledgehammer. It is the philosophy of engineering and science over raw scale. This is the path to building AI that works.

## Available Courses

- **[From Zero-Shot to Expert: A Deep Dive into Retrieval Domain Adaptation](01-retrieval-course/00-01-index.md)**
  
  *A comprehensive course on building and fine-tuning state-of-the-art retrieval systems for specialized domains. This playbook covers the entire journey, from foundational IR theory and a deep dive into modern architectures (BM25, SPLADE, ColBERT), to the advanced, two-phase training workflow (DAPT → SFT) required to transform a generalist model into a high-performance domain expert.*

- **[Training the Agent: A Deep Dive into Policy Optimization with RLFT](02-agentic-reasoning-course/index.md)** - *Coming Soon*

  *Move beyond brittle prompt engineering and learn to build truly autonomous AI systems. This advanced playbook provides a deep dive into the state-of-the-art **CPT → SFT → RLFT** training stack, powered by efficient reinforcement learning methods like **GRPO**. You will learn the mechanics of fine-tuning smaller, open-source language models to act as decision-making policies, teaching them *how to behave*: when to retrieve, which tools to use, and critically, when to stop or abstain. The result is a methodology for building highly accurate, efficient, and auditable AI agents that demonstrably outperform prompting generalist models for specialized, real-world tasks—all on commercially accessible hardware.*
