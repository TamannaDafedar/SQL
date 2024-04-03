		use V#22
insert into student values(5,'shifa','bmt',null)
insert into trainer values(3,'atul',2)
--joins
--student name & trainer name
--primary key = Trainer
--foriegn key table = Student 

select name from student
select tname from Trainer

select name,city from student
select tname,tid from Trainer

--inner joins
--inner joins- only common data from both tables
select student.Name as StudentName,city,trainer.tname as TrainerNmae from 
student inner join trainer
on student.TrainerId = Trainer.tid

--alias table name shortcut method
select s.name as StudentName,t.TName as TrainerName
from student s inner join Trainer t
on s.trainerid=t.tId

--by default join=inner joins
select S.Name as StudentName,T.TName as TrainerName
from Student S join Trainer T
on S.TrainerId = T.TId

select * from trainer
select * from student

--output is combine records both the tables 
select *
from Student S join Trainer T 
on s.TrainerId=T.TID

--output is student tables records only (null records not display)
select s.*
from Student S join Trainer T 
on s.TrainerId=T.TID

/*outer join 3types
1)left outer join = Student
2)right outer join = Trainer
3)full join 
recommended=use foreign key table as left table*/

--left outer join = left join
--left join table- join k left side ka table =left join = Student
--common data  + uncommon from left table(includes NULL vales)
select S.Name as StudentName,T.TName as TrainerName
from Student S left outer join Trainer T
on S.TrainerId = T.TId 

select *
from Student S  left outer join Trainer T
on S.TrainerId = T.TId 

/*2)right outer join = right join
right join table-join k right side ka table =right join = Trainer
common data + uncommon from right table(inclueds NULL values from right side table)*/
select S.Name as StudentName,T.TName as TrainerName 
from Student S right outer join Trainer T
on S.TrainerId = T.TId

select *
from Student S right outer join Trainer T
on S.TrainerId = T.TId

/*3)full join 
common + uncommon data from both the sides*/
select S.Name as studentname ,T.TName as TrainerName
from Student S full join Trainer T
on s.TrainerId = T.TId

select *
from Student S full join Trainer T
on s.TrainerId = T.TId

--uncommon from left table 
select * from student where TrainerId is null
--but still we use left join

/*using left join 
where right table primary key is null*/
select S.name as StudentName,T.TName as TrainerName 
from Student S left join Trainer T
on S.TrainerId = T.TID
where TrainerId is null

-- all tables records
select * 
from Student S left join Trainer T
on S.TrainerId = T.TID
where TrainerId is null


/*using right join 
where left table primary key is null*/
select S.name as StudentName ,T.TName as TrainerName 
from Student S right join Trainer t
on s.Trainerid = T.Tid
where s.RollNumeber is null

--all  
select *
from Student S right join Trainer T
on S.TrainerId = T.Tid
where  s.RollNumeber is null

select * from student
select * from Trainer

--using full join 
--where left table primary key is null & right table Primary key is null
--Uncommon from both the tables 
select * 
from Student S full Join Trainer T
on S.TrainerId = T.Tid
where t.tid is null or s.RollNumeber is null

--cross Join
--it maps each row of one table with each row of another table(Ex.5*3=15)
select s.Name as StudentName, T.tName as TrainerName
from Student S cross join Trainer T
--on S.Trainerid = t.Tid (noo need to write on condition in cross join)

--It is not mandatory to have primary key-foriegn key relation to apply join*

--interview Example
create table table1(col1 char(1))
insert into table1 values('a'),('b'),('c')
go
drop table table2
create table table2(col1 char(1))
insert into table2 values ('a'),('a'),('b'),('d'),('e')
go
select * from table1
select * from table2

--inner join
select t1.col1,t2.col1
from Table1 t1 inner join Table2 t2
on t1.col1 = t2.col1

--outer join
--1)left outer join
select t1.col1,t2.col1
from Table1 t1 left outer join Table2 t2
on t1.col1=t2.col1

--2)right outer join
select t1.col1 as TC1,t2.col1 as TC2
from Table1 t1 Right join Table2 t2
on t1.col1=t2.col1

--3)full join
select t1.col1 as TC1,t2.col1 as TC2 
from Table1 t1 full join Table2 t2
on t1.col1=t2.col1

--Uncommon left side table
select t1.col1,t2.col1
from table1 t1 left outer join table2 t2
on t1.col1 = t2.col1
where T1.col1 is null or t2.col1 is null

--Uncommon right side
select t1.col1,t2.col1
from table1 t1 right outer join table2 t2
on t1.col1 = t2.col1
where t1.col1 is null or t2.col1 is null

--cross join
select t1.col1,t2.col1
from table1 t1 cross join table2 t2
/*on t1.col1=t2.col1 --error(no need to write on condition)*/

select * from trainer
select * from student
go
--one more table add 
create table Course
(
Id int primary key identity,
Name varchar(50),
Duration int,
TrainerId int
)
insert into Course values
('DOTNET',6,1),('INTERSHIPE',1,2),('DOCUMENTATION',1,3)
go
select * from Course
select * from trainer
select * from student
go
--student name,trainer name,course name
--inner join= join
select s.name as StudentName,t.tname as TrainerName,c.name as Coursename
from Student s  join Trainer t
on s.TrainerId = t.Tid
 join course c
on c.TrainerId = t.tid

--left join
select s.name as StudentName,t.tname as TrainerName,c.name as Coursename
from Student s left join Trainer t
on s.TrainerId = t.Tid
left join course c
on c.TrainerId = t.tid

--right join
select s.name as StudentName,t.tname as TrainerName,c.name as Coursename
from Student s right join Trainer t
on s.TrainerId = t.Tid
right join course c
on c.TrainerId = t.tid

-- full join
select s.name as StudentName,t.tname as TrainerName,c.name as Coursename
from Student s full join Trainer t
on s.TrainerId = t.Tid
full join course c
on c.TrainerId = t.tid

--
select trainerid,count(RollNumeber) from Student group by Trainerid

--trainer name by groups
select t.TName as TrainerName,count(s.RollNumeber)as Total 
from student s join trainer t
on s.TrainerId = t.tid
group by t.TName

select t.TName as TrainerName,count(s.RollNumeber)as Total 
from student s right join trainer t
on s.TrainerId = t.tid
group by t.TName
























































































































































































































































































































