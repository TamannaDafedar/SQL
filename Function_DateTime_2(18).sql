use V#22
go

--Time
select GetDate()--2023-10-04 06:23:24.170
select Current_Timestamp--2023-10-04 06:23:58.053
select SysDateTime()--2023-10-04 06:24:08.3857975
select SysDateTimeOffSet()--2023-10-04 06:24:45.2108380 +05:30
select GETUTCDATE()--2023-10-04 00:56:47.273
select SysUTCDateTime()--2023-10-04 00:58:31.4049680

--Date & Time part
--years,month,day,hour,time,seconds,miliseconds,seconds precision
--quarter,day of year,week day,day of week,
--offset,Time zone 

go
create table DateTimeTable
(
cdate date,--2023-10-04
ctime time,--06:49:57.4433333
csmalldatetime smalldatetime,--2023-10-04 06:50:00
cdatetime datetime,--2023-10-04 06:49:57.443
cdatetime2 datetime2,--
cdatetimeoffset datetimeoffset--this all datatypes
)
insert into DateTimeTable values
(getdate(),getdate(),getdate(),getdate(),SysDateTimeOffSet(),SysDateTimeOffSet())

select * from DateTimeTable

