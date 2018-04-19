--1. Написать хранимую процедуру, которая показывает количество взятых книг по каждой из групп,
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
--2. Написать хранимую процедуру, показывающую список книг, отвечающих набору критериев.
--Критерии: имя автора, фамилия автора, тематика, категория. Кроме того, список должен быть отсортирован по номеру поля
--указанному в 5-м параметре, в направлении, указанном в 6-м параметре (sp_executesql).
go



declare @Autors_Name nvarchar(255)
,@Autors_Surname nvarchar(255)= 'Грофф'
,@Themes nvarchar(255)
,@Categories nvarchar(255)='Язык SQL'
,@NumberPoles int=1
,@SortN int=1 

set @Autors_Name = 'Джеймс Р.'
set @Themes='Базы данных'

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


 
 



--3. Написать хранимую процедуру, которая показывает список библиотекарей, и количество выданных каждым из них книг.


USE LibrarySQL;
GO
CREATE PROCEDURE Book_libres AS
BEGIN

  
select Libs.FirstName,Libs.LastName,count(Books.Id)
from S_Cards inner join Libs inner join T_Cards inner join Books 
on Books.Id = T_Cards.Id_Book 
on T_Cards.Id_Lib = Libs.Id on Libs.Id = S_Cards.Id_Lib inner join Books as b on S_Cards.Id_Book=b.Id
 
group by  Libs.FirstName,Libs.LastName


END;
go

--4. Создать хранимую процедуру, которая покажет имя и фамилию студента, набравшего наибольшее количество книг.

USE LibrarySQL;
GO
CREATE PROCEDURE Book_student AS
BEGIN

  
WITH Tabl AS  ( select count(Books.Id) as coun, Students.Id as ID
				from Students inner join S_Cards inner join Books 
				on Books.Id=S_Cards.Id_Book 
				on S_Cards.Id_Student = Students.Id
				group by Students.Id
			   ) 

select Students.FirstName,Students.LastName,Tabl.coun
from Students inner join Tabl 
on Tabl.ID = Students.Id
where Tabl.coun = ( select max(Tabl.coun)as maxs
					from Tabl)



END;
go
