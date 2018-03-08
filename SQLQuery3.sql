
--1. ���������� ��� ������������, ������� ��������� ������� ����� 2000 ����.
SELECT  izd, [Date]
FROM my_
WHERE Year([Date]) >2000
--GROUP BY izd
--2. ���������� �����, � ������� ���������� ������� ������, ��� ������� �������������� ����� ������� ���� ����.

SELECT * 
FROM my_
WHERE Pages > (select AVG(Pages) FROM my_);

--3. ���������� �������� � ����� ������� �� ���������, �������� ��� ���� ������ ����� � ����� >50.

SELECT Themes, sum(Pages)
FROM my_
WHERE Price > 50
GROUP BY Themes;


--4. ���������� ��� ����, � ������� �� ������� ���������.

SELECT distinct Themes 
FROM my_
WHERE Category is NULL

--5. ���������� ����� ������� ����� ������������ BHV (2 �������).
SELECT * 
FROM my_
WHERE Izd like '%BHV%'  and  Price = (select max(Price) FROM my_ WHERE Izd like '%BHV%');

SELECT TOP 1 * 
FROM my_
WHERE Izd like '%BHV%'
ORDER BY Price DESC ;


--6. ���������� ������������, � �������� ���������� ���������� ������� (2 �������).??????????????????????????

go
CREATE VIEW sum_pages (sum_of_pages) AS SELECT sum(pages) FROM my_ GROUP BY izd;
go
SELECT izd, sum(pages) AS [���������� �������]
FROM my_
GROUP BY izd
HAVING sum(pages)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, Sum(pages) AS [���������� �������]
FROM my_
GROUP BY my_.izd
ORDER BY 2 DESC;

--7. ���������� ������������, � �������� ���������� ���������� ���� �� ���������������� (2 �������).

WITH sum_pages AS
(SELECT count(Themes) AS sum_of_pages FROM my_ WHERE Themes like '%����������������%'  GROUP BY izd)
SELECT izd, count(Themes) AS [���� �� ����������������]
FROM my_
WHERE Themes like  '%����������������%'
GROUP BY izd
HAVING count(Themes)=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

SELECT TOP 1 izd, count(Themes) AS [���� �� ����������������]
FROM my_
WHERE Themes like '%����������������%'
GROUP BY my_.izd
ORDER BY 2 DESC;

--8. ����������, ������� ������ ���� �� ������ ��������.

SELECT Themes, count(N) AS [���� �� ����]
FROM my_
GROUP BY Themes

--9. ���������� ����� ������� ����� � ������ �� ��������� �������: ����������������, ���� ������ ������-������, �����������.  ??????????????

WITH min_price AS
(SELECT min(price) AS min_of_price FROM my_ WHERE Themes like '%����������������%' or Themes like '���� ������ ������-������' or Themes like '�����������'   GROUP BY Themes)
SELECT *
FROM my_

GROUP BY izd
HAVING min(price) =(
					SELECT min(min_of_price )
					
					FROM min_price
				  );




--10. �������� ������������ � ����� ������ ����� ��� ������� �� ���.



SELECT izd, Name
FROM my_
WHERE Date like  '%����������������%'
GROUP BY izd
HAVING count([Date])=(
					SELECT max(sum_of_pages) 
					FROM sum_pages
				  );

--11. �������� ���������� ���������� ����-������� �� ������� ������������.

--12. ���������� ������������, � �������� ���������� ���������� ����-������� (2 �������).

--13. ������� ���������� ����� ������ �������� � �����-�����.

--14. ����� ������� ���� ����, ���������� �������������� ������ 1999 ����, ��� ������� ������������.

--15. ������� �����, ���������� ���������� ������� (2 �������).

--16. ������� ������������, � ������� ����� ���������� ���� ��������� 5% �� ������ ����� ����.

--17. ������� �����, � ���� ������� ������������ ����� 2 �������.

--18. ������� ������������, �� ���� ������� ����� ������� ����� ����.

--19. ������� �����, �������� ������� �� �������� ���������� ����, � ������ �������, ������� 2.

--20. ������� ���������� ����, � ������� �� ������� ���� �������.