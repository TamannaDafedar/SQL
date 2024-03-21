--create database query
create database B22DB

--Rename database query
execute sp_renamedb B22DB,DOTNETV#
execute sp_renamedb DOTNETV#,B22DB

--drop database
drop database DOTNETV#

--backup database
backup database B22DB to disk='C:\.NET V#\B22DB\B22DB_backup.bak'

--differential backup 
backup database B22DB to disk='C:\.NET V#\B22DB\B22DB_backup.bak'
with differential 

drop database B22DB --format / database does not exits

--restore database/get back databse pn machine
restore database B22DB from disk='C:\.NET V#\B22DB\B22DB_backup.bak'



