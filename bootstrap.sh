#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Vars.
export BOOK_NAME="sre-book"
export BOOK_NAME_FULL="Site Reliability Engineering"
BOOK_FILE="google-${BOOK_NAME}"
TOC_URL="https://landing.google.com/sre/${BOOK_NAME}/toc/index.html"
IMGS_DOMAIN="lh3.googleusercontent.com"

# Make sure that links are relative \
# # Remove the /sre/ directories
# Save stuff in html/ directory
# Do not create a landing.google.com directory
# Enable recursion, timestamping (--mirror)
# Images are hosted elsewhere, download them as well.
# We need to go up a level from /toc/ where we start
wget \
    --convert-links         \
    --directory-prefix=html \
    --page-requisites       \
    --adjust-extension      \
    --span-hosts            \
    --trust-server-names    \
    --backup-converted      \
    --mirror                \
    --no-verbose            \
    --recursive             \
    --domains=${IMGS_DOMAIN},landing.google.com ${TOC_URL}

#
MODE=${1:-}

if [ "$MODE" != "docker" ];then
    bundle install
fi

#
ruby generate.rb

#
pushd html/landing.google.com/sre/${BOOK_NAME}/toc
pandoc -f html -t epub -o ../../../../../${BOOK_FILE}.epub --epub-metadata=../../../../../metadata.xml --epub-cover-image=../../../../../cover.jpg complete.html
popd

#
for EXTENSION in mobi pdf; do
    ebook-convert ${BOOK_FILE}.epub ${BOOK_FILE}.${EXTENSION}
done

#
if [ "$1"=="docker" ]; then
    chown -v $(id -u):$(id -g) ${BOOK_FILE}.*
    mv -f ${BOOK_FILE}.* /output
fi
