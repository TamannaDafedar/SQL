use V#22
go
select * from Student1
go
execute sp_help student
execute sp_help student1
--select Audit table
--this table contains all logs for admission

drop table StudentAudit
create table StudentAudit
(
RollNumeber int primary key identity,
Descreption varchar(500),
AuditDate date,
)
select * from StudentAudit

--When a new student gets added then add a new entry in audit table
--student with rollno 1 and name zoya taken admission on 11 september 2023 
--automatically entery add table


alter trigger Tr_Student_insert_1
on student1
for insert
as 
begin
	declare @RollNumeber int,@Name varchar(50)
	select @RollNumeber=RollNumeber,@Name=Name  from Inserted

	Declare @Descreption varchar(500)='Student With RollNumeber'
	set @Descreption=@Descreption +' '+ cast(@RollNumeber as varchar(5)) +' ' + 'And Name' 
	+' '+@Name +'  '+ 'Take Admission On' +' '+ cast(GETDATE() as varchar(50))
		insert into studentAudit values (@Descreption,GETDATE())
end

select * from Student1
select * from StudentAudit

insert into Student1 values(14,'shamsher','USA',1)
/*
RollNumeber						Descreption															AuditDate
1			Student With RollNumeber11And NamezoyaTake Admission OnOct 13 2023  9:52AM				2023-10-13
2			Student With RollNumeber12And NameshahmeerTake Admission OnOct 13 2023  9:57AM			2023-10-13
3			Student With RollNumeber13And NameshahnoorTake Admission OnOct 13 2023 10:01AM			2023-10-13
4			Student With RollNumeber 14 And Name shamsher  Take Admission On Oct 13 2023 10:03AM	2023-10-13*/
select * from Student1
select * from StudentAudit

--On delete student from student1 table
--student with rollno 1 and name zoya cancelled admission on 11 september 2023 
--automatically entery delete table

select * from Student1
select * from StudentAudit

execute sp_helptext[Tr_Student_Delete]

Alter trigger Tr_Student_Delete  
on student1  
for delete  
as  
begin  
		 declare @RollNumeber int,@Name varchar(50)
		 select @RollNumeber = RollNumeber,@Name = Name from deleted 
		 
		 declare @Descreption varchar(500)= 'Student With RollNumber'
		 set @Descreption=@Descreption + cast(@RollNumeber as varchar(5)) + 'And Name' +
		  @Name + 'Cancelled Admission On' + cast(GETDATE() as varchar(50))

		 Insert into StudentAudit values(@Descreption,getdate())
end  

--delete records in student1 table
delete from Student1 where RollNumeber=14
delete from Student1 where RollNumeber=13

select * from Student1
select * from StudentAudit

--Update 
--id any student updated data
--student with rollnumber 1 updated name from ajay to vihaan city from pune to mumbai on 11 sep 2023 

Execute sp_helptext[Tr_Student_Update]

--update - inserted and deleted use this query
Alter trigger Tr_Student_Update  
on student1  
for update  
as  
begin
		declare @RollNumeber int,@OldName varchar(50),@NewName varchar(50)
				,@OldCity varchar(50),@NewCity varchar(50)
 
		select @RollNumeber = RollNumeber,@OldName=name,@OldCity=City from deleted  
		select @NewName = Name , @NewCity = city from inserted 
		
		declare @Descreption varchar(500)='Student With RollNumber' + Cast(@RollNumeber as varchar(5))  
					+ 'updated' 
		--Name k liye
		if @OldName <> @NewName--ager old name equal nhi hai to issne naam update kiya hai
		set @Descreption = @Descreption + 'name from' + @OldName + 'to' + @NewName
			
		--city k liye
		if @OldCity <> @NewCity
		set @Descreption = @Descreption + '  ' +'City from' + ' ' + @OldCity + ' ' + ' to ' + @NewCity 

		Set @Descreption = @Descreption + 'on' + cast(Getdate() as varchar(50))

		insert into StudentAudit values(@Descreption,GETDATE())
end

select * from student1
select * from StudentAudit

update student1 
set Name ='kashaf',
city = 'bmt'
where RollNumeber=12

--muze table,sp,viwe,function,trigger kuch bhi create kerne nhi dena

create trigger Tr_B22_restrict_creation
on database
for create_table
as  
begin
		print 'B22 database table creation is restricted'
		--rollback --jidar se aaya udar jaa
end

--create table
create table V1 (Id int)--create then call restric trigger call
create table V3(id int)--transaction ended in the trigger

--All server k liye
create trigger Tr_B22_restrict_creation
on all server
for create_table
as  
begin
		print 'B22 database table creation is restricted'
		--rollback --jidar se aaya udar jaa
end

select ORIGINAL_LOGIN()--DESKTOP-3V1GETQ\hp 440
select top 10 * from sys.dm_exec_sessions where is_user_process = 1 and
login_name=original_login()--new session kitne open hai 


--function EVENTDATA()

/*create  trigger Tr_B22_restrict_Table_creation
on Database
for create_table
as  
begin
		print 'B22 database table creation is restricted'
		select EVENTDATA()
end*/
create Table V2 (Id int)
/*<EVENT_INSTANCE>
  <EventType>CREATE_TABLE</EventType>
  <PostTime>2023-10-13T18:23:18.040</PostTime>
  <SPID>53</SPID>
  <ServerName>DESKTOP-3V1GETQ\SQLEXPRESS</ServerName>
  <LoginName>DESKTOP-3V1GETQ\hp 440</LoginName>
  <UserName>dbo</UserName>
  <DatabaseName>V#22</DatabaseName>
  <SchemaName>dbo</SchemaName>
  <ObjectName>V2</ObjectName>
  <ObjectType>TABLE</ObjectType>
  <TSQLCommand>
    <SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" />
    <CommandText>create Table V2 (Id int)</CommandText>
  </TSQLCommand>
</EVENT_INSTANCE>*/




