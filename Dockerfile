FROM ubuntu:latest

ARG DEBIAN_FRONTEND="noninteractive"

COPY . /src/

WORKDIR /src

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    calibre \
    pandoc \
    ruby \
    ruby-dev \
    wget \
    zlib1g-dev \
    && gem install bundler --no-ri --no-rdoc \
    && bundle install

ENTRYPOINT ["/src/bootstrap.sh", "docker"]

VOLUME ["/output"]
