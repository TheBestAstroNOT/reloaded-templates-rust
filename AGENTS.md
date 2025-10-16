# Agent Guidelines for Reloaded Templates Rust

## Repository Context
This repository provides opinionated Rust project generators for libraries and binaries using cargo-generate. It's used by Sewer's Projects and the Reloaded-III framework for cross-platform Rust library and mod development.

## Repository Structure
- `templates/library/` - Rust library template with documentation
- `templates/reloaded3/` - Reloaded-III mod template
- `docs/` - MkDocs documentation site with assets and pages
- `mkdocs.yml` - Main MkDocs configuration

## Documentation Commands
- `mkdocs build --strict` - Check build errors
- NEVER run blocking commands like `mkdocs serve`
- ALWAYS delete `dist/` folder immediately after running `mkdocs build --strict`

## MkDocs Material Admonitions
Use admonitions for highlighting: `!!! tip`, `!!! warning`, `!!! info`, `!!! example`. Available types: note, abstract, info, tip, success, question, warning, failure, danger, bug, example, quote. Use `???` for collapsible blocks.

Admonitions can have inline text in the header:
```markdown
!!! tip "Custom Title"
    Content here
```

## MkDocs Material Annotations
Use annotations for inline tooltips that expand on click or focus:
```markdown
Text with annotation (1)
{ .annotate }

1.  This is the annotation content that appears in a tooltip.
```

For lists, due to a limitation of Python Markdown, you need to wrap the list in a div:
```markdown
<div class="annotate" markdown>

1. get groceries
2. bake a cake
3. enjoy (1)

</div>

1. when possible
```

Annotations can be used in lists, paragraphs, and other content by adding the `annotate` class to the containing block.

## Visual Documentation
Include screenshots for better content digestion.

```markdown
![Image title](path/to/image.png)
/// caption
Image caption here
///
```

## Target Audience

The documentation should be accessible to both regular Rust developers and people new to coding (not just Rust). Avoid jargon, use images, and explain concepts clearly. Prioritise sections in order of importance to new users- e.g. a user would want to know how to build and run a project before understanding formatting, linting, coverage, etc.