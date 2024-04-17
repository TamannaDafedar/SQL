use V#22
select * from student
select * from Trainer

--new location column add 
alter table trainer
add location varchar(40) default 'pune'

--new city column add
alter table trainer 
add city varchar(50) not null default 'BMT'

select * from student
select * from Trainer

--CREATE TABLES
create table MensWare
(
id int,
name varchar(50)
)
insert into MensWare values
(1,'shirt'),(2,'casual shoes'),
(3,'T-Shirt')

create table WomenWare
(
id int,
Name varchar(40)
)
insert into WomenWare values
(1,'skirt'),(2,'casual shoes'),
(3,'Top'),(4,'kurti')

select * from MensWare
select * from WomenWare

--UNION ALL(union all)
--it returnce all merged row from all select statements as it is
select Id,Name from MensWare
union all
Select Id,Name from WomenWare

--UNION(union)
--it returns only unique rows
--it returns sorted resultset
select Id,Name from MensWare
union 
Select Id,name from WomenWare

--faster-union all(only select & and result fast) 
--union-(sort columns)

--Understanding Only
select Id from MensWare
union 
Select Id,name from WomenWare--ERROR

select Name,Id from MensWare
union 
Select Id,name from WomenWare--ERROR
--number of columns should br same in all select statement
--type of columns should be same

--INTRSECT(intersect)
--common rows from all select statement
select Id,Name from MensWare
intersect
select Id,Name from WomenWare

--EXCEPT(except)
--Uncommon rows from frist select statements 
--
select Id,Name from MensWare
except
select Id,Name from WomenWare

select Id,Name from WomenWare
except
select Id,Name from MensWare

--DROP TABLES
drop table MensWare
drop table WomenWare

--CREATE TABLES, add one more column add
create table MensWare
(
Id int,
Name varchar(50),
category varchar(50)
)
insert into MensWare values
(1,'shirt','Ware'),(2,'Casual Ware','Ware'),
(3,'T-Shirt','CasualWare')

create table WomenWare
(
Id int,
Name varchar(40),
City varchar (50)
)
insert into WomenWare values
(1,'skirt','pune'),(2,'Casual Ware','mumbai'),
(3,'top','Baramati'),(4,'kurti','mumbai')

select Id,Name,Category from MensWare
select Id,Name ,city from WomenWare

--use union/union all
--output is combine city,category table no good
select Id,Name,Category from MensWare
union all
Select Id,Name,City from WomenWare

select Id,Name,Category,null as city from MensWare
union all
Select Id,Name,null as category,City from WomenWare

