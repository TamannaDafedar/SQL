use V#22
declare @MObile bigint=7479557777
print @Mobile

select * from student
drop table student

--import excel file to database
create table student
(
RollNO int primary key,
Name varchar(50),
City varchar(35),
Age int,
Paidfees int,
Gender varchar(20),
IsConfirmed bit
)
--this is for stored procedure
insert into student values
(1,'zoya','bmt',20,10000,'female',1),
(2,'Tamanna','bmt',22,20000,'female',1),
(3,'adil','pune',22,10000,'male',0),
(4,'amin','pune',20,10000,'male',0),
(5,'farin','shirigonda',23,15000,'female',1),
(6,'shifa','pune',23,10000,'male',1)

select *  from student
drop table student
go
--Gendar values NULL
--insert into student(Gender) values(1) 
--update student set Gender=female where RollNo=2
select * from student
drop table student











