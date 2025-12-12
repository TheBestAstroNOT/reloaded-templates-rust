# {{project-name}}-cli

[![Crates.io](https://img.shields.io/crates/v/{{project-name}}-cli.svg)](https://crates.io/crates/{{project-name}}-cli)
[![Docs.rs](https://docs.rs/{{project-name}}-cli/badge.svg)](https://docs.rs/{{project-name}}-cli)
[![CI](https://github.com/{{gh_username}}/{{gh_reponame}}/actions/workflows/rust.yml/badge.svg)](https://github.com/{{gh_username}}/{{gh_reponame}}/actions)

Command-line interface for [{{project-name}}](../{{project-name}}/README.MD).

<!-- 
    This README is displayed on crates.io & docs.rs
    Write detailed documentation here for users.
-->

{%- if mkdocs %}
For additional documentation, visit our [documentation][docs].
{%- endif %}

## Installation

```bash
cargo install {{project-name}}-cli
```

Or build from source:

```bash
cargo build --release -p {{project-name}}-cli
```

## Usage

<!-- TODO: Add CLI usage examples -->

```bash
{{project-name}}-cli --help
```

## License

Licensed under {{license}}

{%- if mkdocs %}
[docs]: https://{{gh_reponame}}.github.io/{{gh_reponame}}
{%- endif %}
