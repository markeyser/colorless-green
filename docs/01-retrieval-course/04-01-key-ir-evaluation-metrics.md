
# Key IR Evaluation Metrics

So far, we have discussed retrieval models, architectures, and the abstract concept of "relevance." But in a scientific and engineering discipline, abstract goals are not enough. To make progress, we need to be able to measure performance. While the ultimate judgment of relevance is a subjective human experience, to build better systems, we need objective, reproducible, and quantifiable metrics.

Evaluation metrics are the essential tools that transform the complex output of a retrieval system into a simple score. They allow us to move from a vague statement like "Model A feels better than Model B" to a precise, defensible conclusion like "Model A has an nDCG@10 of 0.46 while Model B's is 0.42, indicating a statistically significant improvement in ranking quality." Mastering these metrics is the first step to mastering empirical research in IR.

## **2. The Evaluation Setup: Ground Truth and Ranked Lists**

Before we can calculate any metric, we need three key ingredients. The entire evaluation process is a comparison between what your model *did* and what it *should have done*.

1. **A Query:** The input expression of the user's information need.
2. **A Ranked List:** The output of your retrieval system for that query. This is a list of document IDs, ordered from the most relevant (rank 1) to the least relevant, according to your model.
3. **Ground Truth Labels (Qrels):** This is the definitive "answer key." It is a manually curated list that specifies which documents are known to be relevant for a given query. In your project, this is the qrels_*.dedup.tsv file. It is the immovable source of truth against which your model's ranked list will be graded.

With these three components, we can now calculate the metrics that will define your project's success.

## **3. Metric 1: Recall@k**

**The Question it Answers:** *"Of all the correct answers that exist in the corpus, what fraction did our model find in its top-k results?"*

**The Intuition:**
**`Recall@k`** is a measure of the **completeness** or **thoroughness** of a search. Think of it as casting a net into the sea of documents. Recall measures how many of the "target fish" (relevant documents) you successfully caught in your net of size `k`.

In the context of a RAG pipeline, recall is arguably the most critical first-stage metric. If the correct document is not "recalled" into the initial candidate set, the rest of the pipeline (reranker, LLM generator) has zero chance of producing the right answer. The document is lost forever. A high **`Recall@k`** ensures that the foundational information needed to answer the query has been successfully retrieved.

**How it's Calculated:**
The formula is simple and intuitive. For a single query with a total of `N` known relevant documents:
$$
\mathrm{Recall}@k = \frac{\text{Number of relevant documents found in the top-}k}{N}
$$

**The Critical Limitation:**
Recall is essential, but it is blind to one crucial factor: **ranking order**. Imagine for a query there are two relevant documents, and $k=10$.

* List A: Ranks the relevant documents at **1** and **2**.
* List B: Ranks the relevant documents at **9** and **10**.

Both lists have an identical **`Recall@10`** of 1.0 (2/2). However, List A is clearly superior from a user's perspective. Recall's inability to account for ranking quality is its primary limitation and the motivation for our next metric.

## **4. Metric 2: nDCG@k (Normalized Discounted Cumulative Gain)**

**The Question it Answers:** *"How good is the *quality* of the ranking within our top-k results, rewarding models that place relevant documents higher?"*

**The Intuition (A Step-by-Step Breakdown):**
**`nDCG@k`** is the most sophisticated of the core metrics and is often considered the workhorse of IR evaluation because it considers both relevance and rank. Let's break down its name to understand its logic.

* **Cumulative Gain (CG):** This is the simplest starting point. You "walk" down your ranked list from 1 to `k`. For every relevant document you encounter, you add 1 to your score. CG is just a simple count of relevant items in the top-k, identical to the numerator in Recall.

* **Discounted Cumulative Gain (DCG):** This is the key innovation. DCG introduces the crucial concept that a relevant document is more valuable at the top of the list than at the bottom. The "gain" from finding a relevant document is "discounted" by a factor that grows with its rank. This is typically a logarithmic discount ($1/log2(rank+1)$). This means the value of a relevant document at rank 1 is $1/log2(2) = 1$, at rank 2 is $1/log2(3) ≈ 0.63$, at rank 3 is $1/log2(4) = 0.5$, and so on. The penalty for being lower-ranked is harsh at the top and softens as you go further down.

* **Normalized DCG (nDCG):** A DCG score is useful, but its raw value can vary wildly between queries (a query with 10 relevant documents will have a much higher potential DCG than a query with one). To make scores comparable, we normalize them. We calculate the **Ideal DCG (IDCG)**, which is the DCG of a perfect ranking (all relevant documents ranked at the very top). Then, we normalize our model's score: $nDCG = DCG / IDCG$. This results in a final score between 0.0 and 1.0, where 1.0 represents a perfect ranking.

**Why it Matters:**
**`nDCG@k`** provides a single, nuanced score that reflects both the completeness (like recall) and the ranking quality of a result list, making it a powerful and balanced metric for evaluating overall system performance.

## **5. Metric 3: MRR@k (Mean Reciprocal Rank)**

**The Question it Answers:** *"On average, how high up the list do we have to go to find the *first* correct answer?"*

**The Intuition:**
**`MRR@k`** is a metric of **efficiency**. It is most useful for tasks where the user's need is likely to be satisfied by a single relevant document. Think of "navigational" queries ("Google login page") or simple fact-finding ("who is the CEO of Apple"). In these cases, the user doesn't care about the full list; they care about how quickly they find the first right answer. A higher MRR score is strongly correlated with user satisfaction in such scenarios.

**How it's Calculated:**
The calculation is very straightforward.

1. For a single query, find the rank `r` of the *very first* relevant document in the list.
2. The score for that query is the **reciprocal of that rank: $1/r$**.
    * If the first relevant document is at rank 1, the score is $1/1 = 1$.
    * If it's at rank 2, the score is $1/2 = 0.5$.
    * If it's at rank 3, the score is $1/3 ≈ 0.33$.
    * ...and so on.
3. If no relevant document is found within the top `k` results, the score for that query is 0.
4. The final **`MRR@k`** is simply the mean (average) of these reciprocal rank scores across all the queries in your test set.

## **6. Conclusion: A Holistic View**

No single number can tell the full story of a system's performance. That is why we use a suite of metrics. Each one provides a different lens through which to view the results, and together they create a complete picture.

| Metric | What it Measures | When it's Most Important |
| :--- | :--- | :--- |
| **`Recall@k`** | **Completeness:** Did the model find the relevant items? | First-stage retrieval in RAG; any case where missing a relevant item is a critical failure. |
| **`nDCG@k`** | **Ranking Quality:** Did the model rank the relevant items highly? | General-purpose search; when the overall quality and order of the entire result list matter. |
| **`MRR@k`** | **Efficiency:** How quickly did the model find the *first* right answer? | Question-answering; fact-checking; any task where a single correct answer satisfies the user. |

In your project, you will use all three. A successful model must demonstrate high **`Recall@k`** (it finds the correct insurance answers), high **`nDCG@k`** (it ranks the best answers at the top), and high **`MRR@k`** (it gets to the first correct answer quickly). By analyzing these metrics together, you can build a robust and nuanced understanding of your models' behavior.
