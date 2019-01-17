#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

TOC_URL="https://landing.google.com/sre/sre-book/toc/index.html"
# Make sure that links are relative \
# # Remove the /sre/ directories
# Save stuff in html/ directory
# Do not create a landing.google.com directory
# Enable recursion, timestamping (--mirror)
# Images are hosted elsewhere, download them as well.
# We need to go up a level from /toc/ where we start
wget \
    --convert-links \
    --directory-prefix=html \
    --page-requisites \
    --adjust-extension \
    --span-hosts \
    --trust-server-names \
    --backup-converted \
    --mirror \
    --no-verbose \
    --recursive \
    --domains=lh3.googleusercontent.com,landing.google.com https://landing.google.com/sre/sre-book/toc/index.html

MODE=${1:-}

if [ "$MODE" != "docker" ];then
    bundle install
fi

ruby generate.rb

pushd html/landing.google.com/sre/sre-book/toc
pandoc --from=html --to=epub --output=../../../../../google-sre.epub \
    --epub-metadata=../../../../../metadata.xml \
    --epub-cover-image=../../../../../cover.jpg \
    complete.html
popd
ebook-convert google-sre.epub google-sre.mobi
ebook-convert google-sre.epub google-sre.pdf

if [ "$1"=="docker" ]; then
    chown -v $(id -u):$(id -g) google-sre.*
    mv -f google-sre.* /output
fi
