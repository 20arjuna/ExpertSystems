from bs4 import BeautifulSoup
import getHTML
def getArticleText(webtext):
    articletext = ""
    #soup = BeautifulSoup(webtext)
    soup = webtext
    pElements = (soup.findAll('p'))
    for tag in soup.findAll('p'):
        try:
            articletext+= str(tag.contents[0])
        except:
            print('not enough there')
        #print("iteration passed " + str(i) )
    return articletext

def getArticle(url):
    htmltext= getHTML.getHtmlText(url)
    return getArticleText(htmltext)
