# Agent Guidelines for Reloaded Templates Rust

## Repository Structure
- `templates/library/` - Rust library template with documentation
- `docs/` - MkDocs documentation site with assets and pages
- `mkdocs.yml` - Main MkDocs configuration

## Documentation Commands
- `mkdocs build --strict` - Check build errors
- NEVER run blocking commands like `mkdocs serve`
- ALWAYS delete `dist/` folder immediately after running `mkdocs build --strict`

## MkDocs Material Admonitions
Use admonitions for highlighting: `!!! tip`, `!!! warning`, `!!! info`, `!!! example`. Available types: note, abstract, info, tip, success, question, warning, failure, danger, bug, example, quote. Use `???` for collapsible blocks.

## Visual Documentation
Include screenshots for better content digestion.

```markdown
![Image title](path/to/image.png)
/// caption
Image caption here
///
```