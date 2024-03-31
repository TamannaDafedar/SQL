use V#22
select  RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
go
--column alias
select RollNo,Name as [Student_Name],Gender,City as Current_City,Age,
Paidfees,IsConfirmed from student

--Operators (=,!=,<>)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where RollNO=1

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where 2=2
select * from student

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Gender='male'

select * from student where Gender='male'

-- Negation (!=) not equals 
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Gender!='male'
--<>
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Gender<>'male'

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age<>'23'


select * from student where Gender!='male'

--Greter than(<)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age > '11'
--(<=)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age >= '11'

--(<)less than
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age < '25'
--(<=)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age <= '25'

--And operator
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age > '20' and Gender='male'

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age < '25' and Gender='male'

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age <= '15' and Gender='female' and city='bmt' and IsConfirmed=1

--or operator

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age <= '11' or Gender='female' or city='bmt' and IsConfirmed=1
--and
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where RollNO=1 and RollNO=2 and  RollNO=3
--or
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where RollNO=1 or RollNO=2 or  RollNO=15
--(>= and <=)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where age <=25 and age >=11

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where age > 11 and age < 25

--(between and/not between and)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where age between 11 and 25

select * from student

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where age not between 11 and 25
--ex.
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age=11 or age=12 or age=34 
--in
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age in (11,12,25,55) 

select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Age not in (11,22,25,55) 

select* from student
delete from student where rollno=13
insert into student values
(1,'zoya','bmt',20,15000,'female',1),
(2,'shahzain','bmt',20,15000,'male',0),
(3,'zain','bmt',23,30000,'male',1),
(4,'farin','shirigonda',22,15000,'female',1),
(5,'jasmin','bmt',20,25000,'male',0),
(6,'adnan','nagar',22,00000,'male',0),
(7,'tamanna','dubai',25,50000,'female',0)
insert into student values(12,'priyaa','pune',24,55000,'female',1)
insert into student values(13,'riya','pune',25,00000,'male',0),
(10,'amin','bmt',20,00000,'male',0),
(11,'fiza','bmt',23,00000,'female',0)

--wildcard character
--starts with('A%') 
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like'A%'
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like'Z%'

--ends with(%n)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like'%n'
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like'%a'

--inbetween characters(%...%)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like'%zain%'

--('_a%'=frist character kuch bhi ho second char 'a' mgta)
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like'_a%'
--
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like '%[aeiou]%'
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name like '%[s]%'

--not like
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name not like'%riya%'
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name not like'%a'
select RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
where Name not like'a%'

drop table student










