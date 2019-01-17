FROM ruby:alpine

LABEL maintainer="github.google-sre-ebook@captnemo.in"

RUN apk add \
    build-base \
    linux-headers \
    wget \
    bash

# Install pandoc
RUN wget -nv https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-linux.tar.gz \
    && tar xzf pandoc-2.5-linux.tar.gz --strip-components 1 -C /usr/local \
    && rm pandoc-2.5-linux.tar.gz

COPY Gemfile* /tmp/

WORKDIR /tmp

RUN gem install bundler --no-document \
    && bundle install

WORKDIR /src

ENTRYPOINT ["/src/bootstrap.sh", "docker"]

VOLUME ["/output"]
