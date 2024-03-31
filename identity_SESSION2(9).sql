--session 2
select scope_identity()--null(same session work)
select @@identity--null(same session work)
select IDENT_CURRENT('confirmedstudents')--2(across any session/work any session)

insert into confirmedstudents values('zoya','bmt')--3
select scope_identity()--null(same session work)--3
select @@identity--null(same session work)--3
select IDENT_CURRENT('confirmedstudents')--3(across any session/work any session)

select * from confirmedstudents

--scope
create procedure usp_insertstudent
as
begin
insert into confirmedstudents values('vhaas','pune')
end
