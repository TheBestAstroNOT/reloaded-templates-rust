# {{project-name}}

{{project_description}}

# Project Structure

- `{{project-name}}/` - Main library crate
  - `src/` - Library source code
{%- if build_c_libs %}
  - `src/exports.rs` - C FFI exports
{%- endif %}
{%- if bench %}
  - `benches/` - Benchmarks
{%- endif %}
{%- if build_cli %}
- `cli/` - CLI executable wrapper
{%- endif %}
{%- if fuzz %}
- `fuzz/` - Fuzz testing targets
{%- endif %}
{%- if build_csharp_libs %}
- `bindings/csharp/` - C# bindings
{%- endif %}

# Code Guidelines

- Optimize for performance; use zero-cost abstractions, avoid allocations.
- Keep modules under 500 lines (excluding tests); split if larger.
- Place `use` inside functions only for `#[cfg]` conditional compilation.
{%- if no-std-by-default or std-by-default %}
- Prefer `core` over `std` where possible (`core::mem` over `std::mem`).
{%- endif %}

# Documentation Standards

- Document public items with `///`
- Add examples in docs where helpful
- Use `//!` for module-level docs
- Focus comments on "why" not "what"
- Use [`TypeName`] rustdoc links, not backticks.

# Post-Change Verification

```bash
cargo build --workspace --all-features --all-targets --quiet
cargo test --workspace --all-features --quiet
cargo clippy --workspace --all-features --quiet -- -D warnings
cargo doc --workspace --all-features --quiet
cargo fmt --all --quiet
cargo publish --dry-run --quiet
```

All must pass before submitting.
