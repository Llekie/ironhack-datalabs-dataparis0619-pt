import requests
from bs4 import BeautifulSoup
import os
from slugify import slugify
import multiprocessing
def index_page(link) :
        try:
            contentLink = requests.get(link).text
            slugyLink = slugify(link) + '.html'
            f = open(slugyLink, 'w', encoding='utf-8')
            f.write(contentLink)
        except:
            pass

if __name__ == '__main__':
    url = 'https://en.wikipedia.org/wiki/Data_science'
    html = requests.get(url).content
    soup = BeautifulSoup(html, "lxml")
    table = soup.find_all('a')
    links = [link.get('href') for link in table][1:]
    domain = 'http://wikipedia.org'
    absLinks = [y for y in links if "http" in y and "%" not in y]
    relatLinks = [domain + y for y in links if "%" not in y and y.startswith("/")]
    totalLinks = relatLinks + absLinks
    totalLinks = list(set(totalLinks))
    #if not os.path.exists('wikipedia'):
    #    os.makedirs('wikipedia')
    #os.chdir('wikipedia')
    pool = multiprocessing.Pool()
    result = pool.map(index_page, totalLinks)
    pool.terminate()
    pool.join()