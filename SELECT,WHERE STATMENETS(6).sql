use V#22

--SELECT STATEMENTS
select 1
select 'zoya'
select 'zoya','BARAMATI'

--all columns All data from table
select * from student
--it is not recommended
--*means all and it is not good from performance
--if we want to select all colums we need to specify all column name instead*
--it is good for maintainability 
select * from student
select RollNo,Name,Gender,City,Age,Paidfees,IsConfirmed from student
select RollNo,Name,Paidfees,IsConfirmed from student

--select only 5 records,limited records 
--top key word use 
select top 10 RollNo,Name,City,Age,Paidfees,Gender,IsConfirmed from student
select top 10 * from  student
select * from  student


--11 reords insert
insert into student values (14,'vvv','pune',11,50000,'female',1)
delete from student where paidfees=5000
select Name,Paidfees,IsConfirmed from student

--unique record use distinct
select distinct Name,Paidfees,IsConfirmed from student
select distinct RollNO  from student 

select * from student



