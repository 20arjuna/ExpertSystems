import csv
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email.utils import COMMASPACE, formatdate
from email import encoders
import smtplib

with open('alumni.csv') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        if (row['School Name'].find('Urbana') != -1 and row['Class of'] == '2018') or (row['School Name'].find('Purdue') != -1 and row['Class of'] == '2018') or (row['School Name'].find('Maryland') != -1):
            fromaddr = '20arjuna@students.harker.org'
            #toaddr = '20arjuna@students.harker.org'
            toaddr = '20arjuna@students.harker.org'

            # instance of MIMEMultipart
            msg = MIMEMultipart()

            # storing the senders email address
            msg['From'] = fromaddr

            # storing the receivers email address
            msg['To'] = toaddr

            # storing the subject
            msg['Subject'] = "Harker Student on College Visit"

            # string to store the body of the mail
            if(row['School Name'].find('Urbana') != -1):
                body = "Hey " + row['First Name'] + ","+"\n" +"\n"+ "I am a Junior at Harker and I am considering " + row['School Name'] +" for a CS/CE Major. I am currently visiting the university and will be there this Tuesday from around 9am to 3:30pm. I know its short notice but I was hoping to get your advice and hear your experience at the university if you have a few minutes."+ "\n" +"\n" + "Please let me know if there are specific times that work for you, will try and work around them." + "\n" +"\n" + "Thanks, " +"\n" +"\n" +"Arjun Akkiraju"+"\n" +"408-621-4614"+"\n" +"20arjuna@students.harker.org"
            if(row['School Name'].find('Purdue') != -1):
                body = "Hey " + row['First Name']+ ","+"\n" +"\n" + "I am a Junior at Harker and I am considering " + row['School Name'] +" for a CS/CE Major. I am currently visiting the university and will be there this Wednesday from around 9am to 3:30pm. I know its short notice but I was hoping to get your advice and hear your experience at the university if you have a few minutes."+ "\n" +"\n" + "Please let me know if there are specific times that work for you, will try and work around them." + "\n" +"\n" + "Thanks, " +"\n" +"\n" +"Arjun Akkiraju"+"\n" +"408-621-4614"+"\n" +"20arjuna@students.harker.org"

            if(row['School Name'].find('Maryland') != -1):
                body = "Hey " + row['First Name'] + ","+"\n" +"\n" + "I am a Junior at Harker and I am considering " + row['School Name'] +" for a CS/CE Major. I am currently visiting the university and will be there this Thursday from around 9am to 3:30pm. I know its short notice but I was hoping to get your advice and hear your experience at the university if you have a few minutes."+ "\n" +"\n" + "Please let me know if there are specific times that work for you, will try and work around them." + "\n" +"\n" + "Thanks, " +"\n" +"\n" +"Arjun Akkiraju" +"\n" +"408-621-4614"+"\n" +"20arjuna@students.harker.org"



            # attach the body with the msg instance
            msg.attach(MIMEText(body, 'plain'))

            # open the file to be sent
            # filename1 = file_name1
            # filename2 = file_name2
            # creates SMTP session
            s = smtplib.SMTP('smtp.gmail.com', 587)

            # start TLS for security
            s.starttls()

            # Authentication
            s.login(fromaddr, "xz4g8j")

            # Converts the Multipart msg into a string
            text = msg.as_string()

            # sending the mail
            s.sendmail(fromaddr, toaddr, text)

            # terminating the session
            s.quit()
