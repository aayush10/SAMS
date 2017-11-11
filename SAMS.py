import mysql.connector
import datetime
import smtplib
conn = mysql.connector.connect(user='aayush',password='hellomoto',database='sams')
mycursor = conn.cursor()

def faculty_login(user,pas):
    """returns True if correct id and password is passed"""
    try:
        #fetches password for the provided id from database
        mycursor.execute("""SELECT password FROM faculty_login WHERE employee_id=%s""",(user,))
        password = mycursor.fetchone()[0]
    except:
        print("Please enter a valid employee id")
        return
    if password==pas:
        return True
    else:
        return False

def student_login(user,pas):
    try:
        mycursor.execute("SELECT pass FROM Students WHERE admission_no = '{sid}'".format(sid = user))
        if mycursor.fetchall()[0][0] == pas:
            return True
        else:
            return False
    except:
        print("Wrong Username")


def faculty_subject(user):
    """Checks the subject for the faculty"""
    if user =='EMP101' or user == 'emp101':
        return 'Cloud_Computing'
    elif user == 'EMP102' or user == 'emp102':
        return 'Numerical_Methods'
    elif user == 'EMP103' or user == 'emp103':
        return 'DAA'
    elif user == 'EMP104' or user == 'emp104':
        return 'Android'
    elif user == 'EMP105' or user == 'emp105':
        return 'Compiler_Design'

def update_today(user):
    """function to update today's Attendance for the students"""

    today = datetime.date.today().strftime("%Y-%m-%d") #today's date in string format

    #stores admission number of students in a list
    mycursor.execute("SELECT admission_no FROM students")
    t = mycursor.fetchall() #tuples in list
    stud_admission_no = []

    for i in t:
        stud_admission_no.append(i[0]) #extracting admission_no from tuples

    ans = input("All Present?(Y/N) ").upper()
    if ans == 'Y':
        #Inserts all the admission_no in database with subject status as '1'
        for i in stud_admission_no:
            mycursor.execute("INSERT INTO Attendance(admission_no,date,{sub}) VALUES('{i}','{date}',1)".format(sub = user,i=i,date = today))
        print("\nAttendance Updated Successfully!!!")

    else:
        #stores admission number of absenties in a list
        absent=[]
        inp = input("Enter the admission number of absenties: ")
        if inp not in stud_admission_no:
            raise ValueError("admission number doesn't exist")
        absent.append(inp)
        while True:
            inp = input("Enter the admission number: ")
            if inp == 'exit':
                break
            if inp not in stud_admission_no:
                raise ValueError("admission number doesn't exist")
            absent.append(inp)
        print("Attendance Updated Successfully!!")

        #Inserts the absent admission_no in database with subject status as '0'
        for i in absent:
            mycursor.execute("INSERT INTO Attendance(admission_no,date,{sub}) VALUES('{i}','{date}',0)".format(sub=user,i=i,date=today))

        #Updating present students' admission_no
        for i in absent:
            stud_admission_no.remove(i) #removes the absent students from the list

        #Inserts the remaining(present students) admission_no in the database with subject status as '1'
        for i in stud_admission_no:
            mycursor.execute("INSERT INTO Attendance(admission_no,date,{sub}) VALUES('{i}','{date}',1)".format(sub = user,i=i,date = today))
    conn.commit()

def check_attendance(user):
    """Checks the overall attendance of the student"""

    admission_no = input("\nEnter the admission number of the student: ")

    start_date = input("\nEnter the start date('yyyy-mm-dd'): ")

    end_date = input("\nEnter the end date('yyyy-mm-dd'): ")

    try:
        mycursor.execute("SELECT SUM({sub}) FROM Attendance WHERE admission_no = '{adm}' AND (date>='{start}' AND date<='{end}')".format(sub=user,adm=admission_no,start=start_date,end=end_date))
        print(mycursor.fetchall()[0][0])
    except:
        print("Incorrect admission number or date format!")

def update_anyday(user):
    """Updates the attendance of at studend for a particular date"""

    admission_no = input("\nEnter the admission number of the student: ")

    date = input("\nEnter the date('yyyy-mm-dd'): ")
    try:
        mycursor.execute("UPDATE Attendance SET {sub} = 1 WHERE admission_no = '{adm}' AND date = '{date}'".format(sub=user,adm=admission_no,date=date))
        conn.commit()
        print("\nAttendance Updated Successfully\n")
    except:
        print("Incorrect admission number or date format!")

def fchoice(ch,eid):
    """Calls the function which user enters as choice"""
    user = faculty_subject(eid) #subject related to the faculty
    if ch==1:
        update_today(user)
    elif ch==2:
        check_attendance(user)
    elif ch==3:
        update_anyday(user)

def schoice(ch,sid):
    if ch == 1:
        check_subject_wise(sid)
    elif ch == 2:
        check_today(sid)

def check_subject_wise(sid):
    print("1. Cloud Computing")
    print("\n2. Numerical Methods")
    print("\n3. Design and analysis of algorithms")
    print("\n4. Mobile apps for android")
    print("\n5. Compiler Design")
    print("\n6. CHECK OVERALL")
    inp = int(input("Enter your choice: "))

    try:
        mycursor.execute("SELECT SUM(Cloud_Computing) FROM Attendance WHERE admission_no='{adm}'".format(adm = sid))
        cloud = int(mycursor.fetchall()[0][0])
    except:
        cloud = "Not Marked"

    try:
        mycursor.execute("SELECT SUM(Numerical_Methods) FROM Attendance WHERE admission_no='{adm}'".format(adm = sid))
        numerical = int(mycursor.fetchall()[0][0])
    except:
        numerical = "Not Marked"

    try:
        mycursor.execute("SELECT SUM(Daa) FROM Attendance WHERE admission_no='{adm}'".format(adm = sid))
        daa = int(mycursor.fetchall()[0][0])
    except:
        daa = "Not Marked"

    try:
        mycursor.execute("SELECT SUM(Android) FROM Attendance WHERE admission_no='{adm}'".format(adm = sid))
        android = int(mycursor.fetchall()[0][0])
    except:
        android = "Not Marked"

    try:
        mycursor.execute("SELECT SUM(Compiler_Design) FROM Attendance WHERE admission_no='{adm}'".format(adm = sid))
        compiler = int(mycursor.fetchall()[0][0])
    except:
        compiler = "Not Marked"

    if inp == 1:
        print(cloud)
    elif inp == 2:
        print(numerical)
    elif inp == 3:
        print(daa)
    elif inp == 4:
        print(android)
    elif inp == 5:
        print(compiler)
    elif inp == 6:
        print("Cloud Computing\t\t\t\t",cloud)
        print("Design And Analysis of Algortithms\t", daa)
        print("Numerical Methods\t\t\t",numerical)
        print("Mobile Apps for android\t\t\t",android)
        print("Compiler Design\t\t\t\t",compiler)

def check_today(sid):
    today = datetime.date.today().strftime("%Y-%m-%d")
    try:
        mycursor.execute("SELECT Cloud_Computing FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
        cloud = int(mycursor.fetchall()[0][0])
    except:
        cloud = "Not marked"
    try:
        mycursor.execute("SELECT Numerical_Methods FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
        numerical = int(mycursor.fetchall()[0][0])
    except:
        numerical = "Not Marked"
    try:
        mycursor.execute("SELECT daa FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
        daa = int(mycursor.fetchall()[0][0])
    except:
        daa = "Not marked"
    try:
        mycursor.execute("SELECT android FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
        android = int(mycursor.fetchall()[0][0])
    except:
        android = "Not Marked"
    try:
        mycursor.execute("SELECT compiler FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
        compiler = int(mycursor.fetchall()[0][0])
    except:
        compiler = "Not marked"
    print("Cloud Computing\t\t\t\t",cloud)
    print("Numerical Methods\t\t\t",numerical)
    print("Design and Analysis of Algorithms\t",daa)
    print("Mobile Apps for Android\t\t\t",android)
    print("Compiler Design\t\t\t\t",compiler)

def faculty_authentication(eid,password):
    if faculty_login(eid,password):
        print("\nEnter one of the following options: ")
        print("\n1. Update today's Attendance\n")
        print("\n2. Check Attendance for a particular student\n")
        print("\n3. Update the attendance of a student for a particular date\n")
        ch = int(input())
        if ch >=1 and ch <=3:
            fchoice(ch,eid)
        else:
            print("\nPlease enter from the above choices!!\n")
    else:
        print("\nEnter correct password!")

def student_authentication(sid,spass):
    if student_login(sid,spass):
        print("1. Check attendace for a particular subject ")
        print("\n2. Check today's attendance")
        inp = int(input("Enter your choice: "))
        if inp>0 and inp<3:
            schoice(inp,sid)
        else:
            print("\nPlease enter from above choices!!\n")
    else:
        print("\nEnter correct password!!")

def absent(sid):
    """student with more than 4 days off will receive a mail"""
    for i in range(5):
        today_date = datetime.date.today() - datetime.timedelta(days = i)
        today = today_date.strftime("%Y-%m-%d")
        try:
            mycursor.execute("SELECT Cloud_Computing FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
            cloud = int(mycursor.fetchall()[0][0])
        except:
            return
        try:
            mycursor.execute("SELECT Numerical_Methods FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
            numerical = int(mycursor.fetchall()[0][0])
        except:
            return
        try:
            mycursor.execute("SELECT daa FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
            daa = int(mycursor.fetchall()[0][0])
        except:
            return
        try:
            mycursor.execute("SELECT android FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
            android = int(mycursor.fetchall()[0][0])
        except:
            return
        try:
            mycursor.execute("SELECT compiler FROM Attendance WHERE admission_no = '{adm}' AND date = '{date}'".format(adm = sid, date = today))
            compiler = int(mycursor.fetchall()[0][0])
        except:
            return
        total = cloud + numerical + daa + android + compiler
        if total>0:
            return
        else:
            mycursor.execute("SELECT name FROM Students WHERE admission_no = '{adm}'".format(adm = sid))
            name = mycursor.fetchall()[0][0].split()[0]
            mycursor.execute("SELECT email FROM Students WHERE admission_no = '{adm}'".format(adm = sid))
            emailid = mycursor.fetchall()[0][0]
            content = name+", You have been absent for quite a while now. You might want to attend college now.\nThank You!"
            mail = smtplib.SMTP("smtp.gmail.com",587)
            mail.starttls()
            mail.login("sharma.aayush42@gmail.com","")
            mail.sendmail("sharma.aayush42@gmail.com",emailid,content)
            mail.close()

print("1.Teacher\t\t", end = ' ')
print("2.Student")
ans = int(input("Enter your choice: "))
if ans == 1:
    fid = input("Enter id: ")
    fpass = input("Enter password: ")
    faculty_authentication(fid,fpass)
elif ans == 2:
    sid = input("Enter id: ")
    spass = input("Enter password: ")
    student_authentication(sid,spass)
else:
    print("Enter from the above options!")

mycursor.execute("SELECT admission_no FROM students")
t = mycursor.fetchall()
stud_admission_no = []

for i in t:
    absent(i[0]) #calls absent for all students in t
