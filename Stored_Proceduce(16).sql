use V#22
go
--Stored Procedure
--block of sql,logical queries
--to implement business logic-original table=inserting,updateing,deleting

--create stored procedure
create proc usp_GetAllStudents
as
begin 
	select * from student
end
execute usp_GetAllStudents
/*
			RollNO	Name	City	Age	Paidfees	Gender	IsConfirmed
				1	zoya	bmt		20	10000		female		1
				2	Tamanna	bmt		22	20000		female		1
				3	adil	pune	22	10000		male		0
				4	amin	pune	20	10000		male		0
				5	farin	shi		23	15000		female		1
				6	shifa	pune	23	10000		male		1*/
--Alter sp 
--this command return only those records gender=male 
alter procedure usp_GetAllStudents
as 
begin 
	select * from student where Gender='male'
end
--call sp
execute usp_GetAllStudents
/*RollNO	Name	City	Age	Paidfees	Gender	IsConfirmed
	3		adil	pune	22	10000		male		0
	4		amin	pune	20	10000		male		0
	6		shifa	pune	23	10000		male		1*/
	
--drop sp
drop procedure usp_GetAllStudents

--create again procedure
Create procedure usp_GetAllStudents
as
begin
	select * from student
end
execute usp_GetAllStudents

--stored procedure with parameters
create procedure usp_GetAllStudentsOnGender
@Gender varchar(10)--parameter
as
begin
	select * from student where Gender=@Gender
end
--call sp
/*Procedure or function 'usp_GetAllStudentsOnGender' expects parameter 
'@Gender', which was not supplied.*/
execute usp_GetAllStudentsOnGender
go
execute usp_GetAllStudentsOnGender 'male'--only male records
execute usp_GetAllStudentsOnGender 'female'--only female records
--execute usp_GetAllStudentsOnGender 'all'--no student having as all

--want all students gender=male,female
--alter record
alter procedure usp_GetAllStudentsOnGender
@Gender varchar(20)
as
begin 
	if
		@Gender='male' or @Gender='female'
	begin
		select * from student where Gender=@Gender
	end
	else
	begin
		select * from student
	end
end
go
execute usp_GetAllStudentsOnGender 'male'
execute usp_GetAllStudentsOnGender 'female'
execute usp_GetAllStudentsOnGender 'all'--all records male female

--we can write multiple parameter with sp
Create procedure usp_GetAllStudentsOnGenderAge
@Gender varchar(10),@Age int
as
begin
	select * from student where Gender = @Gender or Age >= @Age	
end
execute usp_GetAllStudentsOnGenderAge 'male'--parameter '@Age', which was not supplied.
execute usp_GetAllStudentsOnGenderAge 'male' ,25
/*		 RollNO	Name	City	Age	Paidfees	Gender	IsConfirmed
			3	adil	pune	22	10000		male		0
			4	amin	pune	20	10000		male		0
			6	shifa	pune	23	10000		male		1 */
--or
alter procedure usp_GetAllStudentsOnGenderAge
@Gender varchar(10),@Age int
as
begin
	select * from student where Gender = @Gender or Age <= @Age	
end

execute usp_GetAllStudentsOnGenderAge 'male',25--3 records

--and-both side condition true to ture nhi to false
alter procedure usp_GetAllStudentsOnGenderAge
@Gender varchar(10),@Age int
as
begin
	select * from student where Gender = @Gender And Age > @Age	
end
 
execute usp_GetAllStudentsOnGenderAge 'male' ,25
execute usp_GetAllStudentsOnGenderAge 25,'male'--data type varchar to int.

execute usp_GetAllStudentsOnGenderAge @Gender='female' ,@Age=20
execute usp_GetAllStudentsOnGenderAge @Age=20 , @Gender='female'

--return RollNO by name
create procedure usp_GetStudentRollNumberByName
@Name varchar(50)--parameter
as
begin 
	select RollNo from Student where Name=@Name
end

execute usp_GetStudentRollNumberByName 'zoya'--1-pass parameter
execute usp_GetStudentRollNumberByName 'tamanna'

--Return Statement
alter procedure usp_GetStudentRollNumberByName
@Name varchar(50)
as
begin 
	declare @RollNO int
	select @RollNO=RollNO from student where Name=@Name
	return @RollNO
end
go
execute usp_GetStudentRollNumberByName 'zoya'--Commands completed successfully.

declare @RN int
execute @RN= usp_GetStudentRollNumberByName 'Shahzain'--10
print @RN

declare @RN int
execute @Rn=usp_GetStudentRollNumberByName 'zoya'--1
print @RN

--bt default every procedure returns a int value which denoteds status of execution
declare @r1 int
execute @r1 = usp_GetAllStudentsOnGenderAge @Age=20 , @Gender='female'
print @r1 
/* Results=		RollNO	Name	City		Age	Paidfees	Gender	IsConfirmed
				2	Tamanna	bmt			22		20000	female	1
				5	farin	shirigonda	23		15000	female	1
				6	shifa	pune		23		10000	female	1
				8	zain	pak			55		54436	female	1*/
	messages=0-success

--RollNoByName
create procedure usp_GetStudentNameByRollNo
@RollNo int
as 
begin
	select Name from student where RollNo=@RollNo
end

execute usp_GetStudentNameByRollNo '6'--shifa
execute usp_GetStudentNameByRollNo '1'--zoya

--Alter
alter procedure usp_GetStudentNameByRollNo
@RollNo int
as
begin
	declare @name varchar(50)
	select Name from Student where RollNO=@RollNo
	return @name
end
go

declare @r2 varchar(40)
execute @r2= usp_GetStudentNameByRollNo '5'--farin
print @r2

--way sir(error)
alter procedure usp_GetStudentNameByRollNo
@RollNo int
as
begin
	declare @name varchar(50)
	select @Name=Name from Student where RollNO=@RollNo
	return @name
end
go

declare @r2 varchar(40)
execute @r2= usp_GetStudentNameByRollNo '5'--farin--not work
print @r2--value 'farin' to data type int.

--output parameter
alter procedure usp_GetStudentNameByRollNo
@RollNo int,@Name varchar(50)output
as 
begin 
	select @Name=Name from student where RollNo=@RollNo
end

declare @r3 varchar(50)
execute usp_GetStudentNameByRollNo @RollNo=7,@Name =@r3 output--adnan
print @r3
declare @r3 varchar(50)
execute usp_GetStudentNameByRollNo @RollNo=3,@Name =@r3 output--adil
print @r3

--multipal output 
alter procedure usp_GetStudentNameByRollNo
@RollNo int,@Name varchar(50)output,@city varchar(50) output
as
begin
	select @Name=Name,@city=city from Student where RollNo=@RollNo
end

declare @r3 varchar(50),@r4 varchar(50)
execute usp_GetStudentNameByRollNo @RollNo=8,@Name=@r3 output,@city=@r4 output
print @r3--name k liye tha ye-zain
print @r4--city=pak

declare @r3 varchar(50),@r4 varchar(50)
execute usp_GetStudentNameByRollNo @RollNo=4,@Name=@r3 output,@city=@r4 output
print @r3--name -amin
print @r4--city-pune

--or
alter procedure usp_GetAllStudentsOnGenderAge
@Gender varchar(10),@Age int
as
begin
	select * from student where Gender = @Gender or Age >= @Age	
end

 execute usp_GetAllStudentsOnGenderAge 'male',25--3 records--all student having gender female and age 25 or more than 
 execute usp_GetAllStudentsOnGenderAge @Age=25--all studnet having age 25 or more than 25
 execute usp_GetAllStudentsOnGenderAge 'male',25--

 --optional parameter
 alter procedure usp_GetAllStudentsOnGenderAge
@Gender varchar(10)=null,@Age int=null
as
begin
	select * from student where Gender = @Gender or Age >= @Age	
end
execute usp_GetAllStudentsOnGenderAge--no result empty columns

go
alter procedure usp_GetAllStudentsOnGenderAge
@Gender varchar(10)=null,@Age int=null
as
begin
	select * from student where 
	(Gender = @Gender or @Gender is null)
	and 
	(Age >= @Age or @Age is null)
end
execute usp_GetAllStudentsOnGenderAge--All Studnets Records
execute usp_GetAllStudentsOnGenderAge @Gender='female'--all female
execute usp_GetAllStudentsOnGenderAge @Gender='male'--all male 
execute usp_GetAllStudentsOnGenderAge @Age=20--more than 25
execute usp_GetAllStudentsOnGenderAge 'female' , 25--female or age more than 25

--add city
alter procedure usp_GetAllStudentsOnGenderAge 
@Gender Varchar(10)=null,@Age int = null,@city varchar(40)
as
begin
	select * from student where
	(Gender=@Gender or @Gender is null)
	And
	(Age>=@Age or @Age is null)
	And
	(city=@city or @city is null)
end
execute usp_GetAllStudentsOnGenderAge--All Studnets Records
execute usp_GetAllStudentsOnGenderAge @Gender='female'--all female
execute usp_GetAllStudentsOnGenderAge @Gender='male'--all male 
execute usp_GetAllStudentsOnGenderAge @Age=20--more than 25
execute usp_GetAllStudentsOnGenderAge 'female' , 25--female or age more than 25
execute usp_GetAllStudentsOnGenderAge @city='pune'--pune city records
execute usp_GetAllStudentsOnGenderAge @city='pune' , @Gender='male'--2 records
execute usp_GetAllStudentsOnGenderAge @city='pune' ,@Gender='female',@Age=20

--Write=>Parse=>compile=>execute
select * from Student where RollNO=1
select * from Student where RollNO=2--compile=>execute

execute usp_GetAllStudentsOnGenderAge @Gender='male'--compile =>execute 
execute usp_GetAllStudentsOnGenderAge @Age=20--usage pre compiled version => execute =fast






