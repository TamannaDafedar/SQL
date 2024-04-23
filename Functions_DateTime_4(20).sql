use V#22
go 
--Functions

--EOMONTH=EndOFMonth(1 to 2 arguments.)
--EOMONTH=(start date,[month to add])=(year,month,day)
print getdate()--Oct 6 2023  4:33AM
print eomonth(getdate())--2023-10-31
print eomonth('2003-05-14')--2003-05-31
print eomonth('zoya')--error
print eomonth('2023-02-01')--2023-02-28

--date datatypes
--date,time,smalldatetime,datetime,datetime2,datetimeofset

--datefromparts(DateFromparts)
--returns proper format of date /pass 3 arguments
--datefromparts(year,month,date)
print datefromparts(2003,05,14)--2003-05-14
select datefromparts(2003,05,14)--2003-05-14
select datefromparts(14,05,2003)--error/squence year-month-day
select datefromparts(getdate())--error/requires 3 argument(s).

--timefromparts(TimeFromParts)
--timefromparts(hour,minute,second,fraction,precision)
--pass 5 Arguments(hour,minute,seconds,miliseconds,second precision)
select timefromparts(12,12,12,120,3)--12:12:12.120
select timefromparts(5,54,55,657,7)--05:54:55.0000657
select timefromparts(12,12,12,0,0)--12:12:12

--smalldatetimefromparts
--smalldatetimefromprts(year,month,day,hour,minute)
select smalldatetimefromparts(2003,05,14,7,59)--2003-05-14 07:59:00
select smalldatetimefromparts(7678,9,0,22,34)--values which are not valid.


--DATETIMEFROMPARTS()
--datetimefrompart-(year,month,day,hour,minutes,second,miliseconds,)
select DateTimeFromParts(2023,10,6,5,55,45,456)--2023-10-06 05:55:45.457

--DATETIME2FROMPARTS
--datetime2fromparts(year,month,day,hour,minute,sec,seconud fraction,second precision)
select DateTime2fromparts(2003,05,14,12,12,12,122,7)--2003-05-14 12:12:12.0000122
select datetime2fromparts(2003,05,14,45,56,65,5535,3)--values which are not valid.
select DATETIME2FROMPARTS(2023,10,6,5,54,30,345,3)--2023-10-06 05:54:30.345

--DATETIMEOFFSETFROMPARTS()
--datetimeoffsetfromparts-(year,month,day,hour,minute,sec,fraction,offset,sec-precision)
select DATETIMEOFFSETFROMPARTS(2003,5,14,3,45,30,567,5,30,7)
--2003-05-14 03:45:30.0000567 +05:30
select DATETIMEOFFSETFROMPARTS(2023,10,6,6,5,10,456,5,30,7)
--2023-10-06 06:05:10.0000456 +05:30

go
--User Define Function
--1)scalar function-

--Create a Permnant Table
create table InternStudent
(
Id int primary key Identity,
FirstName varchar(50),
LastName varchar(50)
)
insert into InternStudent values
('zoya','dafedar'),('Tamanna','Dafedar'),
('Vihaan','rathod'),('mihaan','rathod')

select Id,FirstName,LastName from InternStudent
/*1	zoya	dafedar
2	Tamanna	Dafedar
3	Vihaan	rathod
4	mihaan	rathod*/

--we want output one more column add as fullname firstname+lastname
select Id,FirstName,LastName,(FirstName +' '+ LastName)as FullName from InternStudent
/*
1	zoya	dafedar	zoya dafedar
2	Tamanna	Dafedar	Tamanna Dafedar
3	Vihaan	rathod	Vihaan rathod
4	mihaan	rathod	mihaan rathod
*/
--add ID
select Id,FirstName,LastName,(Id+'.'+FirstName+' '+LastName)
 as FullName from InternStudent--error-to data type int.

select Id,FirstName,LastName,
(cast(Id as varchar(5))+'. '+FirstName+' '+LastName)
as FullName from InternStudent--self
/*		Id	FirstName	LastName	FullName
		1	zoya		dafedar		1. zoya dafedar
		2	Tamanna		Dafedar		2. Tamanna Dafedar
		3	Vihaan		rathod		3. Vihaan rathod
		4	mihaan		rathod		4. mihaan rathod*/

--okay
--plan is id.lastname.firstname-or ye function ker sakta hai
--craete function

Create Function fnGetFullName()
returns varchar(200)
as
begin
		declare @FullName varchar(200)
		select @FullName=(cast(id as varchar(50))+'. '+FirstName+' '+LastName)from InternStudent
		return @FullName
end

--using Function
select Id,FirstName,LastName from InternStudent
/*		Id	FirstName	LastName
		1	zoya		dafedar
		2	Tamanna		Dafedar
		3	Vihaan		rathod
		4	mihaan		rathod */

--but i want fullname -using Function
select id,FirstName,LastName,dbo.fnGetFullName() from InternStudent
/*				id	FirstName	LastName	(No column name)
				1	zoya		dafedar		1. zoya dafedar
				2	Tamanna		Dafedar		1. zoya dafedar
				3	Vihaan		rathod		1. zoya dafedar
				4	mihaan		rathod		1. zoya dafedar	*/

--We can write parameter to a function
--we pass parameters for proper result
go
alter function fnGetFullName(@Id int ,@FirstName varchar(50),@LastName varchar(50))
returns varchar(200)
as
begin 
	declare @FullName varchar(200)
	set @FullName=(cast(@Id as varchar(5))+'. '+@FirstName+' '+@LastName)
		return @FullName
end
--Using function 
select dbo.fnGetFullName(id,FirstName,LastName) as FullName from InternStudent
/*	FullName
	1. zoya dafedar
	2. Tamanna Dafedar
	3. Vihaan rathod
	4. mihaan rathod	*/


--Capital Name

alter function fnGetFullName(@id int,@FirstName varchar(50),@LastName varchar(50))
returns varchar(200)
as
begin
	declare @FullName varchar(200)
	set @FullName=(cast(@Id as Varchar(5))+'. '+@FirstName+' '+@LastName)
	return upper(@FullName)
end

select dbo.fnGetFullName(Id,FirstName,LastName) as FullName from InternStudent
/*		FullName
		1. ZOYA DAFEDAR
		2. TAMANNA DAFEDAR
		3. VIHAAN RATHOD
		4. MIHAAN RATHOD	*/
--function we can use select statement

--Add one more column add DateOfBirth in permnant table
alter table InternStudent add DateOfBirth date
select * from InternStudent
--inserting values in Graphically way
select * from InternStudent

--function which takes date of birth and returns age
--20 years 5 months 7days
--create function

create function FnAge(@DOB date)--DateOfBirth
returns varchar(100)
as
begin
	declare @Today date=getdate()--Aaj ka date
	declare @year int

	set @year=Datediff(year,@DOB,@Today)
	return cast(@year as varchar(5))+'years'
end

select Id,FirstName,LastName,dbo.FnAge(dateofbirth) as Age from	InternStudent
		/*	Id	FirstName	LastName	Age
			1	zoya		dafedar		20years
			2	Tamanna		Dafedar		18years
			3	Vihaan		rathod		22years
			4	mihaan		rathod		33years */

--Add Month 

alter function FnAge(@DOB date)--dateofbirth
returns varchar(100)
as
begin
	declare @Today date=getdate()
	declare @year int,@month int 
	
	set @year=datediff(year,@DOB,@Today)-
	(
	case 
	when month(@DOB) > month(@Today) or
		month(@DOB) = month(@Today) and
		day(@DOB) > day(@Today)
	then 1
	else 0	
	end
	)
	set @month = datediff(month,@DOB,@Today)
	return cast(@year as varchar(5))+'years'+cast(@month as varchar(10))+'month'

end	
select Id,FirstName,LastName,dbo.FnAge(dateofbirth) as Age from InternStudent
/*	Id	FirstName	LastName	Age
	1	zoya		dafedar	20years245month
	2	Tamanna		Dafedar	18years219month
	3	Vihaan		rathod	22years270month
	4	mihaan		rathod	33years397month*/

--proper age calulate (month)
alter function FnAge(@DOB date)--dateofbirth
returns varchar(100)
as
begin
	declare @Today date=getdate(),@TempDOB date = @DOB
	declare @year int,@month int 
	
	set @year=datediff(year,@DOB,@Today)-
	(
	case 
	when month(@DOB) > month(@Today) or
		month(@DOB) = month(@Today) and
		day(@DOB) > day(@Today)
	then 1
	else 0	
	end
	)
	set @TempDOB = dateadd(year,@year,@TempDOB)
	
	set @month = datediff(month,@TempDOB,@Today)
	return cast(@year as varchar(5))+'years'+cast(@month as varchar(10))+'month'

end
select Id,FirstName,LastName,dbo.FnAge(dateofbirth) as Age from InternStudent
/*	Id	FirstName	LastName	Age
	1	zoya		dafedar		20years5month
	2	Tamanna		Dafedar		20years6month
	3	Vihaan		rathod		22years1month
	4	mihaan		rathod		33years1month*/

--Day
alter function FnAge(@DOB date)
returns varchar(200)
as 
begin
	declare @Today date=getdate(),@TempDOB date= @DOB
	declare @year int,@month int,@day int

	set @year=datediff(year,@DOB,@Today)-
	(
	case 
	when month(@DOB) > month(@Today) or
		 month(@DOB) = month(@Today) And
		 day(@DOB) > day(@Today)
	then 1
	else 0
	end
	)
	set @TempDOB=dateadd(year,@year,@TempDOB)
	set @month = datediff(month,@TempDOB,@Today)

	set @day=datediff(day,@TempDOB,@Today)

	return cast(@year as varchar(5))+'year' +
		   cast(@month as varchar(10))+'month'+
			cast(@Day as varchar(10))+'days'
end
select Id,FirstName,LastName,dbo.FnAge(dateofbirth) as Age from InternStudent
/* Id	FirstName	LastName		Age
	1	zoya		dafedar		20year5month146days
	2	Tamanna		Dafedar		20year6month182days
	3	Vihaan		rathod		22year1month18days
	4	mihaan		rathod		33year1month9days */

--proper day display
alter function FnAge(@DOB date)
returns varchar(200)
as 
begin 
	declare @Today date=getdate(),@TempDOB date=@DOB
	declare @Year int,@month int ,@day int
	
	set @year=DATEDIFF(year,@DOB,@Today)-
	(
	case
	when month(@DOB) > month(@Today) or
		 month(@DOB) = month(@Today) and
		 day(@DOB) > day(@Today)
	then 1
	else 0
	end
	)
	set @TempDOB = DATEADD(year,@year,@TempDOB)
	set @month=DATEDIFF(month,@TempDOB,@Today)

	set @TempDOB = DATEADD(month,@month,@TempDOB)
	set @day = DATEDIFF(day,@TempDOB,@Today)
	

		return cast(@year as varchar(5))+'years'+
			   cast(@month as varchar(10))+'months'+
			   cast(@day as varchar (5))+'days'

end

select Id,FirstName,LastName,dbo.FnAge(DateOfBirth) as Age from InternStudent
/*Id	FirstName	LastName		Age
	1	zoya		dafedar		20years5months-7days
	2	Tamanna		Dafedar		20years6months-1days
	3	Vihaan		rathod		22years1months-12days
	4	mihaan		rathod		33years1months-21days*/



--proper age findout
alter function FnAge(@DOB date)
returns varchar(200)
as 
begin 
	declare @Today date=getdate(),@TempDOB date=@DOB
	declare @Year int,@month int ,@day int
	
	set @year=DATEDIFF(year,@DOB,@Today)-
	(
	case
	when month(@DOB) > month(@Today) or
		 month(@DOB) = month(@Today) and
		 day(@DOB) > day(@Today)
	then 1
	else 0
	end
	)
	set @TempDOB = DATEADD(year,@year,@TempDOB)
	set @month=DATEDIFF(month,@TempDOB,@Today)-
	(
	case
	when day(@TempDOB) > day(@Today) 	Then 1	else 0
	end

	)

	set @TempDOB = DATEADD(month,@month,@TempDOB)
	set @day = DATEDIFF(day,@TempDOB,@Today)
	

		return cast(@year as varchar(5))+'years'+
			   cast(@month as varchar(10))+'months'+
			   cast(@day as varchar (5))+'days'

end

select Id,FirstName,LastName,dbo.FnAge(DateOfBirth) as Age from InternStudent

/*		Id	FirstName	LastName			Age
		1	zoya		dafedar			20years4months23days
		2	Tamanna		Dafedar			20years5months29days
		3	Vihaan		rathod			22years0months18days
		4	mihaan		rathod			33years0months9days*/

--using function we calculate date 
select dbo.FnAge('2003-05-14')--20years4months23days
select dbo.FnAge('2002-11-4')--20years11months3days
select dbo.FnAge('2001-09-9')--22years0months28days
select dbo.FnAge('1980-05-30')--43years4months7days
select dbo.FnAge('2000-02-29')--23years7months9days
select dbo.FnAge('2024-01-01')--(-1years9months6days)
