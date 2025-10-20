# Flake for Windows cross-compilation testing with pthreads fix
# Usage: nix develop .#windows && cargo test --target x86_64-pc-windows-gnu --release
# Assumes cargo/rust are managed via rustup
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      mingwPkgs = nixpkgs.legacyPackages.${system}.pkgsCross.mingwW64;
    in {
      devShells.windows = pkgs.mkShell {
        CARGO_TARGET_X86_64_PC_WINDOWS_GNU_RUSTFLAGS = "-L native=${mingwPkgs.windows.pthreads}/lib";

        buildInputs = [
          mingwPkgs.buildPackages.gcc
        ];
      };
    });
}