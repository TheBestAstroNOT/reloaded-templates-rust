# Reloaded Project Configurations

This page hosts the common configurations for various parts of the Reloaded project that are written in Rust.  

It includes configuration for `Code - OSS` (a.k.a. `VSCode`), as well as scripts for debugging under different platforms.  

## VSCode Configuration

If using code, the following extensions are recommended:
- [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer) for Rust support.  
- [coverage-gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters) for Coverage support.  
- [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb) for debugging.  
- [crates](https://marketplace.visualstudio.com/items?itemName=serayuzgur.crates) easier dependency management.  

Copy the `.vscode` folder to your new project. This contains configuration to run Rust linter (clippy),
and format your code to meet style requirements on save.

Rust projects in Reloaded use the default code style of `rustfmt`.  
Unfamiliar with code? Try command palette (`Ctrl+Shift+P`).  

## File Layout

The following is the expected file layout for your project:

```
.vscode/
.cargo/
docs/
src/
Cargo.toml
```

The `docs` folder should contain all mkdocs documentation for your project (if present).  
The `src` folder should contain all source code for your project.  

`Cargo.toml` should be in the root of the repository.  
`.cargo` is optional, use if need to override settings.  

## Cross Platform Targeting

To work with cross-platform code, where you need to access OS specific APIs, some helper scripts are provided.

### Including All Code Paths

To include all code paths for local builds, consider editing `.cargo/config.toml`.

```toml
[build]
# Note: This breaks IntelliJ Rust. Remove this line temporarily if working from that IDE.
target = ['x86_64-unknown-linux-gnu','x86_64-apple-darwin','x86_64-pc-windows-gnu']
```

You might need to install the targets first:

```bash
rustup target add x86_64-unknown-linux-gnu
rustup target add x86_64-apple-darwin
rustup target add x86_64-pc-windows-gnu
```

Now when you run `cargo build`, it will build code for all platforms; and you'll get your compiler errors, warnings etc.

### Cross Testing on Local Machine

#### Prerequisites (Windows)

- Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).  
- Disable WSL 2 (Docker Desktop -> Settings -> General -> Use the WSL 2 based engine).  

#### Prerequisites (Linux)

- Install [Podman](https://podman.io) from your package manager.  

#### Prerequisites (Common)

Install cross

```
cargo install cross
```

#### Running Cross-Platform Tests

Use the provided scripts in `submodules/reloaded-project-configurations-rust/scripts`.

- `./test-wine-x86.ps1`: Tests your code in Wine on x86.
- `./test-wine-x64.ps1`: Tests your code in Wine on x86_64.
- `./test-linux-x64.ps1`: Tests your code in Linux on x86_64.
- `./test-linux-x86.ps1`: Tests your code in Linux on x86.

These scripts can be used on any platform given the prerequisites are met.  

For Apple platforms, you'll need either Apple hardware, or suffer with an extremely slow Virtual Machine following *a lot* of awful hacks. Would not recommend.

## Test Coverage (VSCode)

To run Coverage, run task (`Ctrl+Shift+P -> Run Task`), you should see: 

| Task                   | Description                                                                |
| ---------------------- | -------------------------------------------------------------------------- |
| Cargo Watch Tarpaulin  | Automatically runs tests and updates coverage on save.                     |
| Generate Code Coverage | Manually generate code coverage (`cobertura.xml`, `tarpaulin-report.html`) |

The `tarpaulin-report.html` file can be opened in VSCode (`Show Preview`) for a live view.

### GUI Integration

For automatic integration with code, install [coverage-gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters),
and run action `Coverage Gutter: Watch` (in `Ctrl+Shift+P` actions menu).

## CI/CD

This repo includes a number of useful CI/CD actions for usage from within your GitHub actions.
Paste them to your repo as required.

See `.github/example-workflows` for examples; here are them listed:  
- `test-and-upload-coverage.yml`: Test the cargo project and upload relevant coverage.  
- `test-on-wine.yml`: Runs tests against Wine, to validate compatibility with Wine users.  

## Documentation

If documentation is required, please follow the guidelines
for [Reloaded MkDocs Theme](https://reloaded-project.github.io/Reloaded.MkDocsMaterial.Themes.R2/Pages/)
on how to set up documentation.

## License

This repository is licensed under the GPLv3 license; as per all Reloaded components since June 2023.