--1. ���������� ����� � ����������� ����������� �������, �������-��� ��� ��� ���� �������������.

WITH Min_pages AS
(SELECT min(Books.Pages) AS count , Press.Name  FROM Books  INNER JOIN  Press  ON Press.Id = Books.Id_Press group by  Press.Name)

SELECT Books.Name,Books.Pages,Books.YearPress,Books.Quantity,Books.Comment , Press.Name
from   Min_pages INNER JOIN Books  INNER JOIN  Press   ON Press.Id = Books.Id_Press  ON Min_pages.count = Books.Pages


--2. ���������� �������� �����������, ������� ��������� ����� �� ������� ����������� ������� ������� 100.



SELECT Press.Name , sum(Books.Pages)/sum(Books.Quantity)
from Books inner join Press on Press.Id = Books.Id_Press

group by Press.Name
Having sum(Books.Pages)/sum(Books.Quantity)>=100

--3. ������� ����� ����� ������� ���� ��������� � ���������� ����, ���������� �������������� BHV � �����.

SELECT Press.Name, sum(Books.Pages)
from Books inner join Press on Press.Id = Books.Id_Press
where Press.Name like '%BHV%' or Press.Name like '%�����%'
group by Press.Name


--4. ������� ����� � ������� ���� ���������, ������� ����� ����� � ���������� ����� 1 ������ 2001 ���� � ������� �����.
SELECT Students.FirstName , Students.LastName
from Students inner join S_Cards on S_Cards.Id_Student = Students.Id
where YEAR (S_Cards.DateOut) >= 2001 and YEAR (S_Cards.DateOut) <= 2018



--5. ����� ���� ���������, ��� �� ������ ������ �������� � ������ "������ Windows 2000" ������ ����� ��������.

select Students.FirstName , Students.LastName
from Students inner join S_Cards inner join Books inner join Authors  on Authors.Id = Books.Id_Author on Books.Id = S_Cards.Id_Book  on Students.Id = S_Cards.Id_Student  
where Authors.FirstName like '�����' and Authors.LastName like '��������' and
	Books.Name like '������ Windows 2000'

--6. ���������� ���������� �� �������, ������� ����� ���� ������� (� ���������) ����� 600 �������.

Select Authors.FirstName,Authors.LastName,AVG(Books.Pages) as 'C������ ����� ����'
from Authors inner join Books on Books.Id_Author = Authors.Id
group by Authors.FirstName,Authors.LastName
Having AVG(Books.Pages) >= 600 

--7. ���������� ���������� �� �������������, � ������� ����� ����-������ ������� ���������� ��� ���� ������ 700.

Select Press.Name ,sum(Books.Pages) as 'C������ ����� ����'
from Press inner join Books on Books.Id_Press = Press.Id
group by  Press.Name
Having sum(Books.Pages) >= 700 

--8. ���������� ���� ����������� ���������� (� ��������� � �������-�������) � �����, ������� ��� �����.

select Students.FirstName +' '+ Students.LastName as '���', Books.Name
from Books inner join S_Cards inner join Students on Students.Id = S_Cards.Id_Student on S_Cards.Id_Book = Books.Id

UNION

select Teachers.FirstName +' '+ Teachers.LastName as '���', Books.Name
from Books inner join T_Cards inner join Teachers on Teachers.Id = T_Cards.Id_Teacher on T_Cards.Id_Book = Books.Id

--9. ������� ������ ����������� ������(��) ����� ��������� � ������-���� ���� ����� ������, ������ � ����������.


WITH Max_books AS
(select count(S_Cards.DateOut) as [count]
								from S_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = S_Cards.Id_Student
								group by  Authors.FirstName+' '+Authors.LastName)

select Authors.FirstName+' '+Authors.LastName as '�����' , count(S_Cards.DateOut)
from S_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = S_Cards.Id_Student 
--where max(Max_book.count)= count(S_Cards.DateOut)
group by  Authors.FirstName+' '+Authors.LastName
having count(S_Cards.DateOut) = (select max(Max_books.count)
									from Max_books 
									)
--10. ������� ������ ����������� ������(��) ����� �����������-��� � ���������� ���� ����� ������, ������ � ����������.

WITH Max_books AS
(select count(T_Cards.DateOut) as [count]
								from T_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = T_Cards.Id_Teacher
								group by  Authors.FirstName+' '+Authors.LastName)

select Authors.FirstName+' '+Authors.LastName as '�����' , count(T_Cards.DateOut)
from T_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = T_Cards.Id_Teacher 
--where max(Max_book.count)= count(S_Cards.DateOut)
group by  Authors.FirstName+' '+Authors.LastName
having count(T_Cards.DateOut) = (select max(Max_books.count)
									from Max_books 
									)

--11. ������� ����� ����������(��) ��������(�) ����� ��������� � ��������������.





WITH Max_Themes AS
(select Count(Themes.Name) as [count]
								from Themes inner join Books inner join S_Cards inner join Students 
on Students.Id = S_Cards.Id_Student 
on S_Cards.Id_Book = Books.Id
 on Books.Id_Themes = Themes.Id
 group by Themes.Name), Max_Themes_T AS
(select Count(Themes.Name) as [count]
from Themes inner join Books inner join T_Cards inner join Teachers 
on Teachers.Id = T_Cards.Id_Teacher 
on T_Cards.Id_Book = Books.Id
on Books.Id_Themes = Themes.Id
group by Themes.Name)



select  Themes.Name,Count(Themes.Name)
from Themes inner join Books inner join S_Cards inner join Students 
on Students.Id = S_Cards.Id_Student 
on S_Cards.Id_Book = Books.Id
 on Books.Id_Themes = Themes.Id
 group by Themes.Name
 having Count(Themes.Name)= (select max(Max_Themes.count)
									from Max_Themes )

union




select  Themes.Name,Count(Themes.Name)
from Themes inner join Books inner join T_Cards inner join Teachers 
on Teachers.Id = T_Cards.Id_Teacher 
on T_Cards.Id_Book = Books.Id
 on Books.Id_Themes = Themes.Id
 group by Themes.Name
 having Count(Themes.Name)= (select max(Max_Themes_T.count)
									from Max_Themes_T )



--12. ���������� ���������� �������������� � ���������, ����-������ ����������.




Select  count(Students.FirstName ),'��������'
From Students inner join S_cards inner join Books
on 
Books.Id = S_Cards.Id_book
on
Students.Id = S_Cards.Id_student

UNION 

Select count(Teachers.FirstName) , '�������������'
From Teachers inner join T_cards  inner join Books
on 
Books.Id = T_Cards.Id_book
on 
Teachers.Id = T_Cards.Id_Teacher


--13. ���� ������� ����� ���������� ���� � ���������� �� 100%, �� ���������� ����������, ������� ���� (� ���������� ���������) ���� ������ ���������.
--x=1040*100:800=130%
select Faculties.Name, count (Books.Name)*100/(select count(Faculties.Name)as count
											from Faculties inner join Groups
											inner join Students 
											inner join S_Cards 
											inner join Books on
											Books.Id = S_Cards.Id_Book on
											S_Cards.Id_Student = Students.Id on
											Students.Id_Group = Groups.Id on
											Groups.Id_Faculty = Faculties.Id
												) 
from Faculties inner join Groups inner join Students inner join S_Cards inner join Books on
Books.Id = S_Cards.Id_Book on S_Cards.Id_Student = Students.Id on Students.Id_Group = Groups.Id on
Groups.Id_Faculty = Faculties.Id
group by Faculties.Name

--14. ���������� ����� �������� ��������� � ����� �������� �������.
WITH Faculty_proc as (select count (Books.Name)*100/(select count(Faculties.Name)as count
														from Faculties inner join Groups
														inner join Students 
														inner join S_Cards 
														inner join Books on
														Books.Id = S_Cards.Id_Book on
														S_Cards.Id_Student = Students.Id on
														Students.Id_Group = Groups.Id on
														Groups.Id_Faculty = Faculties.Id
														) as [count]
from Faculties inner join Groups inner join Students inner join S_Cards inner join Books on
Books.Id = S_Cards.Id_Book on S_Cards.Id_Student = Students.Id on Students.Id_Group = Groups.Id on
Groups.Id_Faculty = Faculties.Id
group by Faculties.Name)


WITH Departments_proc as (select count (Books.Name)*100/(select count(Faculties.Name)as count
														from Faculties inner join Groups
														inner join Students 
														inner join S_Cards 
														inner join Books on
														Books.Id = S_Cards.Id_Book on
														S_Cards.Id_Student = Students.Id on
														Students.Id_Group = Groups.Id on
														Groups.Id_Faculty = Faculties.Id
														) as [count]
from Faculties inner join Groups inner join Students inner join S_Cards inner join Books on
Books.Id = S_Cards.Id_Book on S_Cards.Id_Student = Students.Id on Students.Id_Group = Groups.Id on
Groups.Id_Faculty = Faculties.Id
group by Faculties.Name)




--15. �������� ������ (��) ����� ���������� ���� ����� �������-������� � ���������.

--16. ���������� �������� ����� ���������� ���� ����� �������-������� � ���������.

--17. �������� ���� ��������� � �������������� ����������.

--18. �������� ��� ���������� � ��������� � ��������������,������� �����.

--19. �������� �����, ������� ����� � ������������� � ��������.

--20. �������� ������� ���� ����� ������ �� �������������.