
CREATE TABLE Faculty_login
(
employee_id char(6),
name varchar(30), 
password varchar(20), 
PRIMARY KEY(employee_id)
);

INSERT INTO Faculty_login VALUES('EMP101','Gautam Kumar','gu@cloud');
INSERT INTO Faculty_login VALUES('EMP102','Bhanu Pratap Singh','gu@numerical');
INSERT INTO Faculty_login VALUES('EMP103','Ajay Singh','gu@daa');
INSERT INTO Faculty_login VALUES('EMP104','Pratyush Kumar Deka','gu@android');
INSERT INTO Faculty_login VALUES('EMP105','Ravindra Kumar Chahar','gu@compiler');

SELECT * FROM Faculty_login;

CREATE TABLE Students(
admission_no char(12), 
name varchar(30),
pass varchar(20),
email varchar(40),
CONSTRAINT admsn_no PRIMARY KEY(admission_no)
);

DROP TABLE Students;
SELECT * FROM Students;

//email attribute not inserted 

INSERT INTO Students VALUES('15SCSE105086','Akanksha Singh','akanksha@gu');
INSERT INTO Students VALUES('15SCSE105084','Raunak Tripathi','raunak@gu');
INSERT INTO Students VALUES('15SCSE105152','Baby Kumari','baby@gu');
INSERT INTO Students VALUES('15SCSE105075','Abhishek Tiwari','abhishek@gu');
INSERT INTO Students VALUES('15SCSE105115','Atharva Srivastava','atharva@gu');
INSERT INTO Students VALUES('15SCSE105058','Abhishek Sharma','abhishek@gu');
INSERT INTO Students VALUES('15SCSE105119','Himanshu Mishra','himanshu@gu');
INSERT INTO Students VALUES('15SCSE105093','Deepanshu Pankaj','deepanshu@gu');
INSERT INTO Students VALUES('15SCSE105128','Riya Sharma','riya@gu');
INSERT INTO Students VALUES('15SCSE105158','Pranav Sharma','pranav@gu');
INSERT INTO Students VALUES('15SCSE105056','Amit Nath Singh','amit@gu');
INSERT INTO Students VALUES('15SCSE105011','Sneha Kapoor','sneha@gu');
INSERT INTO Students VALUES('15SCSE105009','Kritika Srivastava','kritika@gu');
INSERT INTO Students VALUES('15SCSE105179','Mohit Kumar Chauhan','mohit@gu');
INSERT INTO Students VALUES('15SCSE105117','Gaurav Srivastava','gaurav@gu');
INSERT INTO Students VALUES('15SCSE105032','Ritu Bhatiya','ritu@gu');
INSERT INTO Students VALUES('15SCSE105106','Ayush Kumar Tiwari','ayushk@gu');
INSERT INTO Students VALUES('15SCSE105024','Aditya Gupta','aditya@gu');
INSERT INTO Students VALUES('15SCSE105060','Abhinav Singh','abhinav@gu');
INSERT INTO Students VALUES('15SCSE107016','Meenal Gupta','meenal@gu');
INSERT INTO Students VALUES('15SCSE105017','Pragyajha','pragyajha@gu');
INSERT INTO Students VALUES('15SCSE105049','Krishna Kant','krishna@gu');
INSERT INTO Students VALUES('15SCSE105140','Adarsh Kumar Singh','adarsh@gu');
INSERT INTO Students VALUES('15SCSE105082','Chandan Kumar Jha','chandan@gu');
INSERT INTO Students VALUES('15SCSE105125','Shubham Chauhan','shubham@gu');
INSERT INTO Students VALUES('15SCSE105186','Saurabh Singh','saurabh@gu');
INSERT INTO Students VALUES('15SCSE105074','Mayank Verma','mayank@gu');
INSERT INTO Students VALUES('15SCSE105092','Ojaswi','ojaswi@gu');
INSERT INTO Students VALUES('15SCSE105048','Ritvik Srivastava','ritvik@gu');
INSERT INTO Students VALUES('15SCSE105076','Rishabh Srivastava','rishabh@gu');
INSERT INTO Students VALUES('15SCSE105035','Ravi Ranjan Kumar','ravi@gu');
INSERT INTO Students VALUES('15SCSE105108','Shuchi Sinha','shuchi@gu');
INSERT INTO Students VALUES('15SCSE105015','Stuti Gupta','stuti@gu');
INSERT INTO Students VALUES('15SCSE105047','Dhananjay Kumar Sharma','dhananjay@gu');
INSERT INTO Students VALUES('15SCSE105063','Aayush Sharma','aayush@gu');
INSERT INTO Students VALUES('14SCSE105093','Swapnil Nigam','swapnil@gu');
INSERT INTO Students VALUES('15SCSE105041','Akash Jha','adkash@gu');
INSERT INTO Students VALUES('15SCSE105100','Kumar Rahul','kumarr@gu');
INSERT INTO Students VALUES('15SCSE105121','Md Shadan Altmash','shadan@gu');
INSERT INTO Students VALUES('15SCSE106013','Rashesh Kumar','rashesh@gu');
INSERT INTO Students VALUES('15SCSE105002','Adarsh Mishra','adarsh@gu');
INSERT INTO Students VALUES('15SCSE105046','Sudhanshu Shukla','sudhanshu@gu');
INSERT INTO Students VALUES('15SCSE105087','Kumar Gaurav Chaubey','kumarg@gu');
INSERT INTO Students VALUES('15SCSE105071','Partha Sarthi Nayak','partha@gu');
INSERT INTO Students VALUES('15SCSE105081','Anup Thakur','anup@gu');
INSERT INTO Students VALUES('15SCSE105097','Yogendra Singh','yogendra@gu');
INSERT INTO Students VALUES('15SCSE105021','Aditya Pratap Singh','aditya@gu');
INSERT INTO Students VALUES('15SCSE107003','Prashansa Saxena','prashansa@gu');
INSERT INTO Students VALUES('15SCSE105095','Rahul Kumar','rahul@gu');
INSERT INTO Students VALUES('15SCSE105129','Ashish Singh','ashish@gu');
INSERT INTO Students VALUES('15SCSE105044','Javed Ali Khan','javed@gu');

CREATE TABLE Attendance(
admission_no char(12),
date date,
Cloud_Computing int,
Numerical_Methods int,
DAA int,
Android int,
Compiler_Design int
);

SELECT * FROM Attendance;

USE sams;
