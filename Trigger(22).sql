use V#22

--Trigger
--special type of stored procedure
--triggers we can create from commands like DML,DDL,action like logon
/* HINDI(trigger says-tune jis cammand k uper likha honga naa wo agar cammand tune execute  
				kiya na to wo O cammand k sath mai bhi execute houga)*/

go
select * from student1
--inserting records in student1
insert into student1 values(6,'tina','pune',2)--(7,'shital','pune',1)

select * from student1

--create a trigger for student table insert command
--jb bhi student table pr koi insert karega tb trigger ka query fire hone mgta


/*two types of trigger
1-for or after trigger
2-instead of trigger
*/
--1) for or after trigger
--for-trigger execute & query also execute
--create trigger for insert records
--Insert
create trigger Tr_Student_insert_1
on Student1
for insert
as 
begin
	print ' batch 22:student insert command fire'
end
--insert records student1
insert into student1 values(7,'shital','pune',1)
select * from student1

--2)-instead of trigger
--instead trigger
--instead only execute trigger not querys
alter trigger Tr_Student_insert_1
on Student1
instead of insert
as 
begin 
	print 'batch 22:student insert command fired'
end

go
insert into student1 values(8,'adnan','pune',1)
select * from student1

--instead  Update
Create trigger Tr_Student_Update
on Student1
instead of Update 
as 
begin   
	print 'batch 22 :student updated command fired'
end
--update records
update student1 set name='zaroon' where RollNumeber=1
select * from student1--record not update

--Delete
create trigger Tr_Student_Delete
on student1
instead of delete
as
begin 
	Print 'Batch 22:student delete records'
end

--delete records
delete from student1 where RollNumeber=6
select * from student1
--1)for trigger use
--delete using for trigger
alter trigger Tr_Student_Delete
on student1
for delete
as 
begin
	print 'Student Batch22:student record delete'
end
delete from student1 where RollNumeber=6
select * from student1

--insert using for trigger
alter trigger Tr_Student_insert_1
on student1
for insert 
as
begin
	print 'batch 22 : student insert record'
end
insert into student1 values(6,'adil','pune',2)
select * from Student1

--Magical Tables
--1)Inserted Table
--2)Deleted Table

--create magical tables
select * from inserted--error
select * from deleted--error

--magical table inserted-jo data insert hone jane wala hai naa wo dat inserted table mai milega
alter trigger Tr_Student_insert_1
on student1
for insert
as
begin
	select * from Inserted
	select * from deleted
end
insert into student1 values(8,'zainab','delhi',2)
insert into student1 values(9,'sahil','mumbai',1),(10,'sameer','delhi',2)
/*RollNumeber	Name	city	TrainerId
	10			sameer	delhi		2
	9			sahil	mumbai		1*/
select * from student1
--then this query execute then all records display

--Deleted magical table
--jo data delete hone wala hai wo dikhta
alter trigger Tr_Student_Delete
on student1
for delete
as
begin
	select * from inserted
	select * from deleted
end

delete from student1 where RollNumeber=10 
select * from student1

--Use Update same result samne word
alter trigger Tr_Student_Update
on student1
for update
as
begin 
	select * from inserted
	select * from deleted
end
update Student1 set name='maheera' where RollNumeber=1
/* inserted table
RollNumeber	Name	city	TrainerId
	1		maheera	pune	1*/
/*Deleted table
RollNumeber	Name	city	TrainerId
	1		zoya	pune	1*/
select * from Student1--record update

 delete from student1 where RollNumeber=10



