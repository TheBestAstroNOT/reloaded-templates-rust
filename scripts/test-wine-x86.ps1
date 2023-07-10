# Make sure you have Docker/Podman first
rustup target add i686-pc-windows-gnu
cross build --target i686-pc-windows-gnu
cross test --target i686-pc-windows-gnu