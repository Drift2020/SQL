--1. Отобразить книги с минимальным количеством страниц, выпущен-ные тем или иным издательством.

WITH Min_pages AS
(SELECT min(Books.Pages) AS count , Press.Name  FROM Books  INNER JOIN  Press  ON Press.Id = Books.Id_Press group by  Press.Name)

SELECT Books.Name,Books.Pages,Books.YearPress,Books.Quantity,Books.Comment , Press.Name
from   Min_pages INNER JOIN Books  INNER JOIN  Press   ON Press.Id = Books.Id_Press  ON Min_pages.count = Books.Pages


--2. Отобразить названия издательств, которые выпустили книги со средним количеством страниц большим 100.



SELECT Press.Name , sum(Books.Pages)/sum(Books.Quantity)
from Books inner join Press on Press.Id = Books.Id_Press

group by Press.Name
Having sum(Books.Pages)/sum(Books.Quantity)>=100

--3. Вывести общую сумму страниц всех имеющихся в библиотеке книг, выпущенных издательствами BHV и БИНОМ.

SELECT Press.Name, sum(Books.Pages)
from Books inner join Press on Press.Id = Books.Id_Press
where Press.Name like '%BHV%' or Press.Name like '%БИНОМ%'
group by Press.Name


--4. Выбрать имена и фамилии всех студентов, которые брали книги в промежутке между 1 Января 2001 года и текущей датой.
SELECT Students.FirstName , Students.LastName
from Students inner join S_Cards on S_Cards.Id_Student = Students.Id
where YEAR (S_Cards.DateOut) >= 2001 and YEAR (S_Cards.DateOut) <= 2018



--5. Найти всех студентов, кто на данный момент работает с книгой "Реестр Windows 2000" автора Ольга Кокорева.

select Students.FirstName , Students.LastName
from Students inner join S_Cards inner join Books inner join Authors  on Authors.Id = Books.Id_Author on Books.Id = S_Cards.Id_Book  on Students.Id = S_Cards.Id_Student  
where Authors.FirstName like 'Ольга' and Authors.LastName like 'Кокорева' and
	Books.Name like 'Реестр Windows 2000'

--6. Отобразить информацию об авторах, средний объем книг которых (в страницах) более 600 страниц.

Select Authors.FirstName,Authors.LastName,AVG(Books.Pages) as 'Cредний объем книг'
from Authors inner join Books on Books.Id_Author = Authors.Id
group by Authors.FirstName,Authors.LastName
Having AVG(Books.Pages) >= 600 

--7. Отобразить информацию об издательствах, у которых общее коли-чество страниц выпущенных ими книг больше 700.

Select Press.Name ,sum(Books.Pages) as 'Cредний объем книг'
from Press inner join Books on Books.Id_Press = Press.Id
group by  Press.Name
Having sum(Books.Pages) >= 700 

--8. Отобразить всех посетителей библиотеки (и студентов и препода-вателей) и книги, которые они брали.

select Students.FirstName +' '+ Students.LastName as 'ФИО', Books.Name
from Books inner join S_Cards inner join Students on Students.Id = S_Cards.Id_Student on S_Cards.Id_Book = Books.Id

UNION

select Teachers.FirstName +' '+ Teachers.LastName as 'ФИО', Books.Name
from Books inner join T_Cards inner join Teachers on Teachers.Id = T_Cards.Id_Teacher on T_Cards.Id_Book = Books.Id

--9. Вывести самого популярного автора(ов) среди студентов и количе-ство книг этого автора, взятых в библиотеке.


WITH Max_books AS
(select count(S_Cards.DateOut) as [count]
								from S_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = S_Cards.Id_Student
								group by  Authors.FirstName+' '+Authors.LastName)

select Authors.FirstName+' '+Authors.LastName as 'Автор' , count(S_Cards.DateOut)
from S_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = S_Cards.Id_Student 
--where max(Max_book.count)= count(S_Cards.DateOut)
group by  Authors.FirstName+' '+Authors.LastName
having count(S_Cards.DateOut) = (select max(Max_books.count)
									from Max_books 
									)
--10. Вывести самого популярного автора(ов) среди преподавате-лей и количество книг этого автора, взятых в библиотеке.

WITH Max_books AS
(select count(T_Cards.DateOut) as [count]
								from T_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = T_Cards.Id_Teacher
								group by  Authors.FirstName+' '+Authors.LastName)

select Authors.FirstName+' '+Authors.LastName as 'Автор' , count(T_Cards.DateOut)
from T_Cards inner join Books inner join Authors on Authors.Id = Books.Id_Author on Books.Id = T_Cards.Id_Teacher 
--where max(Max_book.count)= count(S_Cards.DateOut)
group by  Authors.FirstName+' '+Authors.LastName
having count(T_Cards.DateOut) = (select max(Max_books.count)
									from Max_books 
									)

--11. Вывести самую популярную(ые) тематику(и) среди студентов и преподавателей.





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



--12. Отобразить количество преподавателей и студентов, посе-тивших библиотеку.




Select  count(Students.FirstName ),'Студенты'
From Students inner join S_cards inner join Books
on 
Books.Id = S_Cards.Id_book
on
Students.Id = S_Cards.Id_student

UNION 

Select count(Teachers.FirstName) , 'Преподаватели'
From Teachers inner join T_cards  inner join Books
on 
Books.Id = T_Cards.Id_book
on 
Teachers.Id = T_Cards.Id_Teacher


--13. Если считать общее количество книг в библиотеке за 100%, то необходимо подсчитать, сколько книг (в процентном отношении) брал каждый факультет.
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

--14. Отобразить самый читающий факультет и самую читающую кафедру.
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




--15. Показать автора (ов) самых популярных книг среди препода-вателей и студентов.

--16. Отобразить названия самых популярных книг среди препода-вателей и студентов.

--17. Показать всех студентов и преподавателей дизайнеров.

--18. Показать всю информацию о студентах и преподавателях,бравших книги.

--19. Показать книги, которые брали и преподаватели и студенты.

--20. Показать сколько книг выдал каждый из библиотекарей.