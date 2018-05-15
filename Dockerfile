FROM ubuntu:17.10

RUN apt-get update && apt-get install -y \
    build-essential \
    calibre \
    pandoc \
    ruby \
    ruby-dev \
    wget \
    zlib1g-dev

RUN gem install bundler --no-ri --no-rdoc

COPY . /

RUN bundle install
