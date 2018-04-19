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



declare @Autors_Name nvarchar(255)
,@Autors_Surname nvarchar(255)= '�����'
,@Themes nvarchar(255)
,@Categories nvarchar(255)='���� SQL'
,@NumberPoles int=1
,@SortN int=1 

set @Autors_Name = '������ �.'
set @Themes='���� ������'

DECLARE @ExecStr NVARCHAR(4000);
set @ExecStr = 'select *
from Authors inner join
	 Books inner join 
	 Categories on Categories.Id = Books.Id_Category on Books.Id_Author= Authors.Id 
	 inner join Themes on Themes.Id = Books.Id_Themes
where Authors.FirstName like '''+@Autors_Name +'''
   and Authors.LastName like '''+@Autors_Surname+'''
   and Themes.Name like '''+@Themes+'''
   and Categories.Name like '''+@Categories+'''
   order by ';
   
   print (@ExecStr)
  if(@NumberPoles = 1)
  begin 
    set @ExecStr= @ExecStr+'Authors.FirstName'
  end
  else if(@NumberPoles = 2)
  begin 
    set @ExecStr= @ExecStr+'Authors.LastName'
  end
  else if(@NumberPoles = 3)
  begin 
    set @ExecStr= @ExecStr+'Themes.Name'
  end
  else if(@NumberPoles = 4)
  begin 
    set @ExecStr= @ExecStr+'Categories.Name'
  end

  if(@SortN=1)
  set @ExecStr = @ExecStr+' desc'

EXEC sp_executesql @ExecStr


go


 
 



--3. �������� �������� ���������, ������� ���������� ������ �������������, � ���������� �������� ������ �� ��� ����.


USE LibrarySQL;
GO
CREATE PROCEDURE Book_libres AS
BEGIN

  
select Libs.FirstName,Libs.LastName,count(Books.Id)
from  Libs inner join T_Cards inner join Books
on Books.Id = T_Cards.Id_Book 
on T_Cards.Id_Lib = Libs.Id


inner join S_Cards on Books.Id = S_Cards.Id_Book on 



END;
go

--4. ������� �������� ���������, ������� ������� ��� � ������� ��������, ���������� ���������� ���������� ����.


