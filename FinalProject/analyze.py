from flask import Flask,render_template, Response, request, redirect, url_for
import csv
from subprocess import STDOUT, PIPE
import os.path

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
    # characteristicList = [site] + characteristicList
    # #Writing list to csv
    # with open('static/characteristics.csv', mode='w') as char_file:
    #     char_file = csv.writer(char_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    #     char_file.writerow(characteristicList)

    compile_java('test.java')
    execute_java('test.java', 5)
    return site

def compile_java(java_file):
    subprocess.check_call(['javac', java_file])

def execute_java(java_file, stdin):
    java_class,ext = os.path.splitext(java_file)
    cmd = ['java', java_class]
    proc = subprocess.Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=STDOUT)
    stdout,stderr = proc.communicate(stdin)
    print ('This was "' + stdout + '"')

if __name__ == "__main__":
    app.run()
