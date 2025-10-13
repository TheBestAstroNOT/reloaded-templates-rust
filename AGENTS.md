# Agent Guidelines for Reloaded Templates Rust

## Repository Structure
- `templates/library/` - Rust library template with documentation
- `docs/` - MkDocs documentation site with assets and pages
- `mkdocs.yml` - Main MkDocs configuration

## Documentation Commands
- `mkdocs build --strict` - Check build errors
- NEVER run blocking commands like `mkdocs serve`
- ALWAYS delete `dist/` folder immediately after running `mkdocs build --strict`