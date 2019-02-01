# Google SRE Book/s

Generates a EPUB/MOBI/PDF for the Google SRE Book/s.

Original sources are downloaded from https://landing.google.com/sre/books

# Books

## Site Reliability Engineering
<img src="cover/sre-book.jpg" width="320" alt="site reliability engineering cover" >

## The Site Reliability Workbook
<img src="cover/workbook.jpg" width="320" alt="the site reliability workbook cover" >

# Build

## Docker (Preferred)

Requirements:

-   Docker

You can generate either of books using `BOOK_SLUG` variable.

Available values for `BOOK_SLUG`:
  - `sre_book` Site Reliability Engineering.

```
$ docker run --rm --volume "$(pwd):/output" captn3m0/google-sre-ebook:latest -e BOOK_SLUG='sre_book'
```

-   You should see the final EPUB/MOBI/PDF files in the `output` directory after the above runs.
-   The file may be owned by the root user.

**NOTE:** You'll have to allow docker access to a directory that's local to your system. The safest way to do this is as follows:

```
$ mkdir /tmp/sreoutput
$ chcon -Rt svirt_sandbox_file_t /tmp/sreoutput
$ docker run --rm --volume "/tmp/sreoutput:/output" captn3m0/google-sre-ebook:latest -e BOOK_SLUG='sre_book'
```

The build for the above Docker image can be audited at <https://cloud.docker.com/swarm/captn3m0/repository/docker/captn3m0/google-sre-ebook/builds>.

## macOS

Review and run the `bootstrap.sh` script to generate the EPUB, MOBI, and PDF files

Requirements:

-   Ruby
-   `gem install bundler`
-   `bundle install`
-   `brew install pandoc`
-   `brew cask install calibre`
-   `brew install wget`

# Known Issues

-   metadata is not complete. There are just too many authors
-   Foreword/Preface is not part of the index

# LICENSE

This is licensed under WTFPL. See COPYING file for the full text.
