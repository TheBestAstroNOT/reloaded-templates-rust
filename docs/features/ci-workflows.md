# CI Workflows

Automated testing, publishing, and code quality checks that run when you update your code, ensuring your Rust library works across all platforms.

## Key Features
- **[Cross-platform testing](#cross-platform-testing)**: Linux, Windows, macOS
- **[Automated code coverage](#code-coverage)**: How much of your code is tested? (Codecov)
- **[Semantic version checking](#code-quality)**: Prevents breaking changes
- **[Tag-based publishing](#publishing)**: crates.io, NuGet
- **[PGO optimization](#cross-platform-testing)**: Better performance
- **[Wine testing](#testing-on-wine)**: Linux gaming compatibility

## Testing

### Cross-Platform Testing

!!! info "Matrix Strategy Testing"
    The workflow tests across modern platforms using a matrix strategy:

#### Standard Targets
- **Linux**: x86_64, i686
- **Windows**: x86_64, i686 (MSVC toolchain)
- **macOS**: x86_64 (Intel), aarch64 (Apple Silicon)

#### Optional Extended Targets
<div class="annotate" markdown>

- **Linux**: aarch64, armv7 (ARM variants use cross-compilation)
- **Windows**: aarch64 (MSVC toolchain) (1)
- **Big Endian**: powerpc64-unknown-linux-gnu, powerpc-unknown-linux-gnu (2)

</div>

1.  Currently unsupported due to lack of non-enterprise GitHub runners
2.  Optional feature aiming to support older game consoles which used Big Endian

!!! tip "Opt-in Extended Platform Testing"
    You can opt in to testing on less standard platforms for comprehensive compatibility.
    
    [Reloaded3](https://reloaded-project.github.io/Reloaded-III/) uses extended targets and `no_std` to ensure compatibility with hard platforms like consoles.

### Testing on Wine

!!! example
    The development of Reloaded helped identify these two Wine bugs through automated testing: [#56357](https://bugs.winehq.org/show_bug.cgi?id=56357) and [#56362](https://bugs.winehq.org/show_bug.cgi?id=56362).
    
    This helps the rest of the modding ecosystem ensure mods run on Linux.

The `test-on-wine` job ensures your code runs correctly inside Wine, which is crucial for low level development; which integrates tightly with the OS.

This is helpful when your code is expected to run in a Windows environment from Linux; such as being part of game mods.

## Code Coverage

!!! info "Track Your Test Coverage"
    See how much of your code is actually tested and find missing test cases.

![Codecov Dashboard](../assets/coverage-codecov.avif)
/// caption
Codecov dashboard provides detailed coverage analytics and trend tracking
///

![Coverage Pills](../assets/coverage-pills.avif)
/// caption
Coverage pills on README.md show project health at a glance - click them to go to the relevant page
///

The default CI configuration collects and uploads coverage reports to Codecov for all supported platforms, showing you which parts of your code need more tests.

## Code Quality

### Semantic Version Checks
Automatically verifies that changes don't break the public API in ways that require a major version bump using `cargo-semver-checks`. Releases and Pull Requests will fail if incompatible changes were made without an appropriate version bump.

!!! info "[What is Semantic Versioning?](https://semver.org)"

    Semantic Versioning (SemVer) helps users understand the impact of updates:

    - **MAJOR**: Incompatible changes (1.0.0 → 2.0.0)
    - **MINOR**: New features, backward compatible (1.0.0 → 1.1.0)  
    - **PATCH**: Bug fixes, backward compatible (1.0.0 → 1.0.1)

    For versions < 1.0.0, the project is considered unstable and the minor version may include breaking changes.

    *[Incompatible changes]: Changes that may break things for people using your code, such as:<br/>- Removing or renaming functions<br/>- Changing parameters to a function

## Publishing

!!! tip "How to Publish?"
    In order to make a release, you should push a tag that's named after the version, for example `1.0.0` for version `1.0.0`. Do not use a `v` prefix.

### What Happens When You Publish?

When you push a version tag, the CI workflow automatically handles your release. Depending on your template options, the following may happen:

- **crates.io**: Publishes your Rust library to the official Rust package registry
- **GitHub Release**: Creates a GitHub release with changelog

*Optional features (if enabled):*

- **NuGet**: Publishes .NET bindings for C# developers
- **C/C++ Headers**: Generates header files for cross-language interoperability

All releases are gated by successful tests and quality checks, ensuring only stable code reaches your users.

## Integration with Existing Projects
!!! info
    For adding to existing non-template projects.

Run the template again with your desired options to generate a customized `rust.yml` file, then copy it to your project:

```bash
cargo generate --git https://github.com/Reloaded-Project/reloaded-templates-rust.git
```

See the [main documentation](../index.md#getting-started) for more details on getting started with cargo-generate.