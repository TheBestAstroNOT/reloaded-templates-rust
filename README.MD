# Reloaded Rust Templates

Opinionated [Rust](https://www.rust-lang.org/) project generators for libraries and binaries using [cargo-generate](https://github.com/cargo-generate/cargo-generate).

Used by [Sewer's Projects](https://sewer56.dev) and the [Reloaded-III](https://reloaded-project.github.io/Reloaded-III/) framework.

## 📖 Documentation

For complete documentation, getting started guides, and contribution guidelines, visit our documentation site:

**[📚 View Documentation](https://reloaded-project.github.io/reloaded-templates-rust/)**

## 🚀 Quick Start

```bash
# Install cargo-generate
cargo install cargo-generate

# Create a new project from template
cargo generate --git https://github.com/Reloaded-Project/reloaded-templates-rust.git
```

The above command requires user input. For avoiding user input (important for automated usage), try something like:

```bash
cargo generate \
  --git https://github.com/Reloaded-Project/reloaded-templates-rust.git \
  templates/general \
  --name my-project \
  --destination . \
  --define gh_username=YourUsername \
  --define gh_reponame=my-project \
  --define "project_description=A brief description of your project" \
  --define mkdocs=false \
  --define vscode=true \
  --define xplat=false \
  --define wine=false \
  --define bench=false \
  --define miri=false \
  --define fuzz=false \
  --define build_c_libs=false \
  --define build_cli=false \
  --define publish_crate_on_tag=true \
  --define license=MIT \
  --define no_std_support=STD
```

> **Note:** The `--destination` folder must already exist; it will not be auto-created.

## 📋 Available Templates

- **`general`**: Rust libraries, web servers, and binary/executable projects
- **`reloaded3`**: Reloaded-III mods written in Rust (~~2024~~, ~~2025~~, god knows)

## 📄 License

This repository is licensed under the [MIT License](./LICENSE-MIT). Note that most Reloaded components themselves are licensed LGPL or GPLv3.