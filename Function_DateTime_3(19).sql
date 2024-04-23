use V#22
go
select getdate()--2023-10-05 03:25:59.450
print getdate()--Oct  5 2023  3:26AM

--isdate()-return date is valid or not(0/1)
print isdate(getdate())--1
print isdate('2002-05-14')--1
print isdate('1222-09-22')--0
print isdate('2023-02-29')--0
print isdate('1')--0

--day(),month(),year()
print getdate()--Oct  5 2023  3:33AM
print day(getdate())--5-day
print month(getdate())--10-month
print year(getdate())--2023-year

print day('2003-05-14')--14
print month('2003-05-14')--5
print year('2003-05-14')--2003

--datename-2 arguments(datepart,inputdate)
/* detepart=day,month,year,dayofyear,week,weekday,hour,minutes,seconds,
milisecond,microsecond*/
print getdate()--Oct  5 2023  4:03AM
print datename(day,getdate())--5
print datename(month,getdate())--October
print datename(year,getdate())--2023
print datename(yy,getdate())--2023
--DayOfYear
print datename(dayofyear,getdate())--278
print datename(dayofyear,'2003-05-14')-134
print datename(dayofyear,'2023-12-31')--365
--WeekDay
print datename(week,getdate())--40
print datename(week,'2023-01-01')--1
print datename(week,'2023-01-31')--5
print datename(weekday,getdate())--Thursday
print datename(weekday,'2003-05-14')--Wednesday
--TimeZone
print datename(tzoffset,SysDateTimeOffSet())--+05:30
--hour
print datename(hour,getdate())--4
print datename(hour,sysdatetimeoffset())--4
--Minutes
print datename(minute,getdate())--17minute
print datename(minute,sysdatetimeoffset())--18minute
--quater(jan,feb,mar=1)(apr,may,june=2)(july,aug,sep=3)(oct,nov,dec=4)
print datename(q,getdate())--4
print datename(quarter,'2003-05-14')--2

--datepart
print getdate()--Oct  5 2023  4:38AM
print datepart(day,getdate())--5
print datepart(month,getdate())--10
print datepart(year,getdate())--2023

--datename() VS datepart()
--datename()= returns string output
--datepart()= returns int output 

print datename(month,getdate())--October
print datepart(month,getdate())--10

print datename(year,getdate())--'2023'-returns string
print datepart(year,getdate())--2023

--prove
print datename(month,getdate())+ datename(month,getdate())--OctoberOctober
print datename(year,getdate()) + datename(year,getdate())--20232023
go
print datepart(month,getdate()) + datepart(month,getdate())--20-int
print datepart(year,getdate()) + datepart(year,getdate())--4046-int
go
print datename(weekday,getdate())--Thursday
print datepart(weekday,getdate())--5

--dateadd()
--to add parts in date we use dateadd()/3 Arguments add
--day
print getdate()--Oct 5 2023 5:03AM
print dateadd(day,3,getdate())--Oct 8 2023 5:03AM
--month
print dateadd(month,2,getdate())--Dec  5 2023  5:04AM
print dateadd(month,6,'2023-09-05')--Mar  5 2024 12:00AM
--year
print dateadd(year,-48,getdate())--Oct  5 1975  5:10AM
print dateadd(year,-20,'2023-05-14')--Oct  5 1975  5:10AM
print dateadd(year,20,getdate())--Oct  5 1975  5:10AM
--hour
print dateadd(hour,2,getdate())--Oct  5 2023  7:13AM

--datediff
declare @DOB date='2003-05-14',@Today date = getdate()
print datediff(year,@DOB,@Today)--20 years
print datediff(month,@DOB,@Today)--245 month
print datediff(day,@DOB,@Today)--7449 day


select Id,Name from Employee
--employeeId=CGT1012,CGT1013,CGT1014....etc
select Id,'CGT'+Id from Employee--ERROR
--converting the varchar value 'CGT' to data type int.

--Using cast()
select Id,'CGT'+ cast(Id as varchar(5)) from Employee
select cast('10' as int)--10-varchar convert into int
select cast('VIHAAN' as int)--Error


--canvert()
select Id,'CGT'+CONVERT(varchar(5),id) from employee
--convert() function has style parameter,which is very useful for 
--date formatting /pass 3 Parameters

select getdate()--2023-10-05 06:40:10.180
select convert(date,getdate())--2023-10-05-only date
select convert(varchar(50),getdate(),100)--Oct 5 2023 6:44AM(mm/dd/yyyy)
select convert(varchar(50),getdate(),101)--10/05/2023(mm/dd/yyyy=/)
select convert(varchar(40),getdate(),103)--05/10/2023(dd/mm/yyyy=/)
select convert(varchar(40),getdate(),104)--05.10.2023(dd.mm.yyyy=.)
select convert(varchar(50),getdate(),9)--Oct  5 2023  6:55:39:490AM

--Mathematical Function

--1)Abs=absulute function
--always returning positive value
print 10--10
print -10--(-10)
print abs(-188)--188
print abs(-163.8765)--163.8765

--2)ceiling()-returns upper closest value
print ceiling(15.2)--16
print ceiling(14.9)--15
print ceiling(-15.2)--(-15)

--3)floor-returns lower closest whole number
print floor(15.2)--15
print floor(15.9)--15
print floor(-15.9)--(-16)
print floor(-15.2)--(-16)
print floor(15)--15
print floor(-15)--(-15)

--4)square
print square(14)--196
print square(57)--3249
print square(34.7)--1204.09
print square(2)--4

--5)sqrt
print sqrt(16)--4
print sqrt(36)--6
print sqrt(144)--12

--6)Power()
print power(2,8)--256-(2*2*2*2*2*2*2*2)
print power(2,3)--8

--7)round
--3parameters
print round(456.568,2)--456.570
print round(456.568,1)--456.600
print round(678.876,2)--678.880
print round(657.983,1,1)--657.90
--dicimal left side use(-)
select round(657.768,-2)--700.000
select round(756.986,-1)--760.000

--8)rand
--always returns a random new values in between 0 and 1
print rand()--0.852361
select rand()
--0.94007902034809,0.27030864023692,0.252036191873422

go 
select square(3)--9
select sqrt(25)--5
go
select getdate()

--deteministic function & non-determinstic function
--online quiz,i want to pick random questions fro list

declare @start int = 1
while @start <= 10
begin 
	print rand()
	set @start=@start+1
end
--0.64312,0.083726,0.254839,0.883745,0.763101,0.100245,0.184255,0.757717,0.42808,0.783561

--random number 1-100
declare @start1 int = 1
while @start1<=25
begin
	print floor(rand()*100)
	set @start1=@start1+1
end

--to make rand() function as a deterministic function
print rand(10)--0.71376,0.71376,0.71376,0.71376
select rand(10)--0.713759689954247,0.713759689954247,0.713759689954247


--Question - primry key pr rand() function use
declare @start int = 1
while @start <= 3
begin 
	--print rand()
	select * from student where RollNO=floor(rand()*10)
	set @start=@start+1
end
--always returns random values



