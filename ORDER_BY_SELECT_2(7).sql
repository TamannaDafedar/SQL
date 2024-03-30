use V#22
go
select * from student
--order by
select * from student order by gender 
select * from student order by name
select * from student order by RollNo

--ascending order(by default)
select * from student order by gender asc 
select * from student order by name asc--(A-Z)
select * from student order by RollNO asc--(1-10) 

--descending order
select * from student order by gender desc
select * from student order by name desc--(Z-A)
select * from student order by RollNO desc--(14-1)

--sort based on multipal columns
select * from student order by gender,NAME
select * from student order by name,rollno

--ascending order both
select * from student order by gender asc,NAME asc

select * from student order by  rollno,gender

select * from student order by AGE
select * from student order by AGE ,name asc,gender--exampal

--one more record insert
insert into student values(15,'nisba','dubai',23,null,'female',0)
select * from student
select * from student order by Paidfees

--null is not a value
select * from student where Paidfees=15000 
select * from student where paidfees = null --no record
select* from student where paidfees is null--null records dispaly using(is)

--aggegate function
select * from student

--count to fetch no of records
select count(*) from student --(14)give no of records of table records of tables
select count(1) from student--colum 1 main kitne records/row hai wo display 
select count(city) from student--display all row of city column
select count(paidfees) from student--(count does not cosider null value)null value not display becouse of null is not value

--min() to fetch minimum value
select min(paidfees) from student--0
select min(age) from student--20
select min(city) from student--this is not count\valus so they display result in alphabitically

--max() to fetch maximum value
select max(paidfees) from student--55000
select max(age) from student--25
select * from student

--sum() to fetch sum of all records
select sum(paidfees) from student--260000

--avg() to fetch average of records
select avg(paidfees) from student
select * from student

--group by clause
select count(1) from student where gender='female'--*\1 same work
select count(*) from student where gender='male'

select Count(gender) from student--displat all records of gender

--group of all male female /as alias column name 
select Gender,count(rollno)as total from student 
group by Gender

--group by gender,city wise show table male,female
select Gender,city,count(RollNo) as total from student
group by Gender,City

--minimum fees paid from male female
select Gender, min(paidfees)as min_paidfees from student group by gender

--group of gender where it will display result using sum() of male & female 
--female and male paid fess total 
select Gender, sum(paidfees) from student group by gender

-- group of age 
select Age,count(RollNO) from student group by Age

--fetch only age group having minimum 2 member
select Age,count(RollNO) from student 
where count(RollNO)>=2
group by Age--aggregaet function not allowed in where clause(error)

select Age, count(rollno) from student
where Age>20
group by age

-- asa record mgta jis age grp me 2ya 2 se jada student hoo
select Age ,count(RollNo)from student
having count(RollNO)>=2
group by Age--syntax error

--output is in column mai 2 se jada grp ka record
select Age ,count(RollNo)from student
group by Age
having count(RollNO)>=2 --3,4,5

select Age ,count(RollNo)from student
group by Age
having count(RollNO)<=2

--diffrence where & having clause
--where clause(1st filter,2nd grouping)
select Age, count(rollno) from student
where Age>20
group by age

--having clause(1st grouping,2nd filtering)
select Age ,count(RollNo)from student
group by Age
having count(RollNO)>=2 --3,4,5

--where/having

select Age, count(rollno) from student
where Age>=20
group by age

select Age ,count(RollNo)from student
group by Age
having Age>=20


























































































