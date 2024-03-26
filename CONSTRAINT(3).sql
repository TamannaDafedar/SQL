use V#22
create table student
(
RollNumber int,
Name varchar(50),
Gender varchar(10),
Email varchar(50),
Age int,
city varchar(50),
Course varchar(50)
)
select * from student
go
insert into student values(1,'aaa','female','a@g.com',10,'pune','DOTNET')
insert into student values(2,'bbb','male','b@g.com',20,'BMT','DOTNET')
insert into student values(2,'ccc','female','c@g.com',10,'pune','DOTNET')
insert into student(RollNumber,gender,Email,age,city,course) 
values(1,'female','a@g.com',10,'pune','DOTNET')
select * from student 
go

--primary key
create table student
(
RollNumber int primary key,
Name varchar(50) not null,
Gender varchar(10),
Email varchar(50),
Age int,
city varchar(50),
Course varchar(50)
)
select * from student
go
insert into student values(1,'aaa','female','a@g.com',10,'pune','DOTNET')
insert into student values(2,'bbb','male','b@g.com',20,'BMT','DOTNET')
insert into student values(2,'ccc','female','c@g.com',10,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(3,'ccc','female','a@g.com',10,'pune','DOTNET')
select * from student 
drop table student

-- just practice 

create table student
(
RollNumber int primary key,
Name varchar(50) not null,
Gender varchar(10) not null,
Email varchar(50) not null,
Age int not null,
city varchar(50) not null,
Course varchar(50) not null
)
select * from student
go
insert into student values(1,'aaa','female','a@g.com',10,'pune','DOTNET')
insert into student values(2,'bbb','male','b@g.com',20,'BMT','DOTNET')
insert into student values(3,'ccc','female','c@g.com',10,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(4,'ddd','female','d@g.com',10,'pune','DOTNET')
select * from student 
drop table student
go

-- Unique Key Constrain
create table student
(
RollNumber int primary key,
Name varchar(50) not null,
Gender varchar(10),
Email varchar(50) unique,
Age int,
city varchar(50) ,
Course varchar(50)
)
insert into student values(1,'aaa','female','a@g.com',10,'pune','DOTNET')
insert into student values(2,'bbb','male','b@g.com',11,'pune','DOTNET')
insert into student values(3,'ccc','female','c@g.com',12,'BMT','DOTNET')
insert into student values(4,'ddd','male',null,13,'BMT','DOTNET')
select * from student 
drop table student

--multipal use unique key
create table student
(
RollNumber int primary key,
Name varchar(50) not null,
Gender varchar(10),
Email varchar(50) unique,
Age int,
city varchar(50) unique ,
Course varchar(50)unique
)
insert into student values(1,'aaa','female','a@g.com',10,'pune','DOTNET')
insert into student values(2,'bbb','male','b@g.com',11,'bombay','NET')
insert into student values(3,'ccc','female','c@g.com',12,'BMT','DOT')
insert into student values(4,'ddd','male',null,13,'BMT','DOTNET')
select * from student 
drop table student
go

--default constraint
create table student
(
RollNumber int primary key,
Name varchar(50) not null,
Gender varchar(10),
Email varchar(50),
Age int,
city varchar(50) default 'pune',
Course varchar(50) default 'dont net'
)
select * from student
go
insert into student(RollNumber,Name,Gender,Email,Age) 
values(1,'aaa','female','a@g.com',10)
insert into student(RollNumber,Name,Gender,Email,Age)
values(2,'bbb','male','b@g.com',20)
insert into student (RollNumber,Name,Gender,Email,Age)
values(3,'ccc','female','c@g.com',10)
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(4,'ddd','female','a@g.com',10,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(5,'eee','male','e@g.com',20002,'pune','DOTNET')
select * from student
drop table student

--check constraint
create table student
(
RollNumber int primary key,
Name varchar(50) not null,
Gender varchar(10),
Email varchar(50),
Age int check (Age>=1 and Age<=150),
city varchar(50 ) default 'pune',
Course varchar(30) default 'dont net'
)
select * from student
go
insert into student(RollNumber,Name,Gender,Email,Age) 
values(1,'aaa','female','a@g.com',10)
insert into student(RollNumber,Name,Gender,Email,Age)
values(2,'bbb','male','b@g.com',20)
insert into student (RollNumber,Name,Gender,Email,Age)
values(3,'ccc','female','c@g.com',10)
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(4,'ddd','female','a@g.com',10,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(5,'eee','male','e@g.com',150,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(6,'fff','female','f@g.com',144,'pune','DOTNET')
select * from student
drop table student

--composite key
create table student
(
RollNumber int ,
Name varchar(50) not null,
Gender varchar(10),
Email varchar(50),
Age int check (Age>=1 and Age<=150),
city varchar(50 ),
Course varchar(30) default 'dont net',
primary key(RollNumber,Name)
)
select * from student
go

insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(4,'ddd','female','a@g.com',10,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(4,'eee','male','e@g.com',150,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(6,'eee','female','f@g.com',144,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(6,'ee','female','f@g.com',144,'pune','DOTNET')
insert into student(RollNumber,Name,gender,Email,age,city,course) 
values(6,'ehe','female','f@g.com',144,'pune','DOTNET')


select * from student
drop table student

--exampal
create table customer
(
ID int primary key,
name varchar(50),
site varchar(50)
)
alter table customer
add constraint df_site_name default 'flipkart' for site

alter table customer
add constraint uni_name  for 'name'
insert into customer (id,name) values(1,'zoya')
insert into customer (id,name) values(2,'zoya')
insert into customer (id,name) values(3,'zoya')

select  * from customer








