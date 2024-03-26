use V#22
select * from student
drop table trainer

--foreinge key 
--1.Table for Trainer 
create table Trainer
(
TID int primary key,
TName varchar(50),
Experience int
)
insert into trainer values(1,'vikul',13),(2,'usha',2)
select * from Trainer

-- 2.table Student
create table student
(
RollNumeber int primary key,
Name varchar(50),
city varchar(40),
TrainerId int
)
insert into student values(1,'zoya','pune',1),(2,'Tamanna','pune',2)
insert into student values(3,'shifa','pune',1),(4,'sayma','pune',2)
insert into student values(5,'Adil','BMT',2)
insert into student values(7,'Adiil','BMT',2)
select * from student

--both QUERY RUN
select * from Trainer
select * from student
drop table student
drop table Trainer

--RECREATE FOREIGN KEY TABLE
create table student
(
RollNumeber int primary key,
Name varchar(50),
city varchar(40),
TrainerId int foreign key references Trainer(TID)
)
insert into student values(1,'zoya','pune',1),(2,'Tamanna','pune',2)
insert into student values(3,'shifa','pune',1),(4,'sayma','pune',2)
insert into student values(5,'Adil','BMT',2)
insert into student values(6,'Adnan','BMT',null)

select * from student

--both QUERY RUN
select * from Trainer
select * from student

-- what is try to delete records from student table
delete from student where RollNumeber=3
select * from student

--what is try to delete records from trainer table
delete from Trainer where TId=1 

go
-- cascade referential integrety 4options
-- set NULL using
drop table student
create table student
(
RollNumeber int primary key,
Name varchar(50),
city varchar(40),
TrainerId int  foreign key references Trainer(TId)on delete set default 
)
insert into student values(1,'zoya','pune',1),(2,'Tamanna','pune',2)
insert into student values(3,'shifa','pune',1),(4,'sayma','pune',2)
insert into student values(5,'Adil','BMT',2)
insert into student values(6,'Adnan','BMT',5)

select * from student

--both QUERY RUN
select * from Trainer
select * from student

delete from Trainer where TID=2
drop table student


--set default
drop table student
create table student
(
RollNumeber int primary key,
Name varchar(50),
city varchar(40),
TrainerId int default 2 foreign key references Trainer(TId)on delete set default
)
insert into student values(1,'zoya','pune',1),(2,'Tamanna','pune',2)
insert into student values(3,'shifa','pune',1),(4,'sayma','pune',2)
insert into student values(5,'Adil','BMT',2)
insert into student values(6,'Adnan','BMT',null)
select * from student
--both QUERY RUN
select * from Trainer
select * from student
delete from Trainer where TID=1

--cascade
drop table student
create table student
(
RollNumeber int primary key,
Name varchar(50),
city varchar(40),
TrainerId int  foreign key references Trainer(TId)on delete cascade
)
insert into student values(1,'zoya','pune',1),(2,'Tamanna','pune',2)
insert into student values(3,'shifa','pune',1),(4,'sayma','pune',2)
insert into student values(5,'Adil','BMT',2)
insert into student values(6,'Adnan','BMT',null)

select * from student

--both QUERY RUN
select * from Trainer
select * from student

delete from Trainer where TID=1 
drop table Trainer
















































