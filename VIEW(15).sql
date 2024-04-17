use V#22
go
--view is a virtual table
--saved sql query
select * from Student
--view 
--column level security
--create view 
drop View Vw_Student
Create View Vw_Student
as
select * from Student
--execute 
select * from Vw_Student
/*
RollNO	Name	City	Age	Paidfees	Gender	IsConfirmed
1	zoya	bmt	20	10000	female	1
2	Tamanna	bmt	22	20000	female	1
3	adil	pune	22	10000	male	0
4	amin	pune	20	10000	male	0
5	farin	shirigonda	23	15000	female	1
6	shifa	pune	23	10000	female	1
7	adnan	bmt	25	55555	male	0
8	zain	pak	55	54436	female	1
9	veer	pak	10	10000	male	0
10	shahzain	bmt	24	15000	male	1
13	aaa	pune	11	50000	female	1
14	aaa	pune	11	50000	female	1
15	nisba	dubai	23	NULL	female	0*/

Alter View Vw_student
As
Select RollNo,Name ,Gender,City from student

Select * from Vw_student
/*
RollNo	Name	Gender	City
1	zoya	female	bmt
2	Tamanna	female	bmt
3	adil	male	pune
4	amin	male	pune
5	farin	female	shirigonda*/

select * from student

--Row level security
--where condition mai jo mgta vese condition dal sakte hai
Alter View Vw_Student
as 
select RollNo,Name,gender,City from student where IsConfirmed=0

select * from Vw_Student
Select * from student
/*
RollNo	Name	gender	City
	3	adil	male	pune
	4	amin	male	pune
	7	adnan	male	bmt
	9	veer	male	pak
	15	nisba	female	dubai*/

--virtual table kaha se aaya
--view doest not store data 
insert into Student values(16,'jasmin','pune',22,30000,'female',0)
Select * from student
select * from Vw_Student
/*
RollNo	Name	gender	City
	3	adil	male	pune
	4	amin	male	pune
	7	adnan	male	bmt
	9	veer	male	pak
	15	nisba	female	dubai
	16	jasmin	female	pune*/

--view can have multipal underlying based table

select * from Trainer
select * from student1

--i want create view Studnet_name,Rollno,city,trainer,name,experience
--simply use join 
select S.RollNumeber ,S.Name as StudentName,S.city as SCity,
		T.TName,T.Experience 
from Student1 S join Trainer T
on S.TrainerId = T.TID

--create view on this
--jo select Statement mai bolega wo he view mai banega
create view Vw_Trainer_Student
as
select S1.RollNumeber,S1.Name as S_Name,S1.city as S_City,
		T1.TName,T1.Experience
from student1 S1 join Trainer T1
on S1.TrainerId = T1.TID

select * from Vw_Trainer_Student
/*
RollNumeber	S_Name	S_City	TName	Experience
	1		maheera	pune	vikul	13
	2		Tamanna	pune	usha	2
	3		shahveer.pune	vikul	13
	4		shahzain.pune	usha	2
	6		adil	pune	usha	2
	7		shital	pune	vikul	13
	8		zainab	delhi	usha	2
	9		sahil	mumbai	vikul	13
	10		sameer	delhi	usha	2
	11		zoya	USA		vikul	13
	12		kashaf	bmt		vikul	13*/

--can we insert/update/delete records thought view?
--->may or may not be

--insert Records View
--* all column /jo jo clumn chahey wo mention karne or alter kerne ka
Alter view Vw_student
as
select * from student

insert into Vw_Student values(17,'faizal','pune',23,40000,'male',1)
select * from Vw_student
select * from student

--May or may not be
Alter view Vw_Student
as
select RollNO,Name,City,Gender from student
go
select * from Vw_Student
--insert view
insert into Vw_Student values(18,'zoyaaa','masoori','female')
go
select * from Vw_Student
/*
RollNO	Name	City	Gender
	18	zoyaaa	masoori	female*/
select * from student
/*
RollNO	Name	City	Age	Paidfees	Gender	IsConfirmed
18		zoyaaa	masoori	NULL	NULL	female	NULL*/

--Ager iss mai se ek bhi column "not null" hota to
delete from Vw_Student where RollNO =18

select * from Vw_Student
select * from student


select * from trainer
select * from Student1
select * from Vw_Trainer_Student

--soo,plan is 
--1	maheera	pune vikul	13-maheera trainer vikul ka usha hona mgta
--student1-rollno->id=problem create kerne k 
--tariner or student1 mai bhi id cloumn hai

Alter view Vw_Trainer_Student
as
select S1.Id,S1.Name as S_Name,S1.city as S_City,
		T1.TName,T1.Experience
from student1 S1 join Trainer T1
on S1.TrainerId = T1.TID

--update
update Vw_Trainer_Student
set  TName ='usha'
where Id=1

select * from Vw_Trainer_Student
/*
Id	S_Name	S_City	TName	Experience
1	maheera	pune	usha	13
2	Tamanna	pune	usha	2
3	shahveer	pune	usha	13
4	shahzain	pune	usha	2
6	adil	pune	usha	2
7	shital	pune	usha	13
8	zainab	delhi	usha	2
9	sahil	mumbai	usha	13
10	sameer	delhi	usha	2
11	zoya	USA		usha	13
12	kashaf	bmt		usha	13*/
--all records insert usha
--iss liye view insert,update delete k liye use nhi ker sakte
Select * from Trainer
select  * from Student1

Select * from Vw_Student where Gender='male'
select * from Vw_Student where City='pune'

execute sp_help Vw_Student
execute sp_helptext Vw_Student
/*Text  
CREATE view Vw_Student  
as  
select RollNO,Name,City,Gender from student  */

--View Encription/with Encryption
--defination schema will gete encrypted

--with Encryption
Alter View Vw_Student
with encryption
as 
select * from Student

execute sp_helptext Vw_Student
--The text for object 'Vw_Student' is encrypted.

Select * from Vw_Student

select * into #temp from student

drop table student
--base table delete huaa to view kya karega-view depent rehta hai based table pr

select * into Student from #temp
select * from Student

--schemabinding-
Alter View Vw_Student
with schemabinding
as
select RollNo,Name,City,Age,Paidfees,Gender,Isconfirmed from dbo.Student

select * from Student
drop table Student
--Cannot DROP TABLE 'Student' because it is being referenced by object 'Vw_Student'.

create view Vw_temp
as
select * from #temp 
--Views or functions are not allowed on temporary tables. Table names that begin with '#' denote temporary tables.

--Q)can we create view based on temporary table-no
--because ,temp table jb tk session hai tb tk hai ,pr view permnant jagah leta

select * from #temp

--order by ker sakte hai kya
--->yes,we can do that all things in view
select * from Vw_Student
select * from Vw_Student order by Gender --work

--but,
Alter View Vw_Student
with schemabinding
as
select RollNo,Name,City,Age,Paidfees,Gender,Isconfirmed from dbo.Student
order by Gender--not allowed
--The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.

--view say,i should be able to provide row level,cloumn level security on mt main table,permnant table


alter view Vw_Student
with schemabinding
as
select top 5 RollNo,Name,City,Age,Paidfees,Gender,Isconfirmed from dbo.Student

select * from Vw_Student--work




























