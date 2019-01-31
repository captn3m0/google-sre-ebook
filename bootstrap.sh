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

: "${NO_BUNDLE_INSTALL:=false}"

if [ "$NO_BUNDLE_INSTALL" != "true" ];then
    bundle install
fi

# Add extension to files.
# That because `pandoc` cannot generate the right `mime type` without the extension.
# https://github.com/captn3m0/google-sre-ebook/issues/19
IMGS_FILES="$(ls html/${IMGS_DOMAIN}/*)"
for FILE_NAME_FULL in ${IMGS_FILES}; do

    # Get file vars.
    FILE_NAME_BASE="$(basename ${FILE_NAME_FULL})"
    FILE_TYPE=$(file -b -- "${FILE_NAME_FULL}" | cut -f1 -d " ")

    # Rename and replace file.
    mv "${FILE_NAME_FULL}" "${FILE_NAME_FULL}.${FILE_TYPE,,}" &&
    grep -rl "${FILE_NAME_BASE}" ./html | xargs sed -i "s/${FILE_NAME_BASE}/${FILE_NAME_BASE}.${FILE_TYPE,,}/g"

done

bundle exec ruby generate.rb
pushd html/landing.google.com/sre/${BOOK_NAME}/toc
pandoc --from=html --to=epub \
    --output=../../../../../${BOOK_FILE}.epub \
    --epub-metadata=../../../../../${BOOK_NAME}.xml \
    --epub-cover-image=../../../../../${BOOK_NAME}.jpg \
    complete.html
popd

if [[ command -v ebook-convert ]]; then
    for EXTENSION in mobi pdf; do
        ebook-convert ${BOOK_FILE}.epub ${BOOK_FILE}.${EXTENSION}
    done
fi

# TODO: Replace this with a better check
if [ "$1"=="docker" ]; then
    chown -v $(id -u):$(id -g) ${BOOK_FILE}.*
    mv -f ${BOOK_FILE}.* /output
fi
