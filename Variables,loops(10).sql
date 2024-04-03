--decalring a variable
--NAME
declare @name varchar(50)='zoya'
print @name
set @name='Tamanna'
print @name
set @name='manu'
print @name

--Id
declare @id int=18
print @id
set @id = 10
print @id

declare @a int=10 , @b int=10
print @a+@b

--conditional statements
--if else

declare @a int=10 , @b int=10
print @a+@b
if @a = @b
 print 'EQUAL'
else
 print 'NOT EQUAL'

--Examples(-)
declare @a int=10 , @b int=10
print @a-@b
--if else
if @a = @b
 print 'EQUAL'
else
 print 'NOT EQUAL'

declare @a int=10 , @b int=11
print @a+@b
--if else
if @a = @b
 print 'EQUAL'
else
 print 'NOT EQUAL'

--conditional statements
declare @a int=10 , @b int=10
print @a+@b
if @a = @b 
begin 
	print 'EQUAL'
end
else
begin
	print 'NOT EQUAL'
end

--insert into product values('mobile',20000)
select * from product
select * from ProductSales
delete from Product where id=4

--insert product only if not exists in product table
if  not exists (select name from product where Name='mobile')
begin
	insert into product values('phoens',120000)
end
else
begin
	print 'product is alredy been added'
end
select * from product
select * from ProductSales

--loops
declare @start int=1
while @start<=5
begin
	print  'good morning'
	set @start =@start +1
end

declare @start1 int=2
while @start1<=20
begin 
	print @start1
	set @start1=@start1+2
end


declare @start2 int=15
while @start2<=150
begin 
	print @start2
	set @start2=@start2+15
end

--i want to insert huge number of records in a table for testing purpose
declare @counter int =4
while @counter <=1
begin 
	insert into product values('product'+cast(@counter as varchar(7)),@counter)
end

declare @counter int =4
while @counter <=10
begin 
	insert into product values('product'+cast(@counter as varchar(7)),@counter)
end

select * from product 














			





















