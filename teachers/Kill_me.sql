create database Teachers
go
use Teachers
create table FACULTY(
id int not null identity(1,1) primary key,
Name varchar(30) not null unique,
Dean varchar(20) unique,
Building char(5),
Fund numeric(7,2) 
)