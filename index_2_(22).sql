use V#22
go
--create index Ix_Name-bt default it will create non-unique,non-clustered index
--Create unique index Ix_Name-i will create unique non-clustered index
--create clustered index Ix_Name-non unique clustered index
--create unique clustered index Ix_Name-unique clustered index

select Name,city from Student where Paidfees between 5000 and 15000 

--non clustered index on paidfees column
create index Ix_Student_paidfees
on student(paidfees desc)

--create a seprate a index table
--paidfees  | row addresses-original table ka uder ka city,name ka address

--Q)which index is faster clustered ,non-clustered
--clustered index is faster->sorted data in the original table

--Covering Index
create index Ix_student_paidfees
on Student(paidfees desc,name, city)
--create a seprate a index table
--paidfees|name|city | Row_Addresses-original table ka uder ka city,name ka address

select Name,city from Student where Paidfees between 5000 and 15000 

select * from student order by name
select * from student order by RollNO

--We can create miltiple clustered index?
--(-> NO)
/*in our project we have a query used a multiple times -
and we are filtring records another column accsept primary key */

--can we create clustered index on other cloumn than pk column?->YES
create table FilpKartCustome
(
Id int not null,
Name varchar(50),
UnitPrice int
)
insert into FilpKartCustome values(1,'shirt',500),(2,'T-shirt',299)
select * from FilpKartCustome

--clustered index primary key
create clustered index Ix_Customer_Name
on FilpKartCustome(Name asc)

--creating primary key
alter table FilpKartCustome
add constraint Pk_Custmor_Id
primary key(Id)

/*drop index primary ker banay oruss ko index maise bhi delete key to wo
apne table k column se bhi primary key delete hoti*/

/*index frist day nhi aata picture mai jb wo break honga jb wo slow honga tb dekhege
wo bhi cmplte wo bhi complete analysis k baad*/


