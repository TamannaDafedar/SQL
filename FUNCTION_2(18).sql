--function 
use V#22
go
--1) replicate()
print 'V#'
print replicate('V#',5)
print replicate('X',8)+'0514'
print 'XXXXXXXX'+'0514'

--2)Space
print 'zoya'+' '+'dafedar'
print 'zoya'+'   '+'dafedar'
print 'zoya'+space(10)+'dafedar' 

--3)replace()
declare @site varchar(50)='www.google.com'
print @site
print replace(@site,'.com','.co.in')

go
--charindex() 
--position of characters
declare @Email varchar(50)='zoyadafedar@Gmail.com'
print @Email
print charindex('@',@Email)
--zoyadafedar@Gmail.com-12

declare @Email varchar(50)='Tamannadafedar@gmail.com'
print @Email
print charindex('gmail',@Email)
--Tamannadafedar@gmail.com -16

--4)patindex=pattern index
declare @Email varchar (45)='tamnnadafedar@gmail.com'
print @Email
print patindex('@',@Email)--0
print patindex('gamil',@Email)--0

print patindex('%@%',@Email)--14
print patindex('%gmail%',@Email)--15
print patindex('%t%',@Email)--t
print patindex('%yahoo%',@Email)--0

--regular expression
declare @Name varchar(50)='zoya'
print @Name
print patindex('%[0-9]%',@Name)--0
set @Name = 'zoyadafedar7777'
print @Name
print patindex('%[0-9]%',@Name)--12

declare @pincode varchar(10)=41310200
print @pincode
print patindex('%[0-9]%',@pincode)

declare @mobile varchar(10)=9234567898
print @mobile 
--print patindex('%[0-9]{10}%',@mobile)
print patindex('[9876]%',@mobile)--1

declare @password varchar(50)='zoya0707'
print @password
set @password='Zoya@0707'
print @password
print patindex('%[A-Z][a-z][!@#$%^&*][0-9]%',@password)--3
print patindex('%[\W\w0-9@]%',@password)--5
/*zoya0707
Zoya@0707
3
5*/
set @password='@zoya123'
print patindex('%[A-Z][a-z][!@#$%^][0-9]%',@password)
print patindex('%[\W\w0-9@]%',@password)
print patindex('%[A-Za-z0-9@]%',@password)

--5)stuff()
declare @Aadhar varchar(12)='123456789012'
print @Aadhar
print 'XXXXXXXX'+right(@Aadhar,4)
print stuff(@Aadhar,1,8,'XXXXXXXX')

declare @Email varchar(50)='zoyadafedar@gamil.com'
print @Email
print stuff(@Email,3,5,'******')--zo******edar@gamil.com
print @Email
print stuff(@Email,3,2,'XXXXXX')--zoXXXXXXdafedar@gamil.com
