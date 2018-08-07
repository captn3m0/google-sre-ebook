#!/bin/bash

# Cleanup
rm -rf html
mkdir -p html
cd html

# Download
wget --convert-links --mirror https://landing.google.com/sre/book/
mv landing.google.com/sre/book/* .
rm -rf landing.google.com
cd ..

if [ $1 != "docker" ];then
    bundle install
fi

ruby generate.rb

pushd html/chapters
pandoc -f html -t epub -o ../../google-sre.epub --epub-metadata=../../metadata.xml --epub-cover-image=../../cover.jpg sre.html
popd
ebook-convert google-sre.epub google-sre.mobi
ebook-convert google-sre.epub google-sre.pdf

if [ "$1"=="docker" ]; then
    chown -v $(id -u):$(id -g) google-sre.*
    mv -f google-sre.* /output
fi
