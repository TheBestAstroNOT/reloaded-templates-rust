# Make sure you have Docker/Podman first
cargo install cross
rustup target add x86_64-unknown-linux-gnu
cross build --target x86_64-unknown-linux-gnu
cross test --target x86_64-unknown-linux-gnu