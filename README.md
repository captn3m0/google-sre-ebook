# google-sre-ebook

![Cover](cover.jpg)

Generates a EPUB/MOBI/PDF for the Google SRE Book.

Original sources are downloaded from https://landing.google.com/sre/

# Build

## Docker (Preferred)

Requirements:

-   Docker. See [Getting Started Guide](https://docs.docker.com/get-started/)

There are two variants of the Docker Image:

### All Versions (EPUB/MOBI/PDF)

```
$ docker run --rm --volume "$(pwd):/output" captn3m0/google-sre-ebook:latest
```

### Only EPUB

If you only require an EPUB file, there is a much slimmer image that is based on [Alpine Linux](https://alpinelinux.org/) instead of Ubuntu. (Image size is ~400MB instead of ~900MB for the all versions image). You may also use this if you already have calibre installed and can do the EPUB->MOBI or EPUB->PDF conversion elsewhere.

```
$ docker run --rm --volume "$(pwd):/output" captn3m0/google-sre-ebook:epub
```


### Docker Notes

You should see the final EPUB/MOBI/PDF files in the `output` directory after the above runs. The generated files may be owned by the root user.

**NOTE:** You'll have to allow docker access to a directory that's local to your system. The safest way to do this is as follows:

```
$ mkdir /tmp/sreoutput
$ chcon -Rt svirt_sandbox_file_t /tmp/sreoutput
$ docker run --rm --volume "/tmp/sreoutput:/output" captn3m0/google-sre-ebook:latest
```

The build for the above Docker images can be audited at <https://cloud.docker.com/swarm/captn3m0/repository/docker/captn3m0/google-sre-ebook/builds>.

## macOS

Review and run the `bootstrap.sh` script to generate the EPUB, MOBI, and PDF files

Requirements:

-   `brew install pandoc wget ruby`
-   `gem install bundler`
-   `bundle install`
-   `brew cask install calibre`

## Linux

Install the `ruby-bundler`, `pandoc-bin`, `wget`, and `calibre` packages.

## Running Locally

This requires bundler version>=2.0. Once you have the dependencies, just run `./bootstrap.sh`

# Known Issues

-   metadata.xml is not complete. There are just too many authors
-   Foreword/Preface is not part of the index
-   Footnotes on PDFs don't work

# LICENSE

This is licensed under WTFPL. See COPYING file for the full text.
