#!/bin/bash

mkdir -p html
cd html
wget --mirror https://landing.google.com/sre/book/

mv landing.google.com/sre/book/* .
rm -rf landing.google.com
cd ..
pip install -r requirements.txt
python2 generate.py
