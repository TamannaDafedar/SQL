use V#22

--meaning of null
--null means absences of values

--Using ISNULL()
-- mostly use to repalce a null values
--it has only two parameters pass
select e.name as EmployeeName ,ISNULL(m.name,'owner')
from Employee e left join Employee m
on e.managerid = m.id

--COALESCE() 
--it can have more than two parameters use
select e.name as EmployeeName ,COALESCE(m.name,'NO MANAGER')
from Employee e left join Employee m
on e.managerid = m.id

--COALESCE()/Examapal
create table person
(
Id int identity,
Name varchar(50),
Gender varchar(10),
City varchar(10),
PrimaryEmail varchar(50),
AlternateEmail varchar(50)
)
insert into Person values
('zoya','female','bmt','z@z.com','null'),
('shifa','female','pune',null,'s@s.com'),
('fareen','female','shirigonda','f@f.com',null),
('shahzain','male','mumbai',null,null),
('shamsher','male','mumbai','sh@sh.com','s1@s1.com')

select * from person
select name,primaryemail,alternateemail from person

--useing COALESCE() multiple parameters pass (Example)
select Name,PrimaryEmail,AlternateEmail,
COALESCE(PrimaryEmail,AlternateEmail,'NO MAIL')as Emails
from person

--case statement
--to write logic based on multiple conditions
/*syntax 
		:case
		when<condition> then <statementb-if-true>
		when<condition> then <statement-if-condition2-true>
		else<statement-if-condition1-condition2-both-are-false>
		end*/

--ISNULL()
select e.name as EmployeeName ,ISNULL(m.name,'owner')
from Employee e left join Employee m
on e.managerid = m.id

--case statement
select e.name As EmployeeName ,
(case when m.name is null then 'OWNER' else m.name end)as managername
from Employee e left join Employee m
on e.ManagerId = m.id

--case Example
declare @DayNumber int =8
select case 
when @DayNumber=1 then 'sunday'
when @DayNumber=2 then 'monday'
when @DayNumber=3 then 'tuesday'
when @DayNumber=4 then 'wednesday'
when @DayNumber=5 then 'thusday'
when @DayNumber=6 then 'friday'
when @DayNumber=7 then 'saturday'

else 
	'invalid DayNumber' 
end

select name ,gender,
(case when gender='male' then 'M'
	when gender='female' then 'f' 
	else 'INVALID' 
	end) as ModifyingName,
city from person


--replace(just understanding)
--hardcode (not using just..)
--select name ,'mumbai' as city from person where city='pune'
--select name ,'pune' as city from person where city='mumbai'

--write a query frist select city pune <-> mumbai replacement
select Name,Gender,city,
(case when city='pune' then 'mumbai' 
	when city='mumbai' then 'pune' 
	else city 
	end)as ModifyCity
from person

select name,city from person

--one more way to replace 
/*update person set city ='pune' where city='mumbai'
update person set city ='mumbai' where city='pune'*/

update person set city=
(case when city='pune' then 'mumbai'
	when city='mumbai' then 'pune' 
	else city 
	end
)
update person set city=
(case when city='bmt' then 'shirigonda'
	when city ='shirigond' then 'bmt'
	else city
	end)

select name,city from person
