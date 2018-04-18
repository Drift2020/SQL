--1. Ќаписать хранимую процедуру, котора€ показывает количество вз€тых книг по каждой из групп,
--и по каждой из кафедр (departments). 

USE LibrarySQL;
GO
CREATE PROCEDURE Book_chose AS
BEGIN

select Groups.Name,  count(Books.Id) as 'books is group'
from Books inner join S_Cards inner join Students inner join Groups 
on Groups.Id = Students.Id_Group 
on Students.Id = S_Cards.Id_Student
on S_Cards.Id_Book = Books.Id
group by Groups.Name


select Faculties.Name,  count(Books.Id) as 'books is faculties'
from Books inner join S_Cards inner join Students inner join Groups  inner join Faculties
on Faculties.Id = Groups.Id_Faculty
on Groups.Id = Students.Id_Group 
on Students.Id = S_Cards.Id_Student
on S_Cards.Id_Book = Books.Id
group by Faculties.Name

END;
go

exec Book_chose
--2. Ќаписать хранимую процедуру, показывающую список книг, отвечающих набору критериев.
-- ритерии: им€ автора, фамили€ автора, тематика, категори€.  роме того, список должен быть отсортирован по номеру пол€
--указанному в 5-м параметре, в направлении, указанном в 6-м параметре (sp_executesql).

EXEC sp_executesql @statement, N'@LabID int, @BeginDate date, @EndDate date, @RequestTypeID varchar', @LabID, @BeginDate, @EndDate, @RequestTypeID

--3. Ќаписать хранимую процедуру, котора€ показывает список библиотекарей, и количество выданных каждым из них книг.

--4. —оздать хранимую процедуру, котора€ покажет им€ и фамилию студента, набравшего наибольшее количество книг.


