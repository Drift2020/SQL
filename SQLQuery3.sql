
--1. ���������� ��� ������������, ������� ��������� ������� ����� 2000 ����.
SELECT  izd, [Date]
FROM books
WHERE Year([Date]) >2000
--GROUP BY izd
--2. ���������� �����, � ������� ���������� ������� ������, ��� ������� �������������� ����� ������� ���� ����.

SELECT * 
FROM books
WHERE Pages > (select AVG(Pages) FROM books);

--3. ���������� �������� � ����� ������� �� ���������, �������� ��� ���� ������ ����� � ����� >50.

SELECT Themes, sum(Pages)
FROM books
WHERE Price > 50
GROUP BY Themes;


--4. ���������� ��� ����, � ������� �� ������� ���������.

SELECT Themes, count(Category)
FROM books
WHERE Category is NULL
GROUP BY Themes

--5. ���������� ����� ������� ����� ������������ BHV (2 �������).
SELECT * 
FROM books
WHERE Izd like '%BHV%'  and  Price = (select max(Price) FROM books WHERE Izd like '%BHV%');

SELECT TOP 1 * 
FROM books
WHERE Izd like '%BHV%'
ORDER BY Price DESC ;


--6. ���������� ������������, � �������� ���������� ���������� ������� (2 �������).??????????????????????????

go
CREATE VIEW sum_pages (sum_of_pages) AS SELECT sum(pages) FROM books GROUP BY izd;
go
SELECT izd, sum(pages) AS [���������� �������]
FROM books
GROUP BY izd
HAVING sum(pages)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, Sum(pages) AS [���������� �������]
FROM books
GROUP BY books.izd
ORDER BY 2 DESC;

--7. ���������� ������������, � �������� ���������� ���������� ���� �� ���������������� (2 �������).

WITH sum_pages AS
(SELECT count(Themes) AS sum_of_pages FROM books WHERE Themes like '%����������������%'  GROUP BY izd)
SELECT izd, count(Themes) AS [���� �� ����������������]
FROM books
WHERE Themes like  '%����������������%'
GROUP BY izd
HAVING count(Themes)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, count(Themes) AS [���� �� ����������������]
FROM books
WHERE Themes like '%����������������%'
GROUP BY books.izd
ORDER BY 2 DESC;

--8. ����������, ������� ������ ���� �� ������ ��������.

SELECT Themes, count(N) AS [���� �� ����]
FROM books
GROUP BY Themes;

--9. ���������� ����� ������� ����� � ������ �� ��������� �������:
-- ����������������, ���� ������ ������-������, �����������.  ??????????????

WITH min_price AS
(SELECT min(price) AS min_of_price FROM books  WHERE Themes like '����������������'    GROUP BY Themes),
 min_price_base AS
(SELECT min(price) AS min_of_price_base FROM books  WHERE Themes like '���� ������ ������-������'    GROUP BY Themes),
 min_price_mylti AS
(SELECT min(price) AS min_of_mylti FROM books  WHERE Themes like '�����������'    GROUP BY Themes)
SELECT *
FROM books
WHERE (Themes like '����������������' and price =(
					SELECT min_of_price 					
					FROM min_price
				  ) ) or (Themes like '���� ������ ������-������' and price =(
					SELECT min_of_price_base 					
					FROM min_price_base
				  ) ) or (Themes like '�����������' and price =(
					SELECT min_of_mylti 					
					FROM min_price_mylti
				  ) )



SELECT Themes , min(Price)
from books
where Themes like '%����������������%' or Themes like '%���� ������%'or Themes like '%�����������%'
group by Themes;

--10. �������� ������������ � ����� ������ ����� ��� ������� �� ���.


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
--11. �������� ���������� ���������� ����-������� �� ������� ������������.
SELECT  izd, count(new)
FROM books 
GROUP BY izd;

--12. ���������� ������������, � �������� ���������� ���������� ����-������� (2 �������).
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

--13. ������� ���������� ����� ������ �������� � �����-�����.
SELECT Themes, ROUND( count(n)/(SELECT CAST(count(n) AS float) FROM books)*100,2)
FROM books
GROUP BY Themes

--14. ����� ������� ���� ����, ���������� �������������� ������ 1999 ����, ��� ������� ������������.

SELECT Izd,  (sum(price)/count(price)) as [������� ����]
FROM books
WHERE [Date] BETWEEN '1999-03-01 00:00:00'
  AND '1999-05-31 00:00:00'
GROUP BY Izd

--15. ������� �����, ���������� ���������� ������� (2 �������).
Select *
from books
WHERE Pressrun = (
					select max(Pressrun)
					from books

					)

Select TOP 1 *
from books
ORDER BY Pressrun DESC 

--16. ������� ������������, � ������� ����� ���������� ���� ��������� 5% �� ������ ����� ����.


Select izd ,sum(Pressrun)
from books 
GROUP BY Izd
HAVING sum(Pressrun) > (
						select sum(Pressrun) * 5 /100
						from books
						
						)
ORDER BY 2 DESC

--17. ������� �����, � ���� ������� ������������ ����� 2 �������.

Select *
from books
Where Code  like  '%7%7%'and Code not like  '%7%7%7%'
order by Code desc
--18. ������� ������������, �� ���� ������� ����� ������� ����� ����.
Select  izd
from books
Where  izd like '%�%'and   izd like '%�%'and   izd like '%�%'
GROUP BY izd


--19. ������� �����, �������� ������� �� �������� ���������� ����, � ������ �������, ������� 2. 
-- �������� ���������, ������ PC �������� �������� �������

select * 
from books
WHERE [Name] not like '%[A-Z]%' and  CAST(Pages AS int)  % 2 = 0


--20. ������� ���������� ����, � ������� �� ������� ���� �������.

select count(n)
from books
where [Date] is NULL