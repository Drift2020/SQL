create database Teachers
go
use Teachers
create table FACULTY(
id int not null identity(1,1) primary key,
Name varchar(30) not null unique,

)