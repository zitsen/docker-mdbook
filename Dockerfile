FROM rust:1.53 as builder
WORKDIR /usr/src/
RUN git clone https://github.com/zitsen/mdBook.git --branch localization
WORKDIR /usr/src/mdBook
RUN cargo install --path .
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y git
COPY --from=builder /usr/local/cargo/bin/mdbook /usr/local/bin/mdbook
CMD ["mdbook"]