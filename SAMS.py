import mysql.connector
import datetime
conn = mysql.connector.connect(user='aayush',password='*********',database='sams')
mycursor = conn.cursor()

def login(user,pas):
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

eid = input("\nEnter the username: ")
password = input("\nEnter the password: ")


def choice(ch,eid):
    """Calls the function which user enters as choice"""
    user = faculty_subject(eid) #subject related to the faculty
    if ch==1:
        update_today(user)
    elif ch==2:
        check_attendance(user)
    elif ch==3:
        update_anyday(user)

if login(eid,password):
    print("\nEnter one of the following options: ")
    print("\n1. Update today's Attendance\n")
    print("\n2. Check Attendance for a particular student\n")
    print("\n3. Update the attendance of a student for a particular date\n")
    ch = int(input())
    if ch >=1 and ch <=3:
        choice(ch,eid)
    else:
        print("\nPlease enter from the above choices!!\n")
else:
    print("\nEnter correct password!")
