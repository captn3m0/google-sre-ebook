from bs4 import BeautifulSoup
import os
import pypub

epub = pypub.Epub('Site Reliability Engineering')


def setup_toc():
    soup = BeautifulSoup(open('./html/index.html'), 'html.parser')
    links = soup.select('.content a ')
    for link in links:
        print(link['href'])
        add_chapter_file(link['href'], link.get_text())

    epub.create_epub(os.path.abspath('./build'))


def add_chapter_file(href, title):
    file_path = href.replace('/sre/book/', 'html/')

    with open(file_path, 'r') as f:
        contents = f.read()
        chapter_soup = BeautifulSoup(contents, 'html.parser')
        chapter_soup = chapter_soup.select_one('.content')
        links = chapter_soup.select_all('a')
        for link in links:
            link.href = link.href.replace('/sre/book/chapters/', '')
        chapter = pypub.create_chapter_from_string(
            chapter_html, url=None, title=title)
        epub.add_chapter(chapter)

setup_toc()
epub.create_epub('./build')
