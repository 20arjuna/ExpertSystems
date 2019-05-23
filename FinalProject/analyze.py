from flask import Flask,render_template, Response, request, redirect, url_for
import csv, subprocess, os.path, json
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
    execute_java('test.java', json.dumps(characteristicList).encode())
    return site

def compile_java(java_file):
    subprocess.call('javac -classpath ".:/Users/20arjuna/Desktop/Jess71p1/lib/jess.jar" ' + java_file, shell=True)

def execute_java(java_file, stdin):
    java_class,ext = os.path.splitext(java_file)
    cmd = ['java', java_class]
    proc = subprocess.Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=STDOUT)
    stdout,stderr = proc.communicate(stdin)
    print (stdout.decode())

if __name__ == "__main__":
    app.run()
