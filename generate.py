from bs4 import BeautifulSoup
import os
import pypub

epub = pypub.Epub('Site Reliability Engineering')
root = os.getcwd()


def setup_toc():
    os.chdir('html/toc')
    soup = BeautifulSoup(open('index.html'), 'html.parser')
    links = soup.select('.content a')
    for link in links:
        if link.has_attr('class') and 'menu-buttons' not in list(link['class']):
            add_chapter_file(link['href'], link.get_text())

    epub.create_epub('build')


def add_chapter_file(href, title):
    with open(href, 'r') as f:
        contents = f.read()
        # print(len(contents))
        chapter_soup = BeautifulSoup(contents, 'html.parser')
        chapter_soup = chapter_soup.select_one('.content')
        chapter = pypub.create_chapter_from_string(
            str(chapter_soup), url=None, title=title)
        epub.add_chapter(chapter)


setup_toc()
os.chdir(root)
epub.create_epub('build')
