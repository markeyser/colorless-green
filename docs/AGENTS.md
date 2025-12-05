# AGENTS.md (docs/)

## Mermaid diagrams via MCP (chart selection + validation)

When adding or editing Mermaid diagrams anywhere under `docs/`, follow this fixed workflow so diagrams stay accurate and render inside MkDocs.

### 1. Pick the correct diagram type with the docs MCP server

- Decide which diagram type (flowchart, sequence, class/ER, state, gantt/timeline) best fits the user request and document context.
- When unsure about syntax or features, call `mermaid-doc-mcp-server.get_diagram_doc("<diagram_type>")` for your own reference. Use the examples there to pick the constructs you need; do not paste the full docs unless explicitly asked.

### 2. Draft the diagram based on those docs

- Follow the syntax straight from the documentation.
- Project rule: wrap any label containing parentheses in quotes (e.g. `A["Encode (query)"]`) to keep Mermaid happy.
- Keep diagrams narrowly scoped to avoid blowing the context window.

### 3. Validate every diagram with the Mermaid validator MCP server

- Run `mermaid-validator.validateMermaid` on the complete diagram string before changing the Markdown file.
- If the validator reports an error, read the message, fix the syntax (consult the docs again if needed), and rerun the validator. Repeat until it says **“Mermaid diagram is valid.”**
- Never leave an invalid diagram in the docs.

### 4. Insert only the validated diagram and caption

- Add the final diagram as a fenced block:

  ````markdown
  ```mermaid
  flowchart LR
    ...
  ```
  ````

- Immediately follow with a `_Figure:_` line that explains what the diagram shows and why it matters in this section.

### 5. Keep doc usage tight

- Only pull the specific syntax rules you need from `get_diagram_doc`; summarise briefly if the user requests it.
- Do not dump large chunks of Mermaid documentation into Markdown by default.
