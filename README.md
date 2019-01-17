# google-sre-ebook

![Cover](cover.jpg)

Generates a EPUB/MOBI/PDF for the Google SRE Book.

Original sources are downloaded from https://landing.google.com/sre/

# Build

## Docker (Preferred)

Requirements:

-   Docker

```
$ docker run --rm --volume "$(pwd):/output" captn3m0/google-sre-ebook:latest
```

-   You should see the final EPUB/MOBI/PDF files in the `output` directory after the above runs.
-   The file may be owned by the root user.

**NOTE:** You'll have to allow docker access to a directory that's local to your system. The safest way to do this is as follows:

```
$ mkdir /tmp/sreoutput
$ chcon -Rt svirt_sandbox_file_t /tmp/sreoutput
$ docker run --rm --volume "/tmp/sreoutput:/output" captn3m0/google-sre-ebook:latest
```

The build for the above Docker image can be audited at <https://cloud.docker.com/swarm/captn3m0/repository/docker/captn3m0/google-sre-ebook/builds>.

## macOS

Review and run the `bootstrap.sh` script to generate the EPUB, MOBI, and PDF files

Requirements:

-   Ruby
-   `gem install bundler`
-   `gem install nokogiri`
-   `brew install pandoc`
-   `brew cask install calibre`
-   `brew install wget`

# Known Issues

-   metadata.xml is not complete. There are just too many authors
-   Foreword/Preface is not part of the index

# LICENSE

This is licensed under WTFPL. See COPYING file for the full text.
