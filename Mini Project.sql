use IRAcedemy

create table Student_Personal (Std_ID varchar(15) Primary Key, Std_Name varchar(50) Not Null, Std_DOB Date Not Null,Std_Age int Not Null, Std_Street varchar(30) Not Null,Std_State varchar(30) NOT NULL,Std_Countryname VARCHAR(30) default 'MALAYSIA' Not Null, Std_PostalCode INT Not null, Std_Phoneno VARCHAR(15) NOT NULL Unique, Std_Email VARCHAR(25) NOT NULL Unique ,check(Std_Age>0))

select*from Student_Personal


create table Student_Marks ( Std_ID VARCHAR (15) Foreign Key references Student_Personal(Std_ID) on delete cascade on update cascade, Malay int NOT NULL, English int NOT NULL, Science int NOT NULL, Maths int NOT NULL, Arts int NOT NULL, History int NOT NULL, Geography int Not Null, Total int Not Null,AVERAGE	FLOAT Not Null, Result Varchar(5) Not Null,Grade varchar(2) Not Null,check (Malay>0 and Malay <=100),check  (English>0 and English <=100),check (Science>0 and Science <=100),check (Maths>0 and Maths <=100),check (Arts>0 and Arts<=100),check (History>0 and History<=100),check (Geography>0 and Geography<=100),check(Result='PASS'OR Result ='FAIL'))

select*from Student_Marks

--testing add values

insert Student_Personal values (001,'Muhammad','1998-05-27', 24,'54,jlan desa','Negeri Sembilan',default,70450,'017-6553245','Muhammad@gmail.com')
insert Student_Personal values (002,'Haziq','1998-07-25', 24,'102,jlan tamn','Selangor',default,5802,'017-6772111','Haziq@gmail.com'),(003,'Najmi','1998-08-14', 24,'551,jlan forest','perak',default,58742,'017-6753631','Najmi@gmail.com'),(004,'karim','1998-11-11', 24,'201,jlan tamn','Selangor',default,57214,'017-6892541','Karim@gmail.com')

insert Student_Marks  values (001,85,76, 67,74,77,70,85,534,76.29,'PASS','B+')
insert Student_Marks  values (002,90,85,55,77,65,76,87,535,76.42,'PASS','B+'),(003,88,85,95,75,65,92,85,585,83.57,'PASS','A'),(004,90,85,75,94,75,95,85,599,85.57,'PASS','A')
-- Remove item from the List

delete from Student_Personal where Std_ID='009'

--Searching item
Select*from Student_Personal where Std_ID='2'

--display item
SELECT * FROM Student_Personal
LEFT JOIN Student_Marks ON Student_Personal.Std_ID = Student_Marks.Std_ID

--UPDATE TOTAL,AVERAGE,RESULT,GRADE

UPDATE  Student_Marks set Total=  (Malay + English + Science + Maths + Arts + History + Geography)
update Student_Marks set Average=Total/7

update Student_Marks set Malay=97 where Std_ID='3'

select*from Student_Marks


select*from Student_Personal

delete from Student_Marks where Std_ID='005'