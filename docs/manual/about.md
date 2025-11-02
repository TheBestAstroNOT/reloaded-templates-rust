# About Template Manual v1

This manual provides workflow-oriented "How To" guidance for common development tasks. Each section is concise and links to detailed feature documentation pages for comprehensive information.

## Manual Structure

This manual is organized into four sections that follow a typical development workflow:

1. **Getting Started** - Build, run, and debug your project
2. **Development Workflow** - Test, check coverage, verify code safety, and use GitHub workflows
3. **Performance & Optimization** - Benchmark, profile, and optimize with PGO
4. **Cross-Platform & Bindings** - Build for other platforms and create bindings for other languages

Content is filtered based on your selected features. When you view the manual, only relevant sections appear based on the features you chose during project generation.

!!! tip "Detailed Documentation"

    Each manual section provides quick "How To" steps. For comprehensive explanations, architecture details, and troubleshooting, see the linked feature documentation pages.

## Interactive Filtering

The manual supports **URL-based filtering** to show only the sections relevant to your project setup. This allows you to test different feature combinations and see exactly what documentation applies to your configuration.

### Supported Features

The following feature toggles control what appears in the manual:

- **`bench`** - Benchmarking and profiling tools
- **`pgo`** - Profile Guided Optimization
- **`xplat`** - Cross-platform compilation
- **`c-bindings`** - C/C++ bindings generation
- **`csharp-bindings`** - C# bindings generation
- **`mkdocs`** - Documentation development workflow
- **`contributing`** - Contributing guidelines

### Try It Out

Click any link below to see how the manual changes with different feature combinations:

**Individual Features:**

- [Only Benchmarking](guide.md?bench=true)
- [Only PGO](guide.md?pgo=true)
- [Only Cross-Platform](guide.md?xplat=true)
- [Only C/C++ Bindings](guide.md?c-bindings=true)
- [Only C# Bindings](guide.md?csharp-bindings=true)
- [Only MkDocs](guide.md?mkdocs=true)
- [Only Contributing](guide.md?contributing=true)
- [Hide Contributing](guide.md?bench=true&pgo=true&xplat=true&c-bindings=true&csharp-bindings=true) — Shows all features except contributing

**Popular Combinations:**

- [Performance Bundle](guide.md?bench=true&pgo=true) — Benchmarking + PGO
- [Cross-Platform Bundle](guide.md?xplat=true&c-bindings=true&csharp-bindings=true) — All cross-platform tools and bindings
- [Everything](guide.md?bench=true&pgo=true&xplat=true&c-bindings=true&csharp-bindings=true&contributing=true) — All features enabled
- [View All Features](guide.md) — No filtering (all features shown)

### URL Template Format

Build custom filter URLs using this pattern:

```
guide.md?feature1=true&feature2=true&feature3=true
```

**Examples:**

```
guide.md?bench=true&xplat=true
guide.md?pgo=true&c-bindings=true&csharp-bindings=true
```

!!! info "Experiment Safely"

    Try different feature combinations to understand how the manual content changes based on your project configuration. This is a great way to explore which features are relevant to your workflow before generating a new project.
