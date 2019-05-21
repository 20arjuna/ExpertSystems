#import mechanize
import requests
from bs4 import BeautifulSoup
def getHtmlText(page_link):
    #br = mechanize.Browser()
    page_response = requests.get(page_link, timeout=5)
# here, we fetch the content from the url, using the requests library
    page_content = BeautifulSoup(page_response.content, "html.parser")
    #htmltext = br.open(url)

    return page_content
