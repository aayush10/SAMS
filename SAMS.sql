
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
INSERT INTO Faculty_login VALUES('EMP104','PratyUSE sams;
ush Kumar Deka','gu@android');
INSERT INTO Faculty_login VALUES('EMP105','Ravindra Kumar Chahar','gu@compiler');

SELECT * FROM Faculty_login;

CREATE TABLE Students(
admission_no char(12), 
name varchar(30),
CONSTRAINT admsn_no PRIMARY KEY(admission_no)
);

SELECT * FROM Students;

INSERT INTO Students VALUES('15SCSE105086','Akanksha Singh');
INSERT INTO Students VALUES('15SCSE105084','Raunak Tripathi');
INSERT INTO Students VALUES('15SCSE105152','Baby Kumari');
INSERT INTO Students VALUES('15SCSE105075','Abhishek Tiwari');
INSERT INTO Students VALUES('15SCSE105115','Atharva Srivastava');
INSERT INTO Students VALUES('15SCSE105058','Abhishek Sharma');
INSERT INTO Students VALUES('15SCSE105119','Himanshu Mishra');
INSERT INTO Students VALUES('15SCSE105093','Deepanshu Pankaj');
INSERT INTO Students VALUES('15SCSE105128','Riya Sharma');
INSERT INTO Students VALUES('15SCSE105158','Pranav Sharma');
INSERT INTO Students VALUES('15SCSE105056','Amit Nath Singh');
INSERT INTO Students VALUES('15SCSE105011','Sneha Kapoor');
INSERT INTO Students VALUES('15SCSE105009','Kritika Srivastava');
INSERT INTO Students VALUES('15SCSE105179','Mohit Kumar Chauhan');
INSERT INTO Students VALUES('15SCSE105117','Gaurav Srivastava');
INSERT INTO Students VALUES('15SCSE105032','Ritu Bhatiya');
INSERT INTO Students VALUES('15SCSE105106','Ayush Kumar Tiwari');
INSERT INTO Students VALUES('15SCSE105024','Aditya Gupta');
INSERT INTO Students VALUES('15SCSE105060','Abhinav Singh');
INSERT INTO Students VALUES('15SCSE107016','Meenal Gupta');
INSERT INTO Students VALUES('15SCSE105017','Pragyajha');
INSERT INTO Students VALUES('15SCSE105049','Krishna Kant');
INSERT INTO Students VALUES('15SCSE105140','Adarsh Kumar Singh');
INSERT INTO Students VALUES('15SCSE105082','Chandan Kumar Jha');
INSERT INTO Students VALUES('15SCSE105125','Shubham Chauhan');
INSERT INTO Students VALUES('15SCSE105186','Saurabh Singh');
INSERT INTO Students VALUES('15SCSE105074','Mayank Verma');
INSERT INTO Students VALUES('15SCSE105092','Ojaswi');
INSERT INTO Students VALUES('15SCSE105048','Ritvik Srivastava');
INSERT INTO Students VALUES('15SCSE105076','Rishabh Srivastava');
INSERT INTO Students VALUES('15SCSE105035','Ravi Ranjan Kumar');
INSERT INTO Students VALUES('15SCSE105108','Shuchi Sinha');
INSERT INTO Students VALUES('15SCSE105015','Stuti Gupta');
INSERT INTO Students VALUES('15SCSE105047','Dhananjay Kumar Sharma');
INSERT INTO Students VALUES('15SCSE105063','Aayush Sharma');
INSERT INTO Students VALUES('14SCSE105093','Swapnil Nigam');
INSERT INTO Students VALUES('15SCSE105041','Akash Jha');
INSERT INTO Students VALUES('15SCSE105100','Kumar Rahul');
INSERT INTO Students VALUES('15SCSE105121','Md Shadan Altmash');
INSERT INTO Students VALUES('15SCSE106013','Rashesh Kumar');
INSERT INTO Students VALUES('15SCSE105002','Adarsh Mishra');
INSERT INTO Students VALUES('15SCSE105046','Sudhanshu Shukla');
INSERT INTO Students VALUES('15SCSE105087','Kumar Gaurav Chaubey');
INSERT INTO Students VALUES('15SCSE105071','Partha Sarthi Nayak');
INSERT INTO Students VALUES('15SCSE105081','Anup Thakur');
INSERT INTO Students VALUES('15SCSE105097','Yogendra Singh');
INSERT INTO Students VALUES('15SCSE105021','Aditya Pratap Singh');
INSERT INTO Students VALUES('15SCSE107003','Prashansa Saxena');
INSERT INTO Students VALUES('15SCSE105095','Rahul Kumar');
INSERT INTO Students VALUES('15SCSE105129','Ashish Singh');
INSERT INTO Students VALUES('15SCSE105044','Javed Ali Khan');

CREATE TABLE Attendance(
admission_no char(12),
date date,
Cloud_Computing int,
Numerical_Methods int,
DAA int,
Android int,
Compiler_Design int
);


INSERT INTO Attendance VALUES('15SCSE105084',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105152',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105075',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105115',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105058',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105119',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105093',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105128',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105158',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105056',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105011',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105009',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105179',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105117',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105032',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105106',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105024',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105060',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE107016',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105017',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105049',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105140',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105082',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105125',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105186',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105074',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105092',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105048',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105076',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105035',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105108',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105015',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105047',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105063',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('14SCSE105093',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105041',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105100',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105121',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE106013',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105002',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105046',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105087',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105071',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105081',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105097',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105021',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE107003',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105095',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105129',null,0,0,0,0,0);
INSERT INTO Attendance VALUES('15SCSE105044',null,0,0,0,0,0);

SELECT * FROM Attendance;

DROP TABLE attendance;


USE sams;







CREATE TABLE Test(
admission_no char(12),
date date,
Cloud_Computing int,
Numerical_Methods int,
DAA int,
Android int,
Compiler_Design int
);

INSERT INTO Test VALUES('15scse105063','2017-11-07',0,0,0,0,0);
INSERT INTO Test VALUES('15scse105063','2017-11-06',0,0,0,0,0);
INSERT INTO Test VALUES('15scse105063','2017-11-05',0,0,0,0,0);
INSERT INTO Test VALUES('15scse105163','2017-11-07',0,0,0,0,0);
SELECT SUM(Cloud_Computing) FROM Test WHERE admission_no = '15SCSE105063' AND date <= '2017-11-07';

SELECT * FROM test;
DROP TABLE test;