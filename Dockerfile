FROM debian:buster-slim

LABEL maintainer="github.google-sre-ebook@captnemo.in"

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /src

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    calibre \
    file \
    pandoc \
    ruby \
    ruby-dev \
    lmodern \
    texlive-fonts-recommended \
    texlive-xetex \
    wget \
    zlib1g-dev \
    && gem install bundler --no-ri --no-rdoc \
    && gem update --system \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /src/

RUN bundle install

ENTRYPOINT ["/src/generate.sh", "docker"]

VOLUME ["/output"]
