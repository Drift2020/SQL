
--1. Отобразить все издательства, которые выпустили новинки после 2000 года.
SELECT  izd, [Date]
FROM books
WHERE Year([Date]) >2000
--GROUP BY izd
--2. Отобразить книги, у которых количество страниц больше, чем среднее арифметическое число страниц всех книг.

SELECT * 
FROM books
WHERE Pages > (select AVG(Pages) FROM books);

--3. Отобразить тематики и сумму страниц по тематикам, учитывая при этом только книги с ценой >50.

SELECT Themes, sum(Pages)
FROM books
WHERE Price > 50
GROUP BY Themes;


--4. Отобразить все темы, у которых не указана категория.

SELECT Themes, count(Category)
FROM books
WHERE Category is NULL
GROUP BY Themes

--5. Отобразить самую дорогую книгу издательства BHV (2 способа).
SELECT * 
FROM books
WHERE Izd like '%BHV%'  and  Price = (select max(Price) FROM books WHERE Izd like '%BHV%');

SELECT TOP 1 * 
FROM books
WHERE Izd like '%BHV%'
ORDER BY Price DESC ;


--6. Отобразить издательство, у которого наибольшее количество страниц (2 способа).??????????????????????????

go
CREATE VIEW sum_pages (sum_of_pages) AS SELECT sum(pages) FROM books GROUP BY izd;
go
SELECT izd, sum(pages) AS [количество страниц]
FROM books
GROUP BY izd
HAVING sum(pages)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, Sum(pages) AS [Количество страниц]
FROM books
GROUP BY books.izd
ORDER BY 2 DESC;

--7. Отобразить издательство, у которого наибольшее количество книг по программированию (2 способа).

WITH sum_pages AS
(SELECT count(Themes) AS sum_of_pages FROM books WHERE Themes like '%Программирование%'  GROUP BY izd)
SELECT izd, count(Themes) AS [Книг по программированию]
FROM books
WHERE Themes like  '%Программирование%'
GROUP BY izd
HAVING count(Themes)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, count(Themes) AS [Книг по программированию]
FROM books
WHERE Themes like '%Программирование%'
GROUP BY books.izd
ORDER BY 2 DESC;

--8. Определить, сколько издано книг по каждой тематике.

SELECT Themes, count(N) AS [Книг по теме]
FROM books
GROUP BY Themes;

--9. Отобразить самую дешевую книгу в каждой из следующих тематик:
-- Программирование, Базы данных клиент-сервер, Мультимедиа.  ??????????????

WITH min_price AS
(SELECT min(price) AS min_of_price FROM books  WHERE Themes like 'Программирование'    GROUP BY Themes),
 min_price_base AS
(SELECT min(price) AS min_of_price_base FROM books  WHERE Themes like 'Базы данных клиент-сервер'    GROUP BY Themes),
 min_price_mylti AS
(SELECT min(price) AS min_of_mylti FROM books  WHERE Themes like 'Мультимедиа'    GROUP BY Themes)
SELECT *
FROM books
WHERE (Themes like 'Программирование' and price =(
					SELECT min_of_price 					
					FROM min_price
				  ) ) or (Themes like 'Базы данных клиент-сервер' and price =(
					SELECT min_of_price_base 					
					FROM min_price_base
				  ) ) or (Themes like 'Мультимедиа' and price =(
					SELECT min_of_mylti 					
					FROM min_price_mylti
				  ) )



SELECT Themes , min(Price)
from books
where Themes like '%Программирование%' or Themes like '%Базы данных%'or Themes like '%Мультимедиа%'
group by Themes;

--10. Показать издательства и самую старую книгу для каждого из них.


--WITH min_price AS
--(SELECT min([Date]) AS min_of_price FROM books GROUP BY izd)

--SELECT  izd, Name,[Date]
--FROM books
--WHERE [Date] =    ANY(
--				SELECT min_of_price					
--				FROM min_price 					
--				)

--GROUP BY izd,[Date],Name


Select izd , min ([Date])
from books
where [Date] is not NULL
group by izd
--11. Показать количество выпущенных книг-новинок по каждому издательству.
SELECT  izd, count(new)
FROM books 
GROUP BY izd;

--12. Отобразить издательство, у которого наибольшее количество книг-новинок (2 способа).
WITH max_book AS
(SELECT count(new) AS max_of_book FROM books GROUP BY izd)

SELECT  izd, count(new)
FROM books 

GROUP BY izd
HAVING count(new) = (
					SELECT  max(max_of_book)
					FROM max_book
					)



SELECT  izd, count(new)
FROM books 

GROUP BY izd
HAVING count(new) = (
					SELECT TOP 1 count(new) 
					FROM books
					GROUP BY izd
					ORDER BY 1 DESC
					)

--13. Вывести процентный вклад каждой тематики в прайс-листе.
SELECT Themes, ROUND( count(n)/(SELECT CAST(count(n) AS float) FROM books)*100,2)
FROM books
GROUP BY Themes

--14. Найти среднюю цену книг, выпущенных издательствами весной 1999 года, для каждого издательства.

SELECT Izd,  (sum(price)/count(price)) as [Средняя цена]
FROM books
WHERE [Date] BETWEEN '1999-03-01 00:00:00'
  AND '1999-05-31 00:00:00'
GROUP BY Izd

--15. Вывести книгу, выпущенную наибольшим тиражом (2 способа).
Select *
from books
WHERE Pressrun = (
					select max(Pressrun)
					from books

					)

Select TOP 1 *
from books
ORDER BY Pressrun DESC 

--16. Вывести издательства, у которых число выпущенных книг превышает 5% от общего числа книг.


Select izd ,sum(Pressrun)
from books 
GROUP BY Izd
HAVING sum(Pressrun) > (
						select sum(Pressrun) * 5 /100
						from books
						
						)
ORDER BY 2 DESC

--17. Вывести книгу, в коде которой присутствуют ровно 2 семерки.

Select *
from books
Where Code  like  '%7%7%'and Code not like  '%7%7%7%'
order by Code desc
--18. Вывести издательства, из букв которых можно собрать слово «лак».
Select  izd
from books
Where  izd like '%к%'and   izd like '%л%'and   izd like '%а%'
GROUP BY izd


--19. Вывести книги, названия которых не содержат английских букв, с числом страниц, кратным 2. 
-- Работает правильно, просто PC написано русскими буквами

select * 
from books
WHERE [Name] not like '%[A-Z]%' and  CAST(Pages AS int)  % 2 = 0


--20. Вывести количество книг, у которых не указана дата выпуска.

select count(n)
from books
where [Date] is NULL