<div align="center">
  <a href="https://github.com/Reloaded-Project/reloaded-templates-rust" target="_blank">
    <img src="./assets/reloaded-logo.png" alt="reloaded Logo" width="100"/>
  </a>

  <h1 align="center">Reloaded Rust Templates</h1>

  <p>
<!-- TODO: Add CI/CD for Templates 
    <a href="https://github.com/Reloaded-Project/reloaded-templates-rustactions?query=">
      <img src="https://github.com/Reloaded-Project/reloaded-templates-rust/actions/workflows/build.yml/badge.svg" alt="Build Status">
    </a>
-->
    <a href="./LICENSE-MIT">
      <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License-MIT">
    </a>
  </p>
</div>

##

This template repository is [Sewer's][sewer56] opinionated [Rust][rust], library and other Reloaded 
project generators, which use the [cargo-generate][cargo-generate] tool.  

These templates provide various features for getting-up and running with cross platform Rust library 
or Reloaded3 mod development.  

- Standardized README, Contributing Guidelines & Project Layout.  
- GitHub Issue and Pull Request templates.  
- VSCode Workflow & Integration.  
- Test, lint, audit, and code coverage (via [Codecov][codecov] GitHub Action workflows.  
- A choice of an [Apache][apache], [MIT][mit], [LGPLv3][lgplv3] or [GPLv3][gplv3] licenses.  
- [`cargo-bench`](https://doc.rust-lang.org/cargo/commands/cargo-bench.html) integration 
  (*optional*).  
- Cross-compilation & testing; including testing for Wine on Linux (*optional*).  
- Profile Guided Optimization (*optional*).
- Native C exports (*optional*), and C# exports.  

## Outline

- [Project Templates](#project-templates)
- [Getting Started](#getting-started)
- [Thanks](#thanks)
- [License](#license)

## Project Templates

This repository contains two sub-templates:

- `library`: for generating a rust library, webserver, or binary/executable
  project.  

- `reloaded3` for generating a [Reloaded-III](https://reloaded-project.github.io/Reloaded-III/)
  mod written in Rust. Coming 2024.  

## Getting Started

Install [cargo-generate][cargo-generate] via `cargo install cargo-generate`, and create project from template:

```bash
# This might take a while
cargo install cargo-generate
cargo generate --git https://github.com/Reloaded-Project/reloaded-templates-rust.git
```

More installation options are available [here][cargo-generate-install].

The experience running through the experience should look something like this:

<!-- TODO: Update This -->
![cargo-generate Rust Binary Application Screenshot](./assets/example-create.png)

Once you generate a template, further instructions might await in your project's README file 😉.

## Thanks

These templates are inspired by [fission-codes/rust-template][rust-template] and [rust-github/template][rust-github-template]; and their contributors. I'd like to extend my personal token of gratitude.

# License

This repository is licensed under the MIT license; however note, most Reloaded components themselves 
are licensed LGPL or GPLv3.

[apache]: https://www.apache.org/licenses/LICENSE-2.0
[cargo-generate]: https://github.com/cargo-generate/cargo-generate
[cargo-generate-install]: https://github.com/cargo-generate/cargo-generate#installation
[codecov]: https://about.codecov.io/
[lgplv3]: https://www.gnu.org/licenses/lgpl-3.0.en.html#license-text
[gplv3]: https://www.gnu.org/licenses/gpl-3.0.en.html#license-text
[mit]: http://opensource.org/licenses/MIT
[rust]: https://www.rust-lang.org/
[rust-github-template]: https://github.com/rust-github/template
[rust-template]: https://github.com/fission-codes/rust-template
[sewer56]: https://github.com/Sewer56