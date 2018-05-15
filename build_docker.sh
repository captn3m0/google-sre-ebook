#!/usr/bin/env bash
docker build -t google-sre-ebook .
docker run -i --rm -v "$(pwd):/output" google-sre-ebook sh -s <<EOF
./bootstrap.sh
chown -v $(id -u):$(id -g) /google-sre.*
mv -f /google-sre.* /output
EOF
