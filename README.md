# Google SRE Book/s

Generates a EPUB/MOBI/PDF for the Google SRE Books. Original sources are downloaded from https://sre.google/books/

Visit the [Releases](https://github.com/captn3m0/google-sre-ebook/releases) page to download the latest release. Go through all the releases, and click "Assets" to view a list of files.

# Books

| Site Reliability Engineering (2016)                                                                                                                       | The Site Reliability Workbook (2018)                                                                                                                       |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a href="https://github.com/captn3m0/google-sre-ebook/releases"><img src="cover/sre-book.jpg" width="320" alt="site reliability engineering cover" /></a> | <a href="https://github.com/captn3m0/google-sre-ebook/releases"><img src="cover/workbook.jpg" width="320" alt="the site reliability workbook cover" /></a> |

The other 2 SRE books are available as PDFs directly from Google:

- [Building Secure & Reliable Systems](https://static.googleusercontent.com/media/sre.google/en/static/pdf/building_secure_and_reliable_systems.pdf)
- [Training Site Reliability Engineers](https://static.googleusercontent.com/media/sre.google/en/static/pdf/training-sre.pdf)

# Build

## Docker (Preferred)

Requirements:

- Docker

You can generate either of books using `BOOK_SLUG` variable.

Available values for _`BOOK_SLUG`_:

- `sre_book` Site Reliability Engineering.
- `srw_book` The Site Reliability Workbook.

```
$ docker run --rm --volume "$(pwd):/output" -e BOOK_SLUG='srw_book' captn3m0/google-sre-ebook:latest
```

- You should see the final EPUB/MOBI/PDF files in the current directory after the above runs.
- The file may be owned by the root user.

**NOTE:** You'll have to allow docker access to a directory that's local to your system. The safest way to do this is as follows:

```
$ mkdir /tmp/sreoutput
$ chcon -Rt svirt_sandbox_file_t /tmp/sreoutput
$ docker run --rm --volume "/tmp/sreoutput:/output" -e BOOK_SLUG='srw_book' captn3m0/google-sre-ebook:latest
```

The build for the above Docker image can be audited at <https://hub.docker.com/repository/docker/captn3m0/google-sre-ebook/builds>.

## macOS / Linux

Requirements:

- Ruby
- `gem install bundler`
- `bundle install`
- `brew install pandoc`
- `brew cask install calibre`
- `brew install wget`

Run either of the following:

```bash
# To download Site Reliability Engineering.
BOOK_SLUG='sre_book' ./generate.sh

# To download The Site Reliability Workbook.
BOOK_SLUG='srw_book' ./generate.sh
```

# Known Issues

- metadata is not complete. There are just too many authors
- Foreword/Preface is not part of the index
- The typesetting is not great and does not match the original. See #22 for a list

# LICENSE

This is licensed under WTFPL. See COPYING file for the full text.

## Extra

I have a list of my E-book publishing related projects at https://captnemo.in/ebooks/.
