#!/bin/bash
TOC_URL="https://landing.google.com/sre/sre-book/toc/index.html"
# Make sure that links are relative \
# # Remove the /sre/sre-book/ directories
# Save stuff in html/ directory
# Do not create a landing.google.com directory
# Enable recursion, timestamping
# We need to go up a level from /toc/ where we start
wget \
	--convert-links \
	--cut-dirs=2 \
	--directory-prefix=html \
	--no-host-directories \
	--mirror \
	--include-directories=/sre/sre-book/ "$TOC_URL"
# Note: This does not yet create a virtual environment
# and only runs on Python 2
pip install -r requirements.txt
# python2 generate.py
