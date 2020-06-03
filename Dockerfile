# LTS Image
FROM ubuntu:18.04

LABEL maintainer="github.google-sre-ebook@captnemo.in"

ARG DEBIAN_FRONTEND="noninteractive"

WORKDIR /src


RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    calibre \
    ruby \
    ruby-dev \
    wget \
    zlib1g-dev \
    file \
    gnupg \
    && gem install bundler --no-ri --no-rdoc \
    && gem update --system

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
RUN echo "deb http://miktex.org/download/ubuntu bionic universe" > /etc/apt/sources.list.d/miktex.list

RUN apt-get update && apt-get install -y miktex texlive-xetex

COPY . /src/

RUN bundle install

RUN wget -c https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-1-amd64.deb
RUN dpkg -i pandoc-2.9.2.1-1-amd64.deb

ENTRYPOINT ["/src/generate.sh", "docker"]

VOLUME ["/output"]
