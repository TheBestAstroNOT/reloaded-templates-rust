# Make sure you have Docker/Podman first
cargo install cross
rustup target add x86_64-apple-darwin
cross build --target x86_64-apple-darwin