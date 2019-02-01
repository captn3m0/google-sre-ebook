#!/bin/bash
if [[ "${DEBUG}" == 1 ]]; then
    set -x
fi
set -euo pipefail
IFS=$'\n\t'

# Get book details.
source books.sh
export ${BOOKS[${BOOK_SLUG^^}]}

# Common vars.
IMGS_DOMAIN="lh3.googleusercontent.com"

#
# Make sure that links are relative \
# # Remove the /sre/ directories
# Save stuff in html/ directory
# Do not create a landing.google.com directory
# Enable recursion, timestamping (--mirror)
# Images are hosted elsewhere, download them as well.
# We need to go up a level from /toc/ where we start
# The "ture" at the end to ignore non-200 URLs like 404.
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
    --domains=${IMGS_DOMAIN},landing.google.com ${BOOK_TOC_URL} || true

#
echo "Get working mode..."
MODE=${1:-}

if [ "$MODE" != "docker" ];then
    bundle install
fi

#
# Add extension to files.
# That because `pandoc` cannot generate the right `mime type` without the extension.
# https://github.com/captn3m0/google-sre-ebook/issues/19
echo "Fix images extension issue ..."
IMGS_FILES="$(ls html/${IMGS_DOMAIN}/*)"
for FILE_NAME_FULL in ${IMGS_FILES}; do

    # Get file vars.
    FILE_NAME_BASE="$(basename ${FILE_NAME_FULL})"
    FILE_TYPE=$(file -b -- "${FILE_NAME_FULL}" | cut -f1 -d " ")

    # Rename and replace file.
    mv "${FILE_NAME_FULL}" "${FILE_NAME_FULL}.${FILE_TYPE,,}" &&
    grep -rl -- "${FILE_NAME_BASE}" ./html | xargs sed -i -- "s/${FILE_NAME_BASE}/${FILE_NAME_BASE}.${FILE_TYPE,,}/g"

done

#
# Generate epub from html.
echo "Generate book ..."
bundle exec ruby generate.rb
pushd html/landing.google.com/sre/${BOOK_NAME}/toc
pandoc --from=html --to=epub                                 \
    --output=../../../../../${BOOK_FILE}.epub                \
    --epub-metadata=../../../../../metadata/${BOOK_NAME}.xml \
    --epub-cover-image=../../../../../cover/${BOOK_NAME}.jpg \
    complete.html
popd

#
# Generate other format from epub.
for EXTENSION in mobi pdf; do
    ebook-convert ${BOOK_FILE}.epub ${BOOK_FILE}.${EXTENSION}
done

#
# If it works inside docker.
if [ "$MODE" == "docker" ]; then
    chown -v $(id -u):$(id -g) ${BOOK_FILE}.*
    mv -f ${BOOK_FILE}.* /output
fi
