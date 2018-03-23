create database Teachers
go
use Teachers
create table POST(
id int not null identity(1,1) primary key,
Name varchar(20) not null,

)
create table TEACHER (
id int not null identity(1,1) primary key,
Name varchar(255) not null,
IDCode char(10) not null ,
id_post int not null references POST(id),
Tel char(7) not null,
Salary int not null,
Rise numeric(6,2),
HireDate datetime not null
)
--2. Удалить таблицу «POST».
go
alter table TEACHER drop constraint id_post
drop table POST

--3. В таблице «TEACHER» удалить столбец «id_post».
go 
alter table TEACHER drop constraint id_post
alter table TEACHER drop column id_post

go
--4. Для столбца «HireDate» создать ограничение: дата приёма на работу должна быть не меньше 01.01.1990.
create rule dateMin
as 
@date >= 1990/01/01
go
exec sp_bindrule 'dateMin', 'TEACHER.HireDate'


go
--5. Создать ограничение уникальности для столбца «IDCode».
alter table TEACHER add constraint CONSTRAINTNAME unique(IDCode)

go
--6. Изменить тип данных в поле Salary c INTEGER на NUMERIC(6,2).

alter table TEACHER alter column Salary NUMERIC(6,2)

go
--7. Добавить в таблицу «TEACHER» следующее ограничение: зарплатане должна быть ниже 1000, но и не должна превышать 5000.
alter table TEACHER add check (Salary > 10 and Salary < 40) 

go
--8. Переименовать столбец Tel на Phone.

exec sp_rename @objname = 'TEACHER.Tel', @newname = 'Phone'
go
--9. Изменить тип данных в поле Phone с CHAR(7) на CHAR(11).

alter table TEACHER alter column Phone CHAR(11)
go

--10. Создать снова таблицу «POST», где для поля Name в качестве типа данных использовать домен (VARCHAR(20), not null).
create type mychar  from varchar(20) not null
go



use Teachers
create table POST(
id int not null identity(1,1) primary key,
Name mychar not null,

)
go
--11. Для поля Name таблицы «POST» задать ограничение на должность (профессор, доцент, преподаватель или ассистент).

alter table POST add check (Name like '%профессор%' or Name like '%доцент%' or Name like '%преподаватель%' or Name like '%ассистент%'  ) 
go
--12. Для поля Name таблицы «TEACHER» задать ограничение, в котором запретить наличие цифр в фамилии преподавателя.

alter table TEACHER add check (Name not like '%[0-9]%' ) 
go

--13. Добавить столбец id_post (int) в таблицу «TEACHER».

alter table TEACHER add id_post int
go
--14. Связать поле id_post таблицы «TEACHER» c полем id таблицы «POST».

alter table TEACHER add references POST(id)
go
--15. Заполнить обе таблицы данными.

insert into post(id,name) values(1,'профессор');
insert into post(id,name) values(2,'доцент');
insert into post(id,name) values(3,'преподаватель');
insert into post(id,name) values(4,'ассистент');

INSERT INTO TEACHER (id, Name, IDCode, id_Post, phone, Salary, Rise, HireDate)
VALUES (1,  'Сидоров','0123456789', 1, NULL, 1070, 470, '01.09.1992');
INSERT INTO TEACHER (id,  Name, IDCode, id_Post, phone, Salary, Rise, HireDate)
VALUES (2,  'Рамишевский','4567890123', 2, '4567890', 1110, 370, '09.09.1998');
INSERT INTO TEACHER (id,  Name, IDCode, id_Post, phone, Salary, Rise, HireDate)
VALUES (3,  'Хоренко','1234567890', 3, NULL, 2000, 230, '10.10.2001');
INSERT INTO TEACHER (id,  Name, IDCode, id_Post, phone, Salary, Rise, HireDate)
VALUES (4,  'Вибровский','2345678901', 4, NULL, 4000, 170, '01.09.2003');
INSERT INTO TEACHER (id,  Name, IDCode, id_Post, phone, Salary, Rise, HireDate)
VALUES (5,  'Воропаев',NULL, 4, NULL, 1500, 150, '02.09.2002');
INSERT INTO TEACHER (id,  Name, IDCode, id_Post, phone, Salary, Rise, HireDate)
VALUES (6,  'Кузинцев','5678901234', 3, '4567890', 3000, 270, '01.01.1991');
go

--16. Для каждой таблицы создать представления.
go
create view show_POST(id, name) as 
select POST.id,POST.Name 
from POST
go

create view show_TEACHER(id, Name, IDCode, id_Post, phone, Salary, Rise, HireDate) as 
select id, Name, IDCode, id_Post, phone, Salary, Rise, HireDate
from TEACHER
go