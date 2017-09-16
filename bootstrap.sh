#!/bin/bash

mkdir -p html
cd html
wget --mirror https://landing.google.com/sre/book/

mv landing.google.com/sre/book/* .
rm -rf landing.google.com
cd ..

bundle install
ruby generate.rb
