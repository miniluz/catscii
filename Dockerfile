FROM ubuntu:20.04

RUN set -eux; \
    apt update; \
    apt install -y curl;

RUN set -eux; \
    curl --location --fail \
        "https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init" \
        --output rustup-init; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --default-toolchain stable; \
    rm rustup-init;

ENV PATH=${PATH}:/root/.cargo/bin
RUN set -eux; \
		rustup --version;