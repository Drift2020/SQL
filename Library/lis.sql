--1. ������� ��� ������������, � ������� �������� ����� (3 ������� - EXISTS, ANY, SOME).

select Themes.Name
from Themes
where Themes.Id = ANY (
   SELECT Books.Id_Themes
   FROM Books 
)

select Themes.Name
from Themes
where Themes.Id = SOME (
   SELECT Books.Id_Themes
   FROM Books 
)

select t.Name 
from Themes t
WHERE EXISTS (
   SELECT *
   FROM Books b
   WHERE t.id = b.Id_Themes
)

--2. ������� ����� � ������������ ����������� ������� (2 ������� - ALL, ���������� �������).


select Books.Name, Books.Pages
from Books
WHERE Pages = (
   SELECT  max(Books.Pages)
   FROM Books    
)

select Books.Name, Books.Pages
from Books
WHERE Books.Pages >= all(
   SELECT  Books.Pages
   FROM Books    
)
