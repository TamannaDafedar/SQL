use V#22
/* diifrence Between Parameter & Argument
-	Parameter comes with definition of stored procedure or function
	alter procedure usp_GetAllStudentsOnGenderAge 
	@Gender Varchar(10)=null,@Age int = null,@city varchar(40)--parameter
	as

-	Arguments comes while executing stored procedure or function
	execute usp_GetAllStudentsOnGenderAge @city='pune' ,@Gender='female',@Age=20--Argument
*/

--Execution plan
select * from Student--everytime creates a new execution plan
select * from Student where city='pune'--everytime creates a new execution plan

--Stored Procedure
--Create Execution Plan Ones
--Next time onwaeds it use same execution plan








