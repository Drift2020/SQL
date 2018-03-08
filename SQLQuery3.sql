
--1. Отобразить все издательства, которые выпустили новинки после 2000 года.
SELECT  izd, [Date]
FROM my_
WHERE Year([Date]) >2000
--GROUP BY izd
--2. Отобразить книги, у которых количество страниц больше, чем среднее арифметическое число страниц всех книг.

SELECT * 
FROM my_
WHERE Pages > (select AVG(Pages) FROM my_);

--3. Отобразить тематики и сумму страниц по тематикам, учитывая при этом только книги с ценой >50.

SELECT Themes, sum(Pages)
FROM my_
WHERE Price > 50
GROUP BY Themes;


--4. Отобразить все темы, у которых не указана категория.

SELECT distinct Themes 
FROM my_
WHERE Category is NULL

--5. Отобразить самую дорогую книгу издательства BHV (2 способа).
SELECT * 
FROM my_
WHERE Izd like '%BHV%'  and  Price = (select max(Price) FROM my_ WHERE Izd like '%BHV%');

SELECT TOP 1 * 
FROM my_
WHERE Izd like '%BHV%'
ORDER BY Price DESC ;


--6. Отобразить издательство, у которого наибольшее количество страниц (2 способа).??????????????????????????

go
CREATE VIEW sum_pages (sum_of_pages) AS SELECT sum(pages) FROM my_ GROUP BY izd;
go
SELECT izd, sum(pages) AS [количество страниц]
FROM my_
GROUP BY izd
HAVING sum(pages)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, Sum(pages) AS [Количество страниц]
FROM my_
GROUP BY my_.izd
ORDER BY 2 DESC;

--7. Отобразить издательство, у которого наибольшее количество книг по программированию (2 способа).

WITH sum_pages AS
(SELECT count(Themes) AS sum_of_pages FROM my_ WHERE Themes like '%Программирование%'  GROUP BY izd)
SELECT izd, count(Themes) AS [Книг по программированию]
FROM my_
WHERE Themes like  '%Программирование%'
GROUP BY izd
HAVING count(Themes)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, count(Themes) AS [Книг по программированию]
FROM my_
WHERE Themes like '%Программирование%'
GROUP BY my_.izd
ORDER BY 2 DESC;

--8. Определить, сколько издано книг по каждой тематике.

SELECT Themes, count(N) AS [Книг по теме]
FROM my_
GROUP BY Themes

--9. Отобразить самую дешевую книгу в каждой из следующих тематик: Программирование, Базы данных клиент-сервер, Мультимедиа.  ??????????????

WITH min_price AS
(SELECT min(price) AS min_of_price FROM my_ WHERE Themes like '%Программирование%' or Themes like 'Базы данных клиент-сервер' or Themes like 'Мультимедиа'   GROUP BY Themes)
SELECT *
FROM my_

GROUP BY izd
HAVING min(price) =(
					SELECT min(min_of_price )
					
					FROM min_price
				  );




--10. Показать издательства и самую старую книгу для каждого из них.



SELECT izd, Name
FROM my_
WHERE Date like  '%Программирование%'
GROUP BY izd
HAVING count([Date])=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

--11. Показать количество выпущенных книг-новинок по каждому издательству.

--12. Отобразить издательство, у которого наибольшее количество книг-новинок (2 способа).

--13. Вывести процентный вклад каждой тематики в прайс-листе.

--14. Найти среднюю цену книг, выпущенных издательствами весной 1999 года, для каждого издательства.

--15. Вывести книгу, выпущенную наибольшим тиражом (2 способа).

--16. Вывести издательства, у которых число выпущенных книг превышает 5% от общего числа книг.

--17. Вывести книгу, в коде которой присутствуют ровно 2 семерки.

--18. Вывести издательства, из букв которых можно собрать слово «лак».

--19. Вывести книги, названия которых не содержат английских букв, с числом страниц, кратным 2.

--20. Вывести количество книг, у которых не указана дата выпуска.