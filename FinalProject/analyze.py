from flask import Flask,render_template, Response, request, redirect, url_for
from googlesearch import search
import csv

app = Flask(__name__)

@app.route("/")
def initialize():
    return render_template('TOSbot.html')

@app.route('/analyzelocal', methods=['POST'])
def analyze():
    characteristicList = []
    site = request.form.get("url")
    with open('static/siteData.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            if(row['Name'].find(site) != -1):
                for element in row:
                    characteristicList.append(row[element])
    characteristicList.pop(0)


    return site

if __name__ == "__main__":
    app.run()
