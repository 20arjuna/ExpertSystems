from flask import Flask,render_template, Response, request, redirect, url_for
import csv, subprocess, os.path
from subprocess import STDOUT, PIPE

app = Flask(__name__)

@app.route("/")
def initialize():
    return render_template('TOSbot.html')

@app.route('/analyzelocal', methods=['POST'])
def analyze():
    #Getting characterists into a list
    characteristicList = []
    site = request.form.get("url")
    with open('static/siteData.csv') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            if(row['Name'].find(site) != -1):
                for element in row:
                    characteristicList.append(row[element])
    characteristicList.pop(0)

    compile_java('test.java')
    execute_java('test.java', [x.encode('utf-8') for x in characteristicList])
    return site

def compile_java(java_file):
    subprocess.check_call(['javac', java_file])

def execute_java(java_file, stdin):
    java_class,ext = os.path.splitext(java_file)
    cmd = ['java', java_class]
    proc = subprocess.Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=STDOUT)
    stdout,stderr = proc.communicate(stdin)
    print ('This was "' + stdout.decode() + '"')

if __name__ == "__main__":
    app.run()
