# {{project-name}}

[![Crates.io](https://img.shields.io/crates/v/{{project-name}}.svg)](https://crates.io/crates/{{project-name}})
[![Docs.rs](https://docs.rs/{{project-name}}/badge.svg)](https://docs.rs/{{project-name}})
[![CI](https://github.com/{{gh_username}}/{{gh_reponame}}/actions/workflows/rust.yml/badge.svg)](https://github.com/{{gh_username}}/{{gh_reponame}}/actions)

<!-- 
    This README is displayed on crates.io & docs.rs
    Write detailed documentation here for crate users.
-->

{{project_description}}

## Features

<!-- TODO: Replace with actual features of your crate -->

- Feature 1
- Feature 2
- Feature 3

## Installation

Add this to your `Cargo.toml`:

```toml
[dependencies]
{{project-name}} = "0.1.0"
```

{%- if std-by-default or build_with_pgo or build_c_libs %}
### Feature Flags

| Feature | Description |
| ------- | ----------- |
{%- if std-by-default %}
| `std` | Enable standard library support (disabled by default for `no_std` compatibility) |
{%- endif %}
{%- if build_with_pgo %}
| `pgo` | Enable Profile-Guided Optimization for performance tuning |
{%- endif %}
{%- if build_c_libs %}
| `c-exports` | Enable C FFI exports for C/C++ interoperability |
{%- endif %}
{%- else %}
<!-- TODO: Document any feature flags if applicable
### Feature Flags

| Feature | Description |
| ------- | ----------- |
-->
{%- endif %}

## Usage

<!-- TODO: Add comprehensive examples showing common use cases -->

### Basic Example

```rust
// TODO: Add your basic example here
```

### Advanced Example

```rust
// TODO: Add a more advanced example here
```

## License

Licensed under {{license}}
