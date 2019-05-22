from flask import Flask,render_template, Response, request, redirect, url_for, send_file
import json
import getHTML
import articleText
import time
app = Flask(__name__)

@app.route("/")

def hello():

    time.sleep(15)
    return render_template('duck.html')

    #return render_template('facebook2.html')
@app.route('/mainTOSBOT', methods=['POST'])
def mainTOSBOT():
    j = json.loads(request.data.decode())
    sitename = j.get("sitename")
    time.sleep(5)
    print("hello")
    if(sitename.__contains__('facebook')):
        return render_template('facebook1.html')
    elif(sitename.__contains__('duckduck')):
        return render_template('facebook+duckduck.html')
def getPrivacyPolicy():
    j = json.loads(request.data.decode())
    sitename = j.get("sitename")

    from googlesearch import search
    print('running')
    query = sitename + " privacy policy"

    print('entering loop now!')

    if((query.__contains__('google')) or (query.__contains__('youtube')) or (query.__contains__('gmail'))):
        privacy_policy = "http://policies.google.com/privacy?hl=en"
    else:
        for url in search(query, tld='com', lang='en', stop=1):
            privacy_policy=url
    return(privacy_policy)

def scrapePrivacyPolicy(url):

    text_file = open("static/tos.txt", "w")
    text_file.write(articleText.getArticle(url))


if __name__ == "__main__":
    app.run()
