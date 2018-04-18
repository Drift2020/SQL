--1. �������� �������� ���������, ������� ���������� ���������� ������ ���� �� ������ �� �����,
--� �� ������ �� ������ (departments). 

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
--2. �������� �������� ���������, ������������ ������ ����, ���������� ������ ���������.
--��������: ��� ������, ������� ������, ��������, ���������. ����� ����, ������ ������ ���� ������������ �� ������ ����
--���������� � 5-� ���������, � �����������, ��������� � 6-� ��������� (sp_executesql).
go

CREATE PROCEDURE Book_select @Autors_Name nvarchar(255),@Autors_Surname nvarchar(255),@Themes nvarchar(255),@Categories nvarchar(255),@NumberPoles int, AS
BEGIN

EXEC sp_executesql @statement, N'@LabID int, @BeginDate date, @EndDate date, @RequestTypeID varchar', @LabID, @BeginDate, @EndDate, @RequestTypeID

END;
go

--3. �������� �������� ���������, ������� ���������� ������ �������������, � ���������� �������� ������ �� ��� ����.

--4. ������� �������� ���������, ������� ������� ��� � ������� ��������, ���������� ���������� ���������� ����.


