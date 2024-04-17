use V#22
go
select * from Trainer
select * from Student
go
insert into Trainer values('sayma',2,'pune','pune')

execute sp_help Trainer
execute sp_help student
go
insert into Trainer values(4,'sayma',2,'pune','pune')
go 
select * from Trainer

/*insert into ABCD values(4,'sayma',2,'pune','pune') 
it insert records only if table is there*/ 

--select into command
--it creates table and copy records
--it does not need exisiting table to copy records

select Id,Name,Experience from Trainer 
--i want to copy trainer data into a temporary table
--Step-1=create a temporary table 
create table #Trainer
(
TId int,
TName varchar(50),
Experience int
)
drop table #trainer
--Step-1=inser records into temporary table
select * from #Trainer
go
insert into #Trainer
select TID , TName, Experience from Trainer
go
select * from #Trainer

--Select into use both tables(permant table,temporary table )
--it will create automatic table from this query

select TId,TName,Experience into #NewTrainer from Trainer
select * From #NewTrainer

select * into #Trainer1 from Trainer
select * From #Trainer1

--permnat table
select TId,TName,Experience into NewTrainer from Trainer
select * From NewTrainer

select * into student1 from student
select * From student1

select * into Student2 from Student where city='pune'
select * from Student2

--only schema without coping records
select * into student3 from student where 1<>1
select * from student3

--backup in different database
create database V#22_Archived 

select * into V#22_Archived.dbo.studdentbackup from student
select * from studdentbackup --Invalid object name 'V#22_Archived'.

use V#22_Archived
select * from studdentbackup

--take table backup on another server database(linked server)
--select * into [server-ip].V#22.dbo.studdentbackup from student


