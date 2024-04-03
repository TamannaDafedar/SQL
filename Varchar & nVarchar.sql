--Varchar & Nvarchar difference
--1)varchar
declare @Name varchar(50), @MName varchar(50)
set @Name = 'Zoya'
print @Name

set @Name = N'झोया'
print @Name
/*Zoya
  ????*/
 
--2)nVarchar

declare @Name varchar(50), @MName nvarchar(50)
set @Name = 'Zoya'
print @Name

set @MName = N'झोया'
print @MName

/*Zoya
  झोया*/
--nvarchar store any language code











































































