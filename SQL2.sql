use B22DB
go--seprater

--Table Create
Create Table Student
(
RollNumber int,
Name Varchar(50),
Age int,
Isconfirmed bit
)
/* RollNumber	Name	Age	Isconfirmed */--output

--Inserting records
insert into Student(RollNumber,Name,Age,Isconfirmed)
values(1,'zoya',20,0)
--Another Way
insert into Student values(2,'Tamanna',22,1)

--Selecting Records
select RollNumber,Name,Age,Isconfirmed from Student

-- (*) means All- it returns all
select * from Student--But Not Recommanded Way
/*	RollNumber	Name	Age	   Isconfirmed
		1		zoya	20			0
		2		Tamanna	22			1           */

--dont want Age column
select RollNumber,Name,IsConfirmed from Student
/*	RollNumber	Name	IsConfirmed
		1	    zoya	      0
		2	   Tamanna	      1*/



















