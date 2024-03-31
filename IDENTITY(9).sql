use v#22
go
create table confirmedstudents
(
RollNumber int primary key,
name varchar(50),
city varchar(50)
)
insert into confirmedstudents values
(1,'zoya','bmt'),(2,'shifa','pune')
select * from confirmedstudents
--this record for exampal for anyone insert any number in cloumn 
--so use for identity
insert into confirmedstudents values(16,'jasmin','pune')
delete from confirmedstudents where RollNumber=16
drop table confirmedstudents

--identity
--it auto genrates numbers based on give seed & increment
--seed-from where to start 
--increment-by what number value should get increment by(new value)

create table confirmedstudents
(
RollNumber int primary key identity(1,1),--(1,1=1st one value ,2nd one is increment)
name varchar(50),
city varchar(50)
)
/*this record not insert in table bacause we selected\created indentity 
in RollNumber*/ 
insert into confirmedstudents values(1,'zoya','bmt')
select * from confirmedstudents

--use identity
insert into confirmedstudents values('zoya','baramati')
insert into confirmedstudents values('shifa','pune')
insert into confirmedstudents values('jasmin','sagola')
insert into confirmedstudents values('fareen','shirigonda')
insert into confirmedstudents values('fiza','shirigonda')
insert into confirmedstudents values('shahzain','bmt')
select * from confirmedstudents

delete from confirmedstudents where RollNumber=3

select * from confirmedstudents
insert into confirmedstudents values('zain','bmt')--7
insert into confirmedstudents values(3,'jasmin','sagola')--error

--insert identity value explicity
--identity insert-we can on/off identity to insert value explicity
--insert again 3no record using indentity on
set identity_insert confirmedstudents on
insert into confirmedstudents (RollNumber,name,city)values(3,'jasmin','sagola')
insert into confirmedstudents (RollNumber,name,city)values('jasmin','sagola')

select * from confirmedstudents
insert into confirmedstudents values('adil','bmt')
--used and IDENTITY_INSERT is ON.--error

--turn off identity insert
set identity_insert confirmedstudents off
insert into confirmedstudents values('hamdan','pak')--9
select * from confirmedstudents

delete from confirmedstudents where name='adil'--3 records of adil all records are delete

--again records add 8,10,11 rollno
set identity_insert confirmedstudents on
insert into confirmedstudents(RollNumber,name,city) values (8,'adil','bmt')
--10
set identity_insert confirmedstudents on
insert into confirmedstudents(RollNumber,name,city) values (10,'dil','bmt')
--11 
set identity_insert confirmedstudents on
insert into confirmedstudents(RollNumber,name,city) values (11,'adhi','bmt')

select * from confirmedstudents

delete from confirmedstudents--delete all records(13)
go
set identity_insert confirmedstudents off
insert into confirmedstudents values('zoya','bmt')--14

select * from confirmedstudents--(14)

--reset identity values after deleting all records
delete from confirmedstudents

--double records insert
delete from confirmedstudents where RollNumber=15

insert into confirmedstudents values('zoya','ladakh',3)--16
select * from confirmedstudents
delete from confirmedstudents where RollNumber=17 

--reset identity values after deleting all records(repite)
insert into confirmedstudents values ('zoya','ladhak')--17
delete from confirmedstudents
--to rest identity values to its original seed & increment
dbcc checkident (confirmedstudents,reseed,0)
select * from confirmedstudents

insert into confirmedstudents values ('mohit','ladhak',14)

/*how to get last genrated identity column values?
scope_identity()
@@identity
identity_current()*/

drop table confirmedstudents
create table confirmedstudents
(
RollNumber int primary key identity(1,1),
name varchar(50),
city varchar(50)
)
insert into confirmedstudents values('vihaaan','pune')--1
select * from confirmedstudents

--how to get last genrated identity column values?
select scope_identity()--1
select @@identity--1
select IDENT_CURRENT('confirmedstudents')--1
select * from confirmedstudents

--session 1
insert into confirmedstudents values('tamanna','bmt')--2
select * from confirmedstudents
select scope_identity()--2
select @@identity--2
select IDENT_CURRENT('confirmedstudents')--2


--session 2
select scope_identity()--null(same session work)
select @@identity--null(same session work)
select IDENT_CURRENT('confirmedstudents')--2(across any session/work any session)

insert into confirmedstudents values('zoya','bmt')--3
select scope_identity()--null(same session work)--3
select @@identity--null(same session work)--3
select IDENT_CURRENT('confirmedstudents')--3(across any session/work any session)

select * from confirmedstudents

--scope
create procedure usp_insertstudent
as
begin
insert into confirmedstudents values('vhaas','pune')
end


--session 3
select scope_identity()--null
select @@identity--null
select IDENT_CURRENT('confirmedstudents')--3

--same session same scope
--insert into confirmedstudents values('mihaan','pune')

--same session different scope
execute usp_insertstudent

--last identity=4

select scope_identity()--null
select @@identity--4
select IDENT_CURRENT('confirmedstudents')--4


--same session same scope
insert into confirmedstudents values('mihaan','pune')
select scope_identity()--5
select @@identity--5
select IDENT_CURRENT('confirmedstudents')--5

select * from confirmedstudents






























