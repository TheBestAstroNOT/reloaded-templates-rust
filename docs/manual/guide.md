# Template Manual

This guide walks you through common development tasks—from getting started to advanced optimization—with links to detailed documentation as needed.

## Prerequisites

### Install Rust

!!! tip "If you don't have Rust installed, follow the instructions for your operating system"

=== "Windows"

    Download and run the installer from [rustup.rs](https://rustup.rs/).

    Alternatively, install via Chocolatey or Scoop:

    ```powershell
    choco install rust  # Chocolatey
    scoop install rustup  # Scoop
    ```

=== "Linux & macOS"

    Run the installer script:

    ```bash
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```

### Code Editor Setup

#### VSCode

Install these recommended extensions:

- **rust-analyzer** - Rust language server for IDE features
- **Coverage Gutters** - Visualize code coverage in your editor
- **Crates** - Manage crate dependencies and versions

VSCode will prompt you to install these when you open the project, or install manually via the Extensions panel (`Ctrl+Shift+X`).

## Getting Started

### What are you editing?

#### Editing Source Code

Open the `src` folder in your code editor for source development.

**For CLI users:** All commands below assume you're in the `src` directory.

##### How to Build

**Using VSCode:**

Press `Ctrl+Shift+B` to open the build task menu. Select `rust: cargo build`.

**From Command Line:**

```bash
cd src
cargo build  # for debug builds
cargo build --release  # for optimized release builds
```

##### How to Run

**Using VSCode:**

Press `F5` or click the "Run and Debug" button to execute your project with debugging enabled.

**From Command Line:**

```bash
cd src
cargo run  # run debug build
cargo run --release  # run optimized release build
```

##### How to Debug

Install the `CodeLLDB` extension for native debugging support. Debug profiles are automatically created when the extension is installed.

![VSCode Debugging](../assets/vscode-debug.avif)
/// caption
Debugging Rust applications with CodeLLDB in VSCode
///

![Run Task](../assets/run-task.avif)
/// caption
Access tasks via Ctrl+Shift+P → "Run Task"
///

![Available Tasks](../assets/reloaded-tasks.avif)
/// caption
Pre-configured development tasks for testing and coverage
///

![Clippy Linting](../assets/clippy-lints.avif)
/// caption
Clippy integration by default provides advanced linting out of the box
///

![Run Coverage Task](../assets/run-coverage-task.avif)
/// caption
Run "Auto Coverage on Save" task via Ctrl+Shift+P → "Run Task"
///

![Preview Coverage Report](../assets/coverage-report.avif)
/// caption
Preview coverage report via Ctrl+Shift+P → "Coverage Gutters: Preview Coverage Report"
///

![Coverage Gutters](../assets/coverage-gutters.avif)
/// caption
Coverage show covered (green) and uncovered (red) lines in editor.<br/>
Activate with `Ctrl+Shift+P` → `Coverage Gutter: Watch`
///

!!! tip "For more info, see [VSCode Integration](../features/vscode-integration.md)"

<div data-feature="mkdocs" markdown="1">

#### Editing Documentation

!!! tip "Documentation lives in the doc/ folder"
    It uses [MkDocs](https://www.mkdocs.org/) for building static sites.

**If using VSCode:**

Open the `doc/` folder in a new VSCode window (File → Open Folder) for formatting rules to apply.

**From Command Line:**

To preview documentation locally:

```bash
cd doc
python3 start_docs.py
```

This starts a local server at `http://localhost:8000` with live reload.

See `doc/README.md` for more information.

</div>

## Development Workflow

!!! info "GitHub Workflows"
    This template includes issue and PR templates in the `.github` folder. See [GitHub Templates](../features/github-templates.md) for details.

### How to Test & Check Coverage

**Using VSCode:**

Access pre-configured testing tasks via `Ctrl+Shift+P` → "Run Task":

- **Auto Test on Save** - Automatically run tests when files change
- **Auto Coverage on Save** - Automatically generate coverage reports when files change

Access Coverage Gutters extension commands via `Ctrl+Shift+P`:

- **Coverage Gutters: Watch** - Live coverage visualization in editor
- **Coverage Gutters: Preview Coverage Report** - View HTML coverage report in browser

**From Command Line:**

```bash
cd src
cargo test  # run all tests
```

When you push code, GitHub Actions automatically runs tests on Linux, Windows, and macOS—check the "Actions" tab and use Codecov dashboard to track coverage trends and find untested code.

![PR Checks](../assets/pr-checks.avif)

![Codecov Dashboard](../assets/coverage-codecov.avif)

![Coverage Pills](../assets/coverage-pills.avif)

!!! tip "For more info, see [Automated Testing & Publishing](../features/automated-testing-publishing.md)"

### How to Check for Unsafe Code Issues

**Using VSCode:**

Press `Ctrl+Shift+P` → "Run Task" → Select `Run Tests to Detect Undefined Behaviour` to run Miri tests.

**From Command Line:**

First install Miri (one-time setup):

```bash
rustup +nightly component add miri
```

Run Miri tests in your project:

```bash
cd src
cargo +nightly miri test

# Run a single test
cargo +nightly miri test test_name
```

Use when developing unsafe code or FFI bindings to detect memory safety issues.

!!! tip "For more info, see [Miri Testing](../features/miri-testing.md)"

## Performance & Optimization

<div data-feature="bench" markdown="1">

### How to Benchmark & Profile

**Running Benchmarks:**

```bash
cd src
cargo bench  # run all benchmarks
```

This measures performance and generates detailed HTML reports in `target/criterion/report/index.html`.

**Profiling with Flamegraph:**

Install flamegraph globally (one-time setup):

```bash
cargo install flamegraph
# if on Linux, ensure `perf` and `objdump` are available/installed
```

Generate flamegraph profiles in your project:

**Linux:**

```bash
cd src
cargo flamegraph --bench my_benchmark --profile profile -- --bench
```

**Windows:**

```bash
cd src
# Requires administrator privileges - run in admin command prompt or with sudo
sudo cargo flamegraph --bench my_benchmark --profile profile -- --bench
```

!!! warning "Windows Limitations"
    On Windows, cargo-flamegraph has limitations and requires administrator privileges. For detailed profiling on Windows, use Visual Studio Profiler or other Windows-specific tools instead.

This visualizes call stacks and identifies bottlenecks. Store benchmarks in the `benches/` directory as separate modules.

![Benchmark CLI Output](../assets/benchmark-cli.avif)
/// caption
CLI output when running benchmarks
///

![Benchmark Report](../assets/benchmark-report.avif)
/// caption
Example generated HTML report showing performance trends
///

![Benchmark Comparison](../assets/benchmark-violin-plot.avif)
/// caption
Violin plot comparing different files or implementations
///

![Flamegraph Example](../assets/flamegraph.avif)
/// caption
Interactive flamegraph showing function call hierarchy and time spent
///

![Linux Perf CLI](../assets/profiling-linux-perf.avif)
/// caption
Linux perf command-line analysis
///

![Linux Hotspot](../assets/profiling-linux-hotspot.avif)
/// caption
Hotspot GUI tool for visualizing perf profile data
///

![Visual Studio Profiler](../assets/profiling-windows-visualstudio.avif)
/// caption
Visual Studio 2022 Community Profiler showing CPU usage
///

![Visual Studio Start](../assets/profiling-windows-vs-tutorial-1.avif)
/// caption
Visual Studio start screen
///

![Performance Profiler Menu](../assets/profiling-windows-vs-tutorial-2.avif)
/// caption
Select Debug → Performance Profiler
///

![Select Executable](../assets/profiling-windows-vs-tutorial-3.avif)
/// caption
Select the benchmark executable
///

![Navigate to Binary](../assets/profiling-windows-vs-tutorial-4.avif)
/// caption
Navigate to target/profile/deps/
///

![Start Profiling](../assets/profiling-windows-vs-tutorial-5.avif)
/// caption
Enable CPU Usage and start profiling
///

!!! tip "For more info, see [Performance Benchmarking & Profiling](../features/performance-benchmarking-profiling.md)"

</div>

<div data-feature="pgo" markdown="1">

### How to Use Profile Guided Optimization

**Install globally (one-time setup):**

```bash
cargo install cargo-pgo
rustup component add llvm-tools-preview
```

**Use in your project:**

```bash
cd src
cargo pgo instrument test  # collect profiling data
cargo bench  # establish baseline
cargo pgo optimize bench  # build with PGO and compare
```

![cargo pgo info](../assets/pgo-cargo-pgo-info.avif)
/// caption
Verify cargo-pgo installation with `cargo pgo info`
///

![Benchmark CLI](../assets/benchmark-cli.avif)
/// caption
Run baseline benchmark without PGO
///

![cargo pgo optimize result](../assets/pgo-cargo-pgo-result.avif)
/// caption
Results showing performance improvement from PGO
///

!!! tip "For more info, see [Profile Guided Optimization](../features/profile-guided-optimization.md)"

</div>

## Cross-Platform & Bindings

<div data-feature="xplat" markdown="1">

### How to Build for Other Platforms

**Install globally (one-time setup):**

```bash
cargo install cross --git https://github.com/cross-rs/cross
```

**Use in your project:**

```bash
cd src
cross build --target x86_64-pc-windows-gnu  # build for Windows
cross test --target aarch64-unknown-linux-gnu --release  # test for ARM64 Linux
```

The `cross` tool uses Docker or Podman containers to handle cross-compilation automatically. Simply replace `cargo` with `cross` and specify your target platform.

!!! tip "For more info, see [Cross Compilation](../features/cross-compilation.md)"

</div>

<div data-feature="c-bindings" markdown="1">

### How to Create C/C++ Bindings

**Export functions:**

Use `#[no_mangle]` and `extern "C"` to make functions callable from C/C++:

```rust
#[no_mangle]
pub extern "C" fn add_numbers(a: i32, b: i32) -> i32 {
    a + b
}
```

Build with the `c-exports` feature enabled. Headers are automatically generated when you push a release tag via CI/CD.

![C Bindings Releases](../assets/c-bindings-releases.avif)
/// caption
Headers automatically attached to GitHub releases
///

!!! tip "For more info, see [C/C++ Bindings](../features/bindings/cpp-bindings.md)"
    In particular, check out the [How to Export Functions](../features/bindings/cpp-bindings.md#how-to-export-functions) section for useful patterns.

</div>

<div data-feature="csharp-bindings" markdown="1">

### How to Create C# Bindings

**Export functions:**

!!! note "C# bindings are autogenerated from C bindings"
    See the [C/C++ Bindings section](#how-to-create-cc-bindings) above for how to export functions with `#[no_mangle]` and `extern "C"`.

Bindings are generated when you build into `bindings/csharp/NativeMethods.g.cs`.
Customize generation in `build.rs` using [csbindgen](https://github.com/Cysharp/csbindgen).

!!! tip "For more info, see [C# Bindings](../features/bindings/csharp-bindings.md)"

</div>

<div data-feature="contributing" markdown="1">

## Contributing

### Pull Requests

#### One Change Per PR

Keep pull requests focused and atomic. Try to do one logical change per pull request rather than bundling multiple unrelated changes together.

#### Commit Names

When writing commit messages, follow the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) style to help maintain clear project history:

- **Added** - for new features
- **Changed** - for changes in existing functionality
- **Deprecated** - for soon-to-be removed features
- **Removed** - for now removed features
- **Fixed** - for any bug fixes
- **Security** - in case of vulnerabilities

Example commit messages:
```
Added support for async operations
Fixed memory leak in parser
Changed API parameter order (breaking change)
```

</div>

## Miscellaneous

### GitHub Workflows

The `.github` folder contains pre-configured issue templates, PR templates, and CI/CD workflows.

You may want to edit these to match your project's needs:

- **Issue templates** - Located in `.github/ISSUE_TEMPLATE/`
- **Workflow files** - Located in `.github/workflows/`

When you push code, these workflows automatically run tests on Linux, Windows, and macOS.

![GitHub Template Selector](../assets/issue-template.avif)
/// caption
Template selector for bug reports and feature requests
///

![Bug Report Template](../assets/bug-report-template.avif)
/// caption
Pre-configured bug report template with structured fields
///

!!! tip "For more info, see [GitHub Templates](../features/github-templates.md)"

<script>
// Dynamic feature filtering based on URL parameters
document.addEventListener('DOMContentLoaded', function() {
    // Optional features that can be filtered
    const optionalFeatures = ['bench', 'pgo', 'xplat', 'c-bindings', 'csharp-bindings', 'contributing', 'mkdocs'];
    
    // Get URL parameters
    const params = new URLSearchParams(window.location.search);
    
    // Track if any true filters are present
    let hasTrueFilters = false;
    for (const feature of optionalFeatures) {
        if (params.get(feature) === 'true') {
            hasTrueFilters = true;
            break;
        }
    }
    
    // First, hide sections explicitly set to false
    for (const feature of optionalFeatures) {
        if (params.get(feature) === 'false') {
            const featureDivs = document.querySelectorAll(`[data-feature="${feature}"]`);
            featureDivs.forEach(div => {
                div.style.display = 'none';
            });
        }
    }
    
    // Then, if any true flags present, hide all unspecified sections and show only true ones
    if (hasTrueFilters) {
        // Hide all optional feature sections
        const allFeatureDivs = document.querySelectorAll('[data-feature]');
        allFeatureDivs.forEach(div => {
            div.style.display = 'none';
        });
        
        // Show only sections that are explicitly true
        for (const feature of optionalFeatures) {
            if (params.get(feature) === 'true') {
                const featureDivs = document.querySelectorAll(`[data-feature="${feature}"]`);
                featureDivs.forEach(div => {
                    div.style.display = 'block';
                });
            }
        }
    }
    
    // Project name substitution
    const projectName = params.get('project');
    if (projectName) {
        // Find all elements in the contributing section and replace [Project Name]
        const contributingSection = document.querySelector('[data-feature="contributing"]');
        if (contributingSection) {
            // Replace in text nodes
            const walker = document.createTreeWalker(
                contributingSection,
                NodeFilter.SHOW_TEXT,
                null,
                false
            );
            
            const textNodesToReplace = [];
            while (walker.nextNode()) {
                if (walker.currentNode.textContent.includes('[Project Name]')) {
                    textNodesToReplace.push(walker.currentNode);
                }
            }
            
            textNodesToReplace.forEach(node => {
                node.textContent = node.textContent.replace(/\[Project Name\]/g, projectName);
            });
        }
    }
});
</script>
