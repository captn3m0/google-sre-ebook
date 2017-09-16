#!/bin/bash

rm -rf html
mkdir -p html
cd html
wget --convert-links --mirror https://landing.google.com/sre/book/

mv landing.google.com/sre/book/* .
rm -rf landing.google.com
cd ..

bundle install
ruby generate.rb

cd html/chapters

pandoc -S -o ../../google-sre.epub --epub-metadata=../../metadata.xml --epub-cover-image=../../cover.jpg sre.html
ebook-convert google-sre.epub google-sre.mobi
