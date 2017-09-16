# google-sre-ebook

![Cover](cover.jpg)

Generates a EPUB/MOBI for the Google SRE Book.

Original sources are downloaded from https://landing.google.com/sre/

Review and run the `bootstrap.sh` script to generate the EPUB and MOBI files

Requirements:

- Ruby
- bundler
- Installs nokogiri

# Known Issues

- Inline references are not handled in the best possible way
- metadata.xml is not complete. There are just too many authors
- Foreword/Preface is not part of the index
