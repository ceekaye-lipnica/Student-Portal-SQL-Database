/*CHELSEA KATE M. LIPNICA
BERNADETTE V. NUNEZ
KENNETH M. ANONUEVO*/

Create Database Student;

Use Student;


Create Table Student (

	Stud_ID varchar (50) not null,
	Fname varchar (50) not null,
	Lname varchar (50) not null,
	Year_lvl varchar (50),
	Stud_Status varchar (50),
	Gender varchar (50),
	Contact_No varchar (50),
	Email_Add varchar (50),
	
 Constraint pk_StID Primary Key (Stud_ID), -- PRIMARY KEY
 constraint uc_studID unique (Stud_ID, Contact_No, Email_Add), -- UNIQUE CONSTRAINT
 constraint chck_Gender check (Gender= 'Female' or Gender= 'Male'), -- CHECK CONSTRAINT
 constraint chck_StudStat check (Stud_Status= 'Irregular' or Stud_Status= 'Regular') -- CHECK CONSTRAINT
);

Create Table Professor (
	
	Prof_ID varchar (50),
	Fname varchar (50),
	Lname varchar (50),
	Gender varchar (50),
	Contact_No varchar (50),
	Email_Add varchar (50),
	Course varchar (50),
	Subj_Desc varchar (50),


	Constraint pk_PrID Primary Key (Prof_ID), -- PRIMARY KEY
	constraint UC_ProfID unique (Prof_ID, Contact_No, Email_Add) --UNIQUE CONSTRAINT
);

Create Table Subject_tbl (
	
	Prof_ID varchar (50),
	Sub_Code varchar (50),
	Sub_Desc varchar (50),
	

	Constraint pk_SubC Primary Key (Sub_Code), -- PRIMARY KEY
	constraint UC_SubID unique (Sub_Code), -- UNIQUE CONSTRAINT
	constraint fk_ProfID foreign key (Prof_ID) references Professor (Prof_ID), -- FOREIGN KEY
);

Create Table Course (
	
	Stud_ID varchar (50),
	Course_ID varchar (50),
	Course_Desc varchar (50),
	Sub_Code varchar (50),

	Constraint pk_CID Primary Key (Course_ID), -- PRIMARY KEY
	constraint fk_StudID foreign key (Stud_ID) references Student (Stud_ID), -- FOREIGN KEY
	constraint fk_SubCode foreign key (Sub_Code) references Subject_tbl (Sub_Code), -- FOREIGN KEY
	constraint UC_CourseID unique (Course_ID) -- UNIQUE CONSTRAINT
);


Create Table Grade (
	
	Stud_ID varchar (50),
	Sub_Code varchar (50),
	Sub_Desc varchar (50),
	F_Grade decimal (18,2),
	G_Status varchar (50),
	
	
	constraint fk_StudentID foreign key (Stud_ID) references Student (Stud_ID), -- FOREIGN KEY
	constraint fk_Sub_Code foreign key (Sub_Code) references Subject_tbl (Sub_Code), -- FOREIGN KEY
	constraint chck_GrdStat check (G_Status= 'Failed' or G_Status= 'Passed' or G_Status= 'Incomplete' or G_Status= 'Inc') -- CHECK CONSTRAINT
);



-- INSERTING 5 RECORDS TO EACH TABLE -- 


		insert into Student (Stud_ID,Fname,Lname,Year_lvl,Stud_Status,Gender,Contact_No,Email_Add)
		values ('S001','DENVER','CELIZ','3RD YEAR','REGULAR','MALE','09424871526','deverB00@gmail.com')
		insert into Student (Stud_ID,Fname,Lname,Year_lvl,Stud_Status,Gender,Contact_No,Email_Add)
		values ('S002','HAROLD','GABRIEL','3RD YEAR','REGULAR','MALE','09424238926','johnG@gmail.com')
		insert into Student (Stud_ID,Fname,Lname,Year_lvl,Stud_Status,Gender,Contact_No,Email_Add)
		values ('S003','MIGUEL','SALAS','3RD YEAR','REGULAR','MALE','09424897326','miggySlS@gmail.com')
		insert into Student (Stud_ID,Fname,Lname,Year_lvl,Stud_Status,Gender,Contact_No,Email_Add)
		values ('S004','MARIE','SAYNO','3RD YEAR','REGULAR','FEMALE','09278371526','anntrisha@gmail.com')
		insert into Student (Stud_ID,Fname,Lname,Year_lvl,Stud_Status,Gender,Contact_No,Email_Add)
		values ('S005','GIA','LABSO','3RD YEAR','REGULAR','FEMALE','09424298426','giaMarquegmail.com')


		
		insert into Professor (Prof_ID,Fname,Lname,Gender,Contact_No,Email_Add,Course,Subj_Desc)
		values ('P1231','ANDREA','ZURBANO','FEMALE','09376289711','zurbanoA@gmail.com','BSIT','DATABASE ADMINISTRATION')
		insert into Professor (Prof_ID,Fname,Lname,Gender,Contact_No,Email_Add,Course,Subj_Desc)
		values ('P1232','LYNEL','TABIEN','MALE','09973629711','lynelTabien@gmail.com','BSIT','INTEGRATED PROGRAMMING')
		insert into Professor (Prof_ID,Fname,Lname,Gender,Contact_No,Email_Add,Course,Subj_Desc)
		values ('P1233','LUISA','FRANCISCO','FEMALE','09376348611','franciscoluisaA@gmail.com','DICT','SYSTEM INTEGRATION AND ARCHITECTURE')
		insert into Professor (Prof_ID,Fname,Lname,Gender,Contact_No,Email_Add,Course,Subj_Desc)
		values ('P1234','TITO','LORETO','MALE','09376283496','titoLoreto98@gmail.com','DCET','IT ELECTIVE')
		insert into Professor (Prof_ID,Fname,Lname,Gender,Contact_No,Email_Add,Course,Subj_Desc)
		values ('P1235','ICON','OBMERGA','FEMALE','099357889711','Obmerga100@gmail.com','BSCS','DATA COMMUNICATION AND ADMINISTRATION')

		insert into Subject_tbl(Prof_ID,Sub_Code,Sub_Desc)
		values ('P1231','COMP 20213','DATABASE ADMINISTRATION')
		insert into Subject_tbl (Prof_ID,Sub_Code,Sub_Desc)
		values ('P1232','COMP 20211','INTEGRATED PROGRAMMING')
		insert into Subject_tbl(Prof_ID,Sub_Code,Sub_Desc)
		values ('P1233','INTE 30033','SYSTEM INTEGRATION AND ARCHITECTURE')
		insert into Subject_tbl (Prof_ID,Sub_Code,Sub_Desc)
		values ('P1234','INTE-E1','IT ELECTIVE')
		insert into Subject_tbl (Prof_ID,Sub_Code,Sub_Desc)
		values ('P1235','COMP 202156','DATA COMMUNICATION AND ADMINISTRATION')

		
		insert into Course (Stud_ID,Course_ID,Course_Desc,Sub_Code)
		values ('S001','DA483','DATABASE ADMINISTRATION','COMP 20213')
		insert into Course (Stud_ID,Course_ID,Course_Desc,Sub_Code)
		values ('S002','IP295','INTEGRATED PROGRAMMING','COMP 20211')
		insert into Course (Stud_ID,Course_ID,Course_Desc,Sub_Code)
		values ('S003','DS400','SYSTEM INTEGRATION AND ARCHITECTURE','INTE 30033')		
		insert into Course (Stud_ID,Course_ID,Course_Desc,Sub_Code)
		values ('S004','STRUC439','IT ELECTIVE','INTE-E1')
		insert into Course (Stud_ID,Course_ID,Course_Desc,Sub_Code)
		values ('S005','DCN987','DATA COMMUNICATION AND ADMINISTRATION','COMP 202156')

		insert into Grade (Stud_ID,Sub_Code,Sub_Desc,F_Grade,G_Status)
		values ('S001','COMP 20213','DATABASE ADMINISTRATION',1.50,'PASSED')
		insert into Grade (Stud_ID,Sub_Code,Sub_Desc,F_Grade,G_Status)
		values ('S002','COMP 20211','INTEGRATED PROGRAMMING',1.5,'PASSED')
		insert into Grade (Stud_ID,Sub_Code,Sub_Desc,F_Grade,G_Status)
		values ('S003','INTE 30033','SYSTEM INTEGRATION AND ARCHITECTURE',1.75,'PASSED')	
		insert into Grade (Stud_ID,Sub_Code,Sub_Desc,F_Grade,G_Status)
		values ('S004','INTE-E1','IT ELECTIVE',1.5,'PASSED')
		insert into Grade (Stud_ID,Sub_Code,Sub_Desc,F_Grade,G_Status)
		values ('S005','INTE-E1','DATA COMMUNICATION AND ADMINISTRATION',1.25,'PASSED')

	Select Stud_ID as [STUDENT ID], 
	Fname + ' ' + Lname as [NAME], 
	Year_lvl as [YEAR LEVEL],
	Stud_Status as [STATUS],
	Gender as GENDER,
	Contact_No as [CONTACT NO.], 
	Email_Add as EMAIL  
	from Student;
	
	Select Stud_ID as [STUDENT ID],
	Course_ID as [COURSE ID],
	Course_Desc as [COURSE DESCRIPTION],
	Sub_Code as [SUBJECT CODE]
	from Course;

	Select Prof_ID as [PROFESSOR ID],
	Fname + ' ' + Lname as [NAME], 
	Gender as GENDER,
	Contact_No as [CONTACT NO.],
	Email_Add as EMAIL,
	Subj_Desc as [SUBJECT],
	Course as [COURSE]
	from Professor;

	Select Sub_Code as [SUBJECT CODE],
	Sub_Desc as [SUBJECT DESCRIPTION],
	Prof_ID as [PROFESSOR ID]
	from Subject_tbl;

	Select Stud_ID as [STUDENT ID],
	Sub_Desc as [SUBJECT],
	F_Grade as [FINAL GRADES],
	G_Status as [REMARKS]
	from Grade;