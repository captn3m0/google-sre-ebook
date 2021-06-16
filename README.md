# Google SRE Book/s

Generates a EPUB/MOBI/PDF for the Google SRE Books. Original sources are downloaded from https://sre.google/books/

Visit the [Releases](https://github.com/captn3m0/google-sre-ebook/releases) page to download the latest release. Go through all the releases, and click "Assets" to view a list of files.

# Books

| Site Reliability Engineering (2016)                                                                                                                       | The Site Reliability Workbook (2018)                                                                                                                       |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a href="https://github.com/captn3m0/google-sre-ebook/releases"><img src="cover/sre-book.jpg" width="320" alt="site reliability engineering cover" /></a><br> <a href="https://books.google.com/books?id=81UrjwEACAAJ">BUY</a> | <a href="https://github.com/captn3m0/google-sre-ebook/releases"><img src="cover/workbook.jpg" width="320" alt="the site reliability workbook cover" /></a><br> <a href="https://books.google.com/books?id=fElmDwAAQBAJ">BUY</a>|

The other SRE books/reports are available as directly from Google:

- [Building Secure & Reliable Systems](https://sre.google/books/building-secure-reliable-systems/) - [[PDF](https://sre.google/static/pdf/building_secure_and_reliable_systems.pdf)]  [[EPUB](https://sre.google/static/pdf/building_secure_and_reliable_systems.epub)]  [[MOBI](https://sre.google/static/pdf/building_secure_and_reliable_systems.mobi)]  [[BUY](https://www.google.com/books/edition/Building_Secure_and_Reliable_Systems/Kn7UxwEACAAJ?hl=en)]
- [Training Site Reliability Engineers](https://sre.google/resources/practices-and-processes/training-site-reliability-engineers/) - [[PDF](https://sre.google/static/pdf/training-sre.pdf)]  [[EPUB](https://sre.google/static/pdf/training-sre-epub.epub)]
- [SLO Adoption and Usage in SRE](https://sre.google/resources/practices-and-processes/slo-adoption-and-usage/) - [[PDF](https://sre.google/static/pdf/slo-adoption-and-usage-in-sre.pdf)]
- [Practical Guide to Cloud Migration](https://sre.google/resources/practices-and-processes/practical-guide-to-cloud-migration/) - [[PDF](https://sre.google/static/pdf/practical-guide-to-cloud-migration.pdf)]  [[EPUB](https://sre.google/static/pdf/practical-guide-to-cloud-migration.epub)]
- [Creating a Production Launch Plan](https://sre.google/resources/practices-and-processes/production-launch-planning/) - [[PDF](https://sre.google/static/pdf/cplp.pdf)]  [[EPUB](https://sre.google/static/pdf/cplp-epub.zip)]  [[MOBI](https://sre.google/static/pdf/cplp-mobi.zip)]
- [Case Studies in Infrastructure Change Management](https://sre.google/resources/practices-and-processes/infrastructure-change-management/) - [[PDF](https://sre.google/static/pdf/case-studies-infrastructure-change-management.pdf)]
- [A Case Study in Community-Driven Software Adoption](https://sre.google/resources/practices-and-processes/community-driven-software-adoption/) - [[PDF](https://sre.google/static/pdf/community-driven-software-adoption.pdf)]  [[EPUB](https://sre.google/static/pdf/community-driven-software-adoption-epub.zip)]  [[MOBI](https://sre.google/static/pdf/community-driven-software-adoption-mobi.zip)]
- [Incident Metrics in SRE](https://sre.google/resources/practices-and-processes/incident-metrics-in-sre/) - [[PDF](https://sre.google/static/pdf/incident_metrics_in_sre.pdf)]  [[EPUB](https://sre.google/static/pdf/incident_metrics_in_sre.epub)]
- [Engineering Reliable Mobile Applications](https://sre.google/resources/practices-and-processes/engineering-reliable-mobile-applications/) - [[PDF](https://sre.google/static/pdf/engineering-reliable-mobile-applications.pdf)]  [[EPUB](https://sre.google/static/pdf/engineering-reliable-mobile-applications-epub.zip)]  [[MOBI](https://sre.google/static/pdf/engineering-reliable-mobile-applications-mobi.zip)]

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

I have a list of my E-book publishing related projects at https://captnemo.in/ebooks/. Links to other related books can be found at https://github.com/upgundecha/howtheysre#books-1
