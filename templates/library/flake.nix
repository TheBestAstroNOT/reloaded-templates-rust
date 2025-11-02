# Flake for Windows cross-compilation testing with pthreads fix
# Usage: nix develop .#windows && cargo test --target x86_64-pc-windows-gnu --release
# Assumes cargo/rust are managed via rustup
#
# Uses rust-windows-gnu-helper-flake for Windows GNU cross-compilation environment
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-windows-gnu-helper-flake.url = "github:Sewer56/rust-windows-gnu-helper-flake";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    rust-windows-gnu-helper-flake,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      winGnuEnv = rust-windows-gnu-helper-flake.lib.${system}.winGnuEnv;
      winGnuPackages = rust-windows-gnu-helper-flake.lib.${system}.winGnuPackages;
    in {
      devShells.windows = pkgs.mkShell (winGnuEnv
        // {
          buildInputs = winGnuPackages;
        });
    });
}