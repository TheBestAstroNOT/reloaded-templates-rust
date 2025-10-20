# Cross Compilation Tutorial

Reloaded projects are often compiled for a variety of platforms. While most of this is done by automated checks, you may sometimes want to try cross compilation during local development.

## Supported Platforms

Most repositories using this template target the following:

- **Linux**: x86_64, i686 (native), aarch64, armv7 (cross-compiled)
- **Windows**: x86_64, i686 (MSVC toolchain)
- **macOS**: x86_64 (Intel), aarch64 (Apple Silicon)

!!! info "Extended Targets"
    See [Automated Testing & Publishing](automated-testing-publishing.md#cross-platform-testing) for detailed testing workflows and extended target options.

## Testing with Wine

Users on Linux can test Windows binaries by using Wine for local testing. You either have the option to use your local installed version of Wine, or through the use of `cross`, which uses a docker image under the hood. `cross` is also used to test the more esoteric platforms, e.g. Big Endian, thus is recommended.

If you encounter a bug with WINE, it's recommended to test with latest Wine on your local system before reporting bugs to WineHQ.

### Testing on Wine with Cross

`cross` can be used to test with Wine.

```bash
# Install cross
cargo install cross --git https://github.com/cross-rs/cross --force

# Test Windows binaries on Linux using cross
cross test --target x86_64-pc-windows-gnu --release
cross test --target i686-pc-windows-gnu --release
```

!!! info "Docker/Podman Required"
    `cross` requires Docker or Podman to be installed and running for cross-compilation.

!!! warning "Use Release Builds"
    Debug builds may have compilation issues when cross-compiling with `cross` on certain images. Use `--release` whenever possible.

### Testing on Wine with Cargo

The WINE in `cross` may sometimes be a bit out of date.

You'll need MinGW for cross compilation and WINE for running the tests.

The tests will run in your local WINE installation.

=== "Arch Linux"

    ```bash
    # Install Wine for running and MinGW for cross compilation
    sudo pacman -S wine mingw-w64-gcc

    # Add Windows target (or equivalent for your setup)
    rustup target add x86_64-pc-windows-gnu

    # Test Windows binaries on Linux using cargo
    cargo test --target x86_64-pc-windows-gnu --release
    ```

=== "NixOS"

    You'll also need to update your system configuration to enable binfmt for Wine:

    ```nix
    # Allow EXE files to be automatically executed through Wine
    boot.binfmt.emulatedSystems = [ "x86_64-windows" "i686-windows" ];
    ```

    Then you can cross compile as follows:

    ```bash
    # Activate the Windows development environment
    nix develop .#windows

    # Build and test
    rustup target add x86_64-pc-windows-gnu  # or equivalent for your setup
    cargo test --target x86_64-pc-windows-gnu --release
    ```

When Wine testing is enabled during template generation, these tests also run automatically in CI/CD.

## Automated Testing

!!! info "The provided workflows automatically build and test your library across all supported platforms."

![PR Checks](../assets/pr-checks.avif)
/// caption
Automated cross-platform checks running during pull requests
///

The cross-compilation automation is implemented in `.github/workflows/auto-changelog.yml`.

For custom target configurations or additional platforms, modify the GitHub Actions workflow files in `.github/workflows/`. The matrix build strategy allows easy extension of supported targets.

## Integration with Existing Projects

!!! info
    For adding to existing non-template projects.

Copy and adapt `.github/workflows/rust.yml` from the template to your project.

See the [main documentation](../index.md#getting-started) for more details.