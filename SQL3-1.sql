--���� ������ �Teams�. ���������� �������
--1. ���������� ���������� �����-�������� ���������� ����.
SELECT  count(country) As [��������� ���������� ����]
From Teams
--2. ���������� ���������� �����, ������������� ���������� ����.
SELECT count(country) As [������, ������������� ���������� ����]
From Teams
WHERE Champion > 0;

--3. ���������� ���������� �����-�������� ���������� ����, � ������� ����������� ������ �������� ��������� ����.
SELECT  count(country) As [��������� ���������� ����]
From Teams
WHERE Language like '%���������%';

--4. ���������� ���������� ���������� ���������� ����.
SELECT count(country) As [������, ������������ ���������� ����]
From Teams
WHERE Debut = 'true';

---5. ���������� ���������� ���������� �� ���� �����-��������. (2 ��������)

SELECT country, territory
From Teams
WHERE territory =(select max(territory) from Teams)

SELECT max(territory) As [���������]
From Teams

SELECT TOP 1 country, territory
From Teams
ORDER BY 2 DESC;
---6. ���������� ���������� ���������� �� ���� ����������� �����-��������. (2 ��������)

SELECT country, territory
From Teams
WHERE territory =(
					select max(territory) 
					from Teams 
					where Continent like '%������%'
					) and Continent like '%������%'

SELECT max(territory) As [���������]
From Teams
WHERE Continent like '%������%'


SELECT TOP 1 country, territory
From Teams
WHERE Continent like '%������%'
ORDER BY 2 DESC;

--7. ���������� ��������� ���������� ����������� �������, ���������� �������� �����������.

SELECT sum(Champion) as [��� ������]
From Teams



--8. ���������� ��������� ���������� ����������� �������, ���������� ������������ �������� �����������.
SELECT sum(Champion) as [��� ������]
From Teams
WHERE Continent like '%������%'


--9. ���������� ���������� ���������� �� ���� ������������ �����-��������. (2 ��������)

SELECT country, territory
From Teams
WHERE territory =(
					select min(territory) 
					from Teams 
					where Continent like '%�������%'
					) and Continent like '%�������%'

SELECT min(territory) As [���������]
From Teams
WHERE Continent like '%�������%'


SELECT TOP 1 country, territory
From Teams
WHERE Continent like '%�������%'
ORDER BY 2;

--10. ���������� ������� �������� ���������� ����� ����������� �����.

SELECT AVG(territory) As [��������� ����������� �����]
From Teams
WHERE Continent like '%������%'