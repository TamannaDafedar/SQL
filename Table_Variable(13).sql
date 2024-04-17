use V#22
go
declare @id int=10
select @Id
declare @name varchar(40)='zoya'
select @Name
declare @student Table
(
RollNo int,
Name varchar(50),
City varchar(40)
)
--insert into @student values(1,'zoya','bmt'),(2,'shifa','pune')
select * from student

insert into @Student
select RollNumeber,Name,City from student

--Temporary Table Participate in transaction

create table #temp
(
ID int,
Name varchar(40)
)
insert into #temp values(1,'ZOYA'),(2,'TAMANNA')
select * from #temp
go
delete #temp where Id=1
update #temp set id=1 where name='zoya'
select * from #temp

begin transaction
update #temp set Name='TEENA' where Id=1
go
rollback

select * from #temp

--Table Variable participate Transaction

declare @temp table 
(id int,
name varchar(40)
)
insert into @temp VAlues(1,'zoya'),(2,'tamanna')
select * from @temp
begin Transaction
update @temp set name='teenaa' where id=1
rollback
select * from @temp
