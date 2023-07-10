# Reloaded Project Configurations

This page hosts the common configurations for various parts of the Reloaded project that are written in Rust.

It includes configuration for `Code - OSS` (a.k.a. `vscode`), as well as scripts for debugging under different platforms.

## Usage

To use this repository, add it as a submodule to your project.

```
git submodule add https://github.com/Reloaded-Project/reloaded-project-configurations-rust.git ./submodules/reloaded-project-configurations
```

Periodically update the submodule to the latest version.

```
git submodule update --remote
```

## Code Style

Rust projects in Reloaded use the default code style of `rustfmt`.

## File Layout

The following is the expected file layout for your project:

```
.vscode/
.cargo/
docs/
src/
submodules/reloaded-project-configurations
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

Use the provided scripts in `submodules/reloaded-project-configurations`.

- `./test-wine-x86.ps1`: Tests your code in Wine on x86.
- `./test-wine-x64.ps1`: Tests your code in Wine on x86_64.
- `./test-linux-x64.ps1`: Tests your code in Linux on x86_64.
- `./test-linux-x86.ps1`: Tests your code in Linux on x86.

These scripts can be used on any platform given the prerequisites are met.  

For Apple platforms, you'll need either Apple hardware, or suffer with an extremely slow Virtual Machine following *a lot* of awful hacks. Would not recommend.

## CI/CD Runs

[INCOMPLETE]

For CI runs, you can use the following composite steps to set up the required tools and SDKs:

```yaml
# TBD
```

## Documentation

If documentation is required, please follow the guidelines
for [Reloaded MkDocs Theme](https://reloaded-project.github.io/Reloaded.MkDocsMaterial.Themes.R2/Pages/)
on how to set up documentation.

## License

This repository is licensed under the GPLv3 license; as per all Reloaded components since June 2023.