FROM debian:stable-slim

ENV RUSTUP_HOME=/usr/local/rustup CARGO_HOME=/usr/local/rustup/cargo
RUN mkdir -p /usr/local/rustup/cargo \
	&& apt-get -y update \
	&& apt-get -y install gcc musl-tools wget \
	&& wget -qO- https://sh.rustup.rs | sh -s -- -y --default-toolchain stable \
	&& $CARGO_HOME/bin/rustup target add x86_64-unknown-linux-musl \
	&& find /usr/local/rustup/ -type f -executable -exec strip '{}' ';'

COPY cargo rustc /usr/local/bin/
