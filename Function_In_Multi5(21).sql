use V#22
go
--Inline fuction(Inline Table Valued Function)
--inline function returns a table 
--and write body begin end

create function Fn_Inline_Student()
returns table--return statement use to return result
as
	return (select * from student )

select *  from Fn_Inline_Student()
/*
RollNO	Name	City	Age	Paidfees	Gender	IsConfirmed
	1	zoya	bmt		20	10000		female	1
	2	Tamanna	bmt		22	20000		female	1
	3	adil	pune	22	10000		male	0
	4	amin	pune	20	10000		male	0
	5	farin	shirig	23	15000		female	1
	6	shifa	pune	23	10000		female	1
	7	adnan	bmt		25	55555		male	0
	8	zain	pak		55	54436		female	1
	9	veer	pak		10	10000		male	0
	10	shahzainbmt		24	15000		male	1*/



--alter
alter function Fn_lnline_Student()
returns table(@Gender) 
as
	return select * from student where Gender=@Gender


--Multipal Table Valued Finction                           
