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
go
create rule Plus_Fund
as 
@Fund > 0
go
exec sp_bindrule 'Plus_Fund', 'FACULTY.Fund'

go

create table DEPARTMENT(
id int not null identity(1,1)  primary key ,
id_faculty int ,
Name varchar(30) not null, ------------------------------
Head varchar(20),
Building char(5),
Fund numeric(7,2),
constraint KEY_FACU foreign key(id_faculty) references FACULTY (id) on delete cascade on update cascade ,
constraint CONSTRAINT_NAME unique (Name, id_faculty)
)

exec sp_bindrule 'Plus_Fund', 'DEPARTMENT.Fund'

go

create table POST(
id int not null identity(1,1) primary key,
Name VARCHAR(20) unique 
)
go

create table TEACHER(
id int not null identity(1,1) primary key,
id_department int not null unique,
Name varchar(30) not null,
IDCode char (10) unique,
Tel char(7),
Salary numeric(6,2),
Rise NUMERIC(6,2) ,
HireDate DATETIME,
Chief int unique,
constraint KEY_DEP foreign key(id_department) references DEPARTMENT (id),
constraint KEY_CHI foreign key(Chief) references TEACHER (id)
)

alter table TEACHER add check (Year(HireDate)>1990and Day(HireDate)>=1 and Month(HireDate)>=1 ) 
alter table TEACHER add check (Rise <  Salary and (Rise+Salary) < 4000) 

exec sp_bindrule 'Plus_Fund', 'TEACHER.Salary'
go

create table SGROUP(
id int not null identity(1,1) primary key,
id_department int ,
Num NUMERIC(3),  ---------------------------------
Kurs NUMERIC(1) not null check (Kurs>=1 and Kurs<=5),
Quantity NUMERIC(2) check (Quantity>=1 and Quantity<=50),
Rating NUMERIC(3) check (Rating>=0 and Quantity<=100),
id_teacher int ,
 constraint KEY_DEP foreign key(id_department) references DEPARTMENT (id),
  constraint KEY_TEAC foreign key(id_teacher) references TEACHER (id),
  constraint CONSTRAINT_num unique (Num, Kurs, id_department)
)
go

