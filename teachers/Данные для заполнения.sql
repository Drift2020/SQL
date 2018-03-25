SET IDENTITY_INSERT [dbo].[FACULTY] ON

GO

INSERT INTO FACULTY (id, Name, Dean, Building, Fund) 
VALUES (1, 'информатика', 'Сидоров', '6', 25000);
INSERT INTO FACULTY (id, Name, Dean, Building, Fund) 
VALUES (2, 'кибернетика', 'Петров', '5', 27000);
INSERT INTO FACULTY (id, Name, Dean, Building, Fund) 
VALUES (3, 'математика', 'Игнатов', '3', 23000);

GO
SET IDENTITY_INSERT [dbo].[DEPARTMENT] ON

GO

INSERT INTO DEPARTMENT(id, id_faculty, Name, Head, Building, Fund) 
VALUES (1, 1, 'базы данных', 'Соколов', '6', 26000);
INSERT INTO DEPARTMENT(id, id_faculty, Name, Head, Building, Fund) 
VALUES (2, 1, 'программирование', 'Федоров', '6', 12000);
INSERT INTO DEPARTMENT(id, id_faculty, Name, Head, Building, Fund) 
VALUES (3, 1, 'интернет', 'Стрельцов', '3', 10000);
INSERT INTO DEPARTMENT(id, id_faculty, Name, Head, Building, Fund) 
VALUES (4, 2, 'теория языков', 'Глущенко', '3', 10000);
INSERT INTO DEPARTMENT(id, id_faculty, Name, Head, Building, Fund) 
VALUES (5, 2, 'лингвистика', 'Коробов', '3', 14100);
INSERT INTO DEPARTMENT(id, id_faculty, Name, Head, Building, Fund) 
VALUES (6, 2, 'базы данных', 'Тараненко', '5', 27000);
GO

SET IDENTITY_INSERT [dbo].[POST] ON

GO

insert into post(id,name) values(1,'профессор');
insert into post(id,name) values(2,'доцент');
insert into post(id,name) values(3,'преподаватель');
insert into post(id,name) values(4,'ассистент');
GO

SET IDENTITY_INSERT [dbo].[TEACHER] ON

GO


INSERT INTO TEACHER (id, id_department, Name, IDCode, id_post, Tel, Salary, Rise, HireDate, Chief)
VALUES (16, 2, 'Сидоров','0123456789', 1, NULL, 1070, 470, '09.01.1992',  NULL);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (4, 2, 'Раневский','4567890123', 2, '4567890', 830, 370, '09.09.1998', 16);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (2, 2, 'Хоренко','1234567890', 3, NULL, 670, 230, '10.10.2001', 4);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (1, 2, 'Вибровский','2345678901', 4, NULL, 570, 170, '09.01.2003', 2);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (3, 2, 'Воропаев',NULL, 4, NULL, 570, 150, '09.02.2002', 4);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (5, 2, 'Кузинцев','5678901234', 3, '4567890', 630, 270, '01.01.1991', 4);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (6, 2, 'Завратинский','3456789012', 2, NULL, 770, 341, '02.01.1996', 16);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (8, 2, 'Козлутин','6789012345', 4, 1234567, 530, 220, '07.04.2001', 6);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (7, 2, 'Лекарь','3456789012', 2, 1234567, 890, 440, '06.03.1991', 16);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (9, 2, 'Мартынов','7890123456', 4, 1234567, 530, 220, '10.22.2002', 5);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (10, 2, 'Резван',NULL, 1, 1234567, 1100, 470, '11.11.2000', 16);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (11, 2, 'Недеведеев',NULL, 3, 1234567, 570, 230, '07.22.1999', 7);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (13, NULL, 'Ахромеев',NULL, 1, 2345678, 1050, 500, '05.05.1998', NULL);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (14, NULL, 'Наумов',NULL, 2, 2345678, 770, 350, '09.01.1994', NULL);
INSERT INTO TEACHER (id, id_department, Name, IDCode, id_Post, Tel, Salary, Rise, HireDate, Chief)
VALUES (15, NULL, 'Дараганов',NULL, 3, 3456789, 570, 250, '11.07.1998',NULL);

GO
SET IDENTITY_INSERT [dbo].[SGROUP] ON

GO


INSERT INTO SGROUP (id, id_department, Num, Kurs, Quantity, Rating, id_teacher)
VALUES (1, 2, 505,5, 27, 67, 7);
INSERT INTO SGROUP (id, id_department, Num, Kurs, Quantity, Rating, id_teacher)
VALUES (2, 2, 504,5, 31, 55, 6);
INSERT INTO SGROUP (id, id_department, Num, Kurs, Quantity, Rating, id_teacher)
VALUES (3, 1, 307,3, 33, 48, 5);
INSERT INTO SGROUP (id, id_department, Num, Kurs, Quantity, Rating, id_teacher)
VALUES (4, 1, 408,4, 27, 56, 5);
INSERT INTO SGROUP (id, id_department, Num, Kurs, Quantity, Rating, id_teacher)
VALUES (5, 3, 201,2, 35, 43, NULL);

GO
SET IDENTITY_INSERT [dbo].[ROOM] ON

GO


INSERT INTO Room (id, Num, Floor, Building, Seats)
VALUES (1, 311, 3, 6, 17);
INSERT INTO Room (id, Num, Floor, Building, Seats)
VALUES (2, 201, 2, 6, 80);
INSERT INTO Room (id, Num, Floor, Building, Seats)
VALUES (3, 201, 2, 5, 60);
INSERT INTO Room (id, Num, Floor, Building, Seats)
VALUES (4, 202, 2, 4, 70);
INSERT INTO Room (id, Num, Floor, Building, Seats)
VALUES (5, 225, 2, 7, 95);
INSERT INTO Room (id, Num, Floor, Building, Seats)
VALUES (6, 104, 1, 6, 25);
INSERT INTO Room (id, Num, Floor, Building, Seats)
VALUES (7, 110, 1, 6, 40);
GO

SET IDENTITY_INSERT [dbo].[SUBJECT] ON

GO

INSERT INTO Subject (id, Name)
VALUES (1, 'операционные системы');
INSERT INTO Subject (id, Name)
VALUES (2, 'проектирование компьютеров');
INSERT INTO Subject (id, Name)
VALUES (3, 'базы данных');
INSERT INTO Subject (id, Name)
VALUES (4, 'охрана труда');
INSERT INTO Subject (id, Name)
VALUES (5, 'теория алгоритмов');
INSERT INTO Subject (id, Name)
VALUES (6, 'нейрокомпьютеры');
INSERT INTO Subject (id, Name)
VALUES (7, 'теория права');

GO

SET IDENTITY_INSERT [dbo].[LECTURE_TYPE] ON

GO

insert into lecture_type (id,name) values(1,'лекция');
insert into lecture_type (id,name) values(2,'лабораторная работа');
insert into lecture_type (id,name) values(3,'практика');
insert into lecture_type (id,name) values(4,'семинар');


GO
SET IDENTITY_INSERT [dbo].[LECTURE] ON
GO

INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (1,1, 1, 1, 1, 2, 1, 'пнд', 1);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (2,2, 1, 1, 2, 1, 1, 'пнд', 2);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (3,3, 1, 2, 1, 2, 1, 'втр', 3);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (4,4, 1, 2, 2, 1, 1, 'втр', 4);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (5,5, 1, 3, 2, 1, 1, 'срд', 3);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (6,6, 1, 4, 3, 1, 1, 'срд', 4);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (7,7, 1, 5, 4, 1, 1, 'чтв', 2);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (8,8, 1, 4, 5, 3, 1, 'чтв', 3);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (9,9, 1, 3, 1, 2, 1, 'чтв', 4);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (10,10, 1, 6, 2, 1, 1, 'птн', 1);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (11,11, 1, 5, 6, 2, 1, 'птн', 4);


INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (12,2, 1, 1, 2, 1, 2, 'пнд', 2);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (13,15, 1, 7, 2, 1, 2, 'пнд', 3);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (14,11, 1, 5, 1, 2, 2, 'втр', 2);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room,it_lectype, Week, Day_week, Lesson)
VALUES (15,5, 1, 3, 2, 1, 2, 'втр', 3);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (16,4, 1, 2, 2, 1, 2, 'втр', 4);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (17,1, 1, 1, 6, 2, 2, 'срд', 2);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (18,9, 1, 3, 1, 2, 2, 'срд', 3);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (19,15, 1, 7, 7, 2, 2, 'чтв', 1);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (20,7, 1, 5, 2, 1, 2, 'чтв', 2);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (21,10, 1, 6, 2, 1, 2, 'птн', 1);
INSERT INTO LECTURE (id,id_teacher, id_group, id_subject, id_room, it_lectype, Week, Day_week, Lesson)
VALUES (22,3, 1, 2, 1, 2, 2, 'птн', 3);

GO
