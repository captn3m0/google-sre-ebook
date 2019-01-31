# LTS Image
FROM ubuntu:18.04

LABEL maintainer="github.google-sre-ebook@captnemo.in"

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /src

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    calibre \
    pandoc \
    ruby \
    ruby-dev \
    wget \
    zlib1g-dev \
    file \
    && gem install bundler --no-rdoc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /src/

RUN bundle install

ENV NO_BUNDLE_INSTALL=true

ENTRYPOINT ["/src/bootstrap.sh", "docker"]

VOLUME ["/output"]
