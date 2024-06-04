FROM rust:latest AS build
RUN apt update -y && apt upgrade -y
RUN CARGO_HOME=/.cargo cargo install --git https://github.com/cptpiepmatz/typstfmt.git --locked

FROM debian:bookworm
WORKDIR /
RUN apt update -y && apt upgrade -y
COPY --from=build /.cargo/bin/typstfmt /
ENTRYPOINT [ "/typstfmt" ]
CMD [ "--help" ]
