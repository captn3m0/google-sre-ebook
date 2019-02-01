# Google SRE Books.
declare -A BOOKS
BOOKS=(

    # Site Reliability Engineering
    ["SRE_BOOK"]=$(
        echo '
            BOOK_NAME=sre-book
            BOOK_NAME_FULL=Site Reliability Engineering
            BOOK_FILE=google-sre-book
            BOOK_TOC_URL=https://landing.google.com/sre/sre-book/toc/index.html
        '
    )

    # Site Reliability Workbook
    ["SRW_BOOK"]=$(
        echo '
            BOOK_NAME=workbook
            BOOK_NAME_FULL=The Site Reliability Workbook
            BOOK_FILE=google-sre-workbook
            BOOK_TOC_URL=https://landing.google.com/sre/workbook/toc/index.html
        '
    )

)
