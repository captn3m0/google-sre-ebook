# Google SRE Book/s

Generates a EPUB/MOBI/PDF for the Google SRE Books. Original sources are downloaded from https://sre.google/books/

Visit the [Releases](https://github.com/captn3m0/google-sre-ebook/releases) page to download the latest release. Go through all the releases, and click "Assets" to view a list of files.

# Books

| Site Reliability Engineering (2016)                                                                                                                       | The Site Reliability Workbook (2018)                                                                                                                       |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <a href="https://github.com/captn3m0/google-sre-ebook/releases"><img src="cover/sre-book.jpg" width="320" alt="site reliability engineering cover" /></a><br> <a href="https://books.google.com/books?id=81UrjwEACAAJ">BUY</a> | <a href="https://github.com/captn3m0/google-sre-ebook/releases"><img src="cover/workbook.jpg" width="320" alt="the site reliability workbook cover" /></a><br> <a href="https://books.google.com/books?id=fElmDwAAQBAJ">BUY</a>|

A few other SRE books/reports are available as directly from Google or publishers. A few links point to Internet Archive. Links marked in 🔻 are currently down.

- [Building Secure & Reliable Systems](https://sre.google/books/building-secure-reliable-systems/) - [[PDF](https://sre.google/static/pdf/building_secure_and_reliable_systems.pdf)]  [[EPUB](https://sre.google/static/pdf/building_secure_and_reliable_systems.epub)]  [[MOBI](https://sre.google/static/pdf/building_secure_and_reliable_systems.mobi)]  [[Google Books](https://www.google.com/books/edition/Building_Secure_and_Reliable_Systems/Kn7UxwEACAAJ?hl=en)] [[Amazon](https://www.amazon.com/dp/B088Y67XG4)] [[Kobo](https://www.kobo.com/in/en/ebook/building-secure-and-reliable-systems)]
- [Training Site Reliability Engineers](https://sre.google/resources/practices-and-processes/training-site-reliability-engineers/) - [[PDF](https://googlesre.page.link/traininggh)]  [[EPUB](https://sre.google/static/pdf/training-sre-epub.epub)]
- [SLO Adoption and Usage in SRE](https://www.oreilly.com/library/view/slo-adoption-and/9781492075370/) - [[PDF](https://web.archive.org/web/20210702035314/https://static.googleusercontent.com/media/sre.google/en//static/pdf/slo-adoption-and-usage-in-sre.pdf)]
- [Practical Guide to Cloud Migration](https://sre.google/resources/practices-and-processes/practical-guide-to-cloud-migration/) - [[PDF](https://sre.google/static/pdf/practical-guide-to-cloud-migration.pdf)]  [[EPUB](https://sre.google/static/pdf/practical-guide-to-cloud-migration.epub)]
- [Creating a Production Launch Plan](https://sre.google/resources/practices-and-processes/production-launch-planning/) - [[PDF](https://googlesre.page.link/plpgh)]  [[EPUB](https://web.archive.org/web/20210702003102/https://sre.google/static/pdf/cplp-epub.zip)]  [[MOBI](https://web.archive.org/web/20210102115046/https://sre.google/static/pdf/cplp-mobi.zip)]
- [Case Studies in Infrastructure Change Management](https://get.oreilly.com/ind_case-studies-in-infrastructure-change-management.html) - [[PDF](https://web.archive.org/web/20210702035412/https://static.googleusercontent.com/media/sre.google/en//static/pdf/case-studies-infrastructure-change-management.pdf)]
- [A Case Study in Community-Driven Software Adoption](https://www.oreilly.com/library/view/a-case-study/9781098114596/) - [[PDF](https://web.archive.org/web/20210702035416/https://static.googleusercontent.com/media/sre.google/en//static/pdf/community-driven-software-adoption.pdf)]  [[EPUB](https://web.archive.org/web/20210702003151/https://sre.google/static/pdf/community-driven-software-adoption-epub.zip)]  [[MOBI](https://web.archive.org/web/20210702003132/https://sre.google/static/pdf/community-driven-software-adoption-mobi.zip)]
- [Incident Metrics in SRE](https://sre.google/resources/practices-and-processes/incident-metrics-in-sre/) - [[PDF](https://static.googleusercontent.com/media/sre.google/en//static/pdf/IncidentMeticsInSre.pdf)]  [[EPUB](https://static.googleusercontent.com/media/sre.google/en//static/pdf/IncidentMeticsInSre.epub)]
- [Engineering Reliable Mobile Applications](https://www.oreilly.com/library/view/engineering-reliable-mobile/9781492057444/) - [[PDF](https://web.archive.org/web/20211011151056/https://static.googleusercontent.com/media/sre.google/en//static/pdf/engineering-reliable-mobile-applications.pdf)]  [[EPUB](https://web.archive.org/web/20210702082730if_/https://sre.google/static/pdf/engineering-reliable-mobile-applications-epub.zip)]  [[MOBI 🔻](https://sre.google/static/pdf/engineering-reliable-mobile-applications-mobi.zip)]

You might also like:

- [Software Engineering at Google](https://abseil.io/resources/swe-book) [[PDF](https://github.com/abseil/abseil.github.io/raw/cd13b21daa6ec74155548241241693198c1b1264/resources/swe_at_google.2.pdf)] [[PDF-Archive](https://archive.softwareheritage.org/browse/content/sha1_git:80ee550c6bda571d4e9f56fc093243d31a90b651/raw/?filename=swe_at_google.2.pdf)] [[Read Online](https://abseil.io/resources/swe-book/html/toc.html)] [[O’Reilly](https://www.oreilly.com/library/view/software-engineering-at/9781492082781/)] [[Amazon](https://www.amazon.com/_/dp/1492082791)] [[Ebooks.com](https://www.ebooks.com/en-in/book/detail/209970024/)] [Generated EPUB/PDF](https://github.com/captn3m0/google-swe-ebook/)

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
$ docker run --rm --volume "/tmp/sreoutput:/output" -e BOOK_SLUG='srw_book' ghcr.io/captn3m0/google-sre-ebook:ruby
```

Builds on [Docker Hub](https://hub.docker.com/r/captn3m0/google-sre-ebook) are no longer maintained.

## macOS / Linux

Requirements:

- Make
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

### PDF options

Any option can be passed to `pandoc` by `PDF_OPT_` prefix, for example:

```sh
PDF_OPT_GEOMETRY=margin=1.5cm \
PDF_OPT_DOCUMENTCLASS=extbook \
PDF_OPT_FONTSIZE=14pt \
PDF_OPT_MAINFONT=LiberationSerif-Regular.ttf \
PDF_OPT_MAINFONTOPTIONS=BoldFont=LiberationSerif-Bold.ttf,ItalicFont=LiberationSerif-Italic.ttf,BoldItalicFont=LiberationSerif-BoldItalic.ttf \
PDF_OPT_MONOFONT=LiberationMono-Regular.ttf \
PDF_OPT_MONOFONTOPTIONS=BoldFont=LiberationMono-Bold.ttf,ItalicFont=LiberationMono-Italic.ttf,BoldItalicFont=LiberationMono-BoldItalic.ttf \
PDF_OPT_SANSFONT=LiberationSans-Regular.ttf \
PDF_OPT_SANSFONTOPTIONS=BoldFont=LiberationSans-Bold.ttf,ItalicFont=LiberationSans-Italic.ttf,BoldItalicFont=LiberationSans-BoldItalic.ttf \
BOOK_SLUG=sre_book ./generate.sh
```

Default options passed to `pandoc` in `generate.sh` are overloaded by `PDF_OPT_` prefix, see `PDF_OPT_GEOMETRY` in above example.

Fonts in above axample are packed to `fonts-liberation2` on **Ubuntu**.

See more details:

* <https://pandoc.org/MANUAL.html#fonts>
* <https://ctan.org/pkg/extsizes>
* <https://ctan.org/pkg/fontspec>

# Known Issues

- metadata is not complete. There are just too many authors
- Foreword/Preface is not part of the index
- The typesetting is not great and does not match the original. See #22 for a list

# LICENSE

This is licensed under WTFPL. See COPYING file for the full text.

## Extra

I have a list of my E-book publishing related projects at https://captnemo.in/ebooks/. Links to other related books can be found at https://github.com/upgundecha/howtheysre#books-1


## 🌐 Web Resources & Aesthetic Symbols Index
- [SYM 1D460](https://clean-aesthetic-fonts-74.pages.dev/symbol/sym-1d460/)
- [SYM 1F92C](https://neon-matrix-fonts-47.pages.dev/symbol/sym-1f92c/)
- [TIKTOK CAPTIONS](https://vintage-lace-symbols-54.pages.dev/vi/tiktok-captions/)
- [SYM 1D422](https://vintage-runic-symbols-53.pages.dev/symbol/sym-1d422/)
- [HEAVY HEART EXCLAMATION](https://coquette-aesthetic-symbols-78.pages.dev/symbol/heavy-heart-exclamation/)
- [SYM 1D424](https://vintage-lace-text-53.pages.dev/symbol/sym-1d424/)
- [SYM 1D493](https://sleek-border-symbols-37.pages.dev/symbol/sym-1d493/)
- [SYM 1D46E](https://anime-sparkle-text-56.pages.dev/symbol/sym-1d46e/)
- [SYM 26CE](https://gothic-bio-fonts-22.pages.dev/symbol/sym-26ce/)
- [SYM 260D](https://synthwave-text-vault-95.pages.dev/symbol/sym-260d/)
- [SYM 1F618](https://techno-hacker-text-43.pages.dev/symbol/sym-1f618/)
- [SYM 1F479](https://chibi-emoticon-lab-65.pages.dev/symbol/sym-1f479/)
- [LATIN CROSS FAITH](https://anime-sparkle-text-56.pages.dev/symbol/latin-cross-faith/)
- [CIRCLED STAR](https://synthwave-bio-maker-62.pages.dev/symbol/circled-star/)
- [SYM 26F2](https://anime-sparkle-text-14.pages.dev/symbol/sym-26f2/)
- [SYM 2746](https://scholarly-runes-text-68.pages.dev/symbol/sym-2746/)
- [NATURE FLOWERS](https://angel-core-bios-50.pages.dev/vi/nature-flowers/)
- [SYM 1D461](https://sleek-type-aesthetic-51.pages.dev/symbol/sym-1d461/)
- [LATIN CROSS FAITH](https://chibi-emoticon-lab-65.pages.dev/symbol/latin-cross-faith/)
- [SYM 2613](https://angel-core-bios-50.pages.dev/symbol/sym-2613/)
- [SYM 262B](https://vintage-script-symbols-65.pages.dev/symbol/sym-262b/)
- [SYM 1F924](https://scholarly-runes-text-68.pages.dev/symbol/sym-1f924/)
- [BORDERS DIVIDERS](https://anime-sparkle-text-56.pages.dev/es/borders-dividers/)
- [SYM 1D42D](https://coquette-aesthetic-symbols-88.pages.dev/symbol/sym-1d42d/)
- [SYM 26E9](https://synthwave-bio-maker-62.pages.dev/symbol/sym-26e9/)
- [SYM 1F976](https://angelic-ribbon-text-78.pages.dev/symbol/sym-1f976/)
- [FOUR POINT STAR SPARKLE](https://scholarly-runes-text-68.pages.dev/symbol/four-point-star-sparkle/)
- [SYM 1F920](https://kawaii-kaomoji-hub-51.pages.dev/symbol/sym-1f920/)
- [SYM 1F47F](https://minimal-star-symbols-95.pages.dev/symbol/sym-1f47f/)
- [SYM 1D46C](https://baroque-aesthetic-symbols-59.pages.dev/symbol/sym-1d46c/)
- [SYM 1F629](https://synthwave-bio-maker-62.pages.dev/symbol/sym-1f629/)
- [ZODIAC CELESTIAL](https://anime-sparkle-text-56.pages.dev/vi/zodiac-celestial/)
- [TRENDING](https://minimal-star-symbols-91.pages.dev/ja/trending/)
- [SYM 1D4A3](https://kawaii-kaomoji-hub-97.pages.dev/symbol/sym-1d4a3/)
- [SYM 1F47B](https://angel-core-bios-50.pages.dev/symbol/sym-1f47b/)
- [SYM 1F49D](https://kawaii-kaomoji-hub-51.pages.dev/symbol/sym-1f49d/)
- [SYM 2625](https://subtle-sparkle-text-86.pages.dev/symbol/sym-2625/)
- [SYM 2745](https://occult-runic-fonts-23.pages.dev/symbol/sym-2745/)
- [SYM 2731](https://vintage-library-text-15.pages.dev/symbol/sym-2731/)
- [SYM 1F62F](https://kawaii-kaomoji-hub-51.pages.dev/symbol/sym-1f62f/)
- [ZODIAC CELESTIAL](https://lace-and-ribbon-text-61.pages.dev/ru/zodiac-celestial/)
- [HIGH VOLTAGE LIGHTNING](https://geometric-bio-symbols-76.pages.dev/symbol/high-voltage-lightning/)
- [SYM 26BD](https://neon-glitch-fonts-25.pages.dev/symbol/sym-26bd/)
- [SYM 1F47A](https://modern-bullet-symbols-45.pages.dev/symbol/sym-1f47a/)
- [SYM 1F637](https://manga-bubble-symbols-94.pages.dev/symbol/sym-1f637/)
- [SYM 26EA](https://gothic-bio-fonts-24.pages.dev/symbol/sym-26ea/)
- [SYM 1D402](https://kawaii-kaomoji-hub-51.pages.dev/symbol/sym-1d402/)
- [SYM 1F616](https://moe-star-emoticons-13.pages.dev/symbol/sym-1f616/)
- [SYM 1F9E1](https://moe-star-emoticons-13.pages.dev/symbol/sym-1f9e1/)
- [LEFT RIGHT EXCHANGE ARROWS](https://sleek-border-symbols-37.pages.dev/symbol/left-right-exchange-arrows/)
- [SYM 26A9](https://clean-line-emojis-77.pages.dev/symbol/sym-26a9/)
- [FREEFIRE NAMES](https://aesthetic-bullet-points-76.pages.dev/es/freefire-names/)
- [WHITE HEART](https://moe-star-emoticons-13.pages.dev/symbol/white-heart/)
- [WHITE SUN WITH RAYS](https://kawaii-kaomoji-hub-51.pages.dev/symbol/white-sun-with-rays/)
- [SYM 1D441](https://clean-line-emojis-77.pages.dev/symbol/sym-1d441/)
- [WINGED ANGELIC COQUETTE HEART](https://kawaii-kaomoji-hub-51.pages.dev/symbol/winged-angelic-coquette-heart/)
- [SYM 1F496](https://coquette-aesthetic-symbols-58.pages.dev/symbol/sym-1f496/)
- [LEFT BLACK LENTICULAR BRACKET](https://occult-runic-fonts-23.pages.dev/symbol/left-black-lenticular-bracket/)
- [SYM 1D444](https://sleek-border-symbols-37.pages.dev/symbol/sym-1d444/)
- [SWIMMING FISH LEFT](https://manga-bubble-symbols-94.pages.dev/symbol/swimming-fish-left/)
- [SYM 1F609](https://synthwave-bio-maker-62.pages.dev/symbol/sym-1f609/)
- [SYM 26EE](https://moe-star-emoticons-13.pages.dev/symbol/sym-26ee/)
- [SYM 1D419](https://lace-and-ribbon-text-61.pages.dev/symbol/sym-1d419/)
- [FREEFIRE NAMES](https://sleek-border-symbols-37.pages.dev/ru/freefire-names/)
- [SYM 1F638](https://moe-kaomoji-vault-94.pages.dev/symbol/sym-1f638/)
- [SYM 26E6](https://moe-star-emoticons-13.pages.dev/symbol/sym-26e6/)
- [SYM 273E](https://zen-aesthetic-fonts-87.pages.dev/symbol/sym-273e/)
- [SYM 26D5](https://anime-sparkle-text-24.pages.dev/symbol/sym-26d5/)
- [SYM 1F63A](https://angel-core-bios-50.pages.dev/symbol/sym-1f63a/)
- [SYM 1F60A](https://neon-matrix-symbols-87.pages.dev/symbol/sym-1f60a/)
- [SYM 267C](https://anime-sparkle-text-51.pages.dev/symbol/sym-267c/)
- [SYM 26C0](https://sleek-line-unicode-29.pages.dev/symbol/sym-26c0/)
- [CAPRICORN ZODIAC GOAT](https://cyber-clan-tags-90.pages.dev/symbol/capricorn-zodiac-goat/)
- [LATIN CROSS HEAVY](https://angel-core-bios-50.pages.dev/symbol/latin-cross-heavy/)
- [SYM 26CF](https://minimal-star-symbols-43.pages.dev/symbol/sym-26cf/)
- [SYM 1F619](https://chibi-emoticon-vault-78.pages.dev/symbol/sym-1f619/)
- [CUTE BUNNY RABBIT FACE](https://vintage-coquette-text-58.pages.dev/symbol/cute-bunny-rabbit-face/)
- [SYM 1F498](https://vintage-coquette-text-58.pages.dev/symbol/sym-1f498/)
- [SYM 1F60E](https://anime-sparkle-text-81.pages.dev/symbol/sym-1f60e/)
- [INSTAGRAM BIO](https://scholarly-runes-text-68.pages.dev/ja/instagram-bio/)
- [SYM 1D41C](https://vintage-scholarly-text-77.pages.dev/symbol/sym-1d41c/)
- [SKULL AND CROSSBONES](https://vintage-scholarly-text-77.pages.dev/symbol/skull-and-crossbones/)
- [SYM 1D471](https://minimal-star-symbols-91.pages.dev/symbol/sym-1d471/)
- [DISCORD STATUS](https://lace-and-ribbon-text-61.pages.dev/pt/discord-status/)
- [TIKTOK CAPTIONS](https://theeduplaycampen.pages.dev/es/tiktok-captions/)
- [RINGED PLANET SATURN](https://scholarly-runes-text-68.pages.dev/symbol/ringed-planet-saturn/)
- [SYM 1F642 200D 2194 FE0F](https://subtle-arrow-fonts-98.pages.dev/symbol/sym-1f642-200d-2194-fe0f/)
- [ARROWS LINES](https://lace-and-ribbon-text-61.pages.dev/es/arrows-lines/)
- [SYM 1D49C](https://geometric-bio-symbols-76.pages.dev/symbol/sym-1d49c/)
- [SYM 1F917](https://synthwave-bio-maker-62.pages.dev/symbol/sym-1f917/)
- [STAR OPERATOR](https://angel-core-bios-50.pages.dev/symbol/star-operator/)
- [LEFT BLACK LENTICULAR BRACKET](https://zen-aesthetic-fonts-87.pages.dev/symbol/left-black-lenticular-bracket/)
- [MUSIC WEATHER](https://synthwave-bio-maker-62.pages.dev/ja/music-weather/)
- [SYM 26BB](https://minimal-star-symbols-91.pages.dev/symbol/sym-26bb/)
- [JA](https://vintage-coquette-text-58.pages.dev/ja/)
- [LEFT HEAVY BRACKET BOX](https://angel-core-bios-50.pages.dev/symbol/left-heavy-bracket-box/)
- [ROBLOX NAMES](https://scholarly-runes-text-68.pages.dev/es/roblox-names/)
- [SYM 1D459](https://angelic-bio-symbols-59.pages.dev/symbol/sym-1d459/)
- [SYM 1D433](https://mystic-occult-unicode-49.pages.dev/symbol/sym-1d433/)
- [SYM 1D400](https://chibi-emoticon-lab-65.pages.dev/symbol/sym-1d400/)
- [FREEFIRE NAMES](https://chibi-emoticon-vault-78.pages.dev/vi/freefire-names/)
- [STARS](https://scholarly-runes-text-68.pages.dev/ru/stars/)
- [SYM 2633](https://subtle-sparkle-text-86.pages.dev/symbol/sym-2633/)
- [SYM 1D482](https://soft-bow-fonts-22.pages.dev/symbol/sym-1d482/)
- [HOLLOW STAR](https://vintage-library-text-15.pages.dev/symbol/hollow-star/)
- [SYM 2610](https://kawaii-kaomoji-hub-97.pages.dev/symbol/sym-2610/)
- [ZODIAC CELESTIAL](https://zen-aesthetic-fonts-87.pages.dev/vi/zodiac-celestial/)
- [SYM 2633](https://kawaii-kaomoji-hub-97.pages.dev/symbol/sym-2633/)
- [GAMING WEAPONS](https://moe-star-emoticons-13.pages.dev/pt/gaming-weapons/)
- [SYM 267A](https://theeduplaycampen.pages.dev/symbol/sym-267a/)
- [ARROWS LINES](https://scholarly-runes-text-68.pages.dev/ja/arrows-lines/)
- [SYM 2689](https://gothic-bio-fonts-50.pages.dev/symbol/sym-2689/)
- [SYM 1D42B](https://ethereal-goth-symbols-29.pages.dev/symbol/sym-1d42b/)
- [BRACKETS](https://zen-aesthetic-fonts-87.pages.dev/brackets/)
- [SYM 1F92E](https://anime-sparkle-text-73.pages.dev/symbol/sym-1f92e/)
- [ARROWS LINES](https://minimal-star-symbols-43.pages.dev/pt/arrows-lines/)
- [SYM 2635](https://minimal-star-symbols-91.pages.dev/symbol/sym-2635/)
- [SYM 1F603](https://kawaii-kaomoji-hub-97.pages.dev/symbol/sym-1f603/)
- [SYM 1D452](https://kawaii-kaomoji-hub-80.pages.dev/symbol/sym-1d452/)
- [SYM 26BE](https://moe-star-emoticons-13.pages.dev/symbol/sym-26be/)
- [SYM 1FAE4](https://sleek-line-unicode-29.pages.dev/symbol/sym-1fae4/)
- [SYM 26A7](https://gothic-bio-fonts-50.pages.dev/symbol/sym-26a7/)
- [SYM 1F64A](https://minimal-star-symbols-43.pages.dev/symbol/sym-1f64a/)
- [SYM 1D410](https://kawaii-kaomoji-hub-99.pages.dev/symbol/sym-1d410/)
- [SYM 1F922](https://scholarly-runes-text-68.pages.dev/symbol/sym-1f922/)
- [SYM 1FAE5](https://clean-line-emojis-77.pages.dev/symbol/sym-1fae5/)
- [SYM 2686](https://zen-aesthetic-fonts-87.pages.dev/symbol/sym-2686/)
- [SYM 1D41F](https://manga-bubble-symbols-94.pages.dev/symbol/sym-1d41f/)
- [SYM 1D462](https://mystic-occult-unicode-49.pages.dev/symbol/sym-1d462/)
- [NATURE FLOWERS](https://minimal-star-symbols-43.pages.dev/pt/nature-flowers/)
