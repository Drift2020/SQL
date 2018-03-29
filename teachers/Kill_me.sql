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
Name VARCHAR(20) unique check(Name in('профессор','доцент','преподаватель','ассистент')) 
)
go

create table TEACHER(
id int not null identity(1,1) primary key,
id_department int not null unique,--unique
Name varchar(30) not null,
IDCode char (10) unique(IDCode,id),
id_post int unique,
Tel char(7),
Salary numeric(6,2),
Rise NUMERIC(6,2) check (Rise>=0),
HireDate DATETIME,
Chief int unique,
constraint KEY_DEP foreign key(id_department) references DEPARTMENT (id),
constraint KEY_CHI foreign key(Chief) references TEACHER (id),
constraint KEY_post foreign key(id_post) references POST (id)
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
Rating NUMERIC(3) check (Rating>=0 and Rating<=100),
id_teacher int ,
 constraint KEY_DEP1 foreign key(id_department) references DEPARTMENT (id),
  constraint KEY_TEAC foreign key(id_teacher) references TEACHER (id),
  constraint CONSTRAINT_num1 unique (Num, Kurs, id_department)
)
go

create table ROOM(
id int not null identity(1,1) primary key,
Num numeric(3) not null unique (Num,Building),
[Floor] numeric(2) check ([Floor]>=1 and [Floor]<=16),
Building char(5) not null,
Seats numeric(3) check (Seats >=1 and Seats <= 300),
   constraint CONSTRAINT_num unique (Num, [Floor])
)
go

create table SUBJECT(
id int not null identity(1,1) primary key,
Name varchar(50) not null unique
   
)
go

create table LECTURE_TYPE(
id int not null identity(1,1) primary key,
Name varchar(30) not null unique check (Name in('лекция','лабораторная работа','практика','семинар'))
   
)
go

create table LECTURE(
id int not null identity(1,1) primary key,
id_teacher int  unique,
id_group int not null unique,
id_subject int unique,
id_room int unique,
it_lectype int not null unique,
[Week] numeric(1) not null check ([Week]=1 or [Week]=2) ,
Day_week char(3) not null check ( Day_week = 'пнд' or 
Day_week = 'втр' or
Day_week = 'срд' or
Day_week = 'чтв' or
Day_week = 'птн' or
Day_week = 'сбт' or
Day_week = 'вос'),
Lesson numeric(1) not null check (Lesson>=1 and Lesson<= 8),
constraint KEY_lectype foreign key(it_lectype) references LECTURE_TYPE (id) ,
constraint KEY_room foreign key(id_room) references ROOM (id)  ON DELETE SET NULL ,
constraint KEY_sub foreign key(id_subject) references SUBJECT (id)  ON DELETE SET NULL ,
 constraint KEY_TEAC1 foreign key(id_teacher) references TEACHER (id)  ON DELETE SET NULL ,
 constraint KEY_SGR foreign key(id_group) references SGROUP(id)   on delete cascade  ,
  constraint CONSTRAINT_day unique (id_teacher, [Week], Day_week,Lesson),
  constraint CONSTRAINT_group unique (id_group, Lesson,Day_week,[Week], id_subject),
   constraint CONSTRAINT_room unique (id_room ,[Week], Day_week, Lesson)
)
go


--SET IDENTITY_INSERT [dbo].[FACULTY] ON
--SET IDENTITY_INSERT [dbo].[DEPARTMENT] ON
--SET IDENTITY_INSERT [dbo].[POST] ON
--SET IDENTITY_INSERT [dbo].[TEACHER] ON
--SET IDENTITY_INSERT [dbo].[SGROUP] ON
--SET IDENTITY_INSERT [dbo].[ROOM] ON
--SET IDENTITY_INSERT [dbo].[SUBJECT] ON
--SET IDENTITY_INSERT [dbo].[LECTURE_TYPE] ON
--SET IDENTITY_INSERT [dbo].[LECTURE] ON
--GO
