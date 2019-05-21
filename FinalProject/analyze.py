from flask import Flask,render_template, Response, request, redirect, url_for
app = Flask(__name__)

@app.route("/")
def initialize():
    return render_template('TOSbot.html')

@app.route('/analyzelocal', methods=['POST'])
def analyze():
    print("needledick")
