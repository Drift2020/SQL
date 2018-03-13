--1. ���������� ������, ������� ���� ������ ����������� ��������� ����.
SELECT Country.Name,Country.Champion
from Country

WHERE  Country.Champion = (
							select max(Country.Champion)
							from country
							)


--2. ���������� ���������� �����, �������������� ������ ����������� �� ���������� ����.

SELECT continent.name, count(country.CurrencyId)
FROM continent, country
WHERE continent.id=country.continentId
GROUP BY continent.name
ORDER BY 2 DESC;

--3. ���������� ����������� ������, ������� ���� ������ ����������� ��������� ����.

Select Country.Name, Country.Champion
from Country, Continent
WHERE country.CurrencyId = continent.id and continent.Name like '������' and Country.Champion = (
																								select max(Country.Champion)
																								from 	Country, Continent
																								where country.CurrencyId = continent.id and continent.Name like '������'
																								)


--4. ���������� ������, ���������� ������� ����������.
Select Country.Name , Country.Territory
from Country
where Country.Territory=(
							select max(country.Territory)
							from Country
							)

--5. ���������� ����������� ������, ���������� ������� ����������.

Select Country.Name , Country.Territory , Continent.Name
from Country, Continent
where Country.Territory=(
							select max(country.Territory)
							from Country
							where country.CurrencyId = continent.id and continent.Name like '������'
							)  

--6. ���������� �� ������� ���������� ���������� �����, ������� ����������� ���������� ����.

Select Continent.Name ,count(Country.CurrencyId)
from Continent , Country
WHERE continent.id=country.continentId and Country.Champion > 0
group by Continent.Name

--7. ���������� ��� ������� ���������� ��������� ���������� ����������� �������.

Select Continent.Name ,sum(Country.Champion)
from Continent , Country
WHERE continent.id=country.continentId
group by Continent.Name

--8. ���������� �� ������� ���������� ������� �������� ���������� ��� �����, �������� � ���� ���������.

select Continent.Name, AVG(Country.Territory)
from Continent, Country
where Country.ContinentId = Continent.Id
GROUP BY Continent.Name


--9. ���������� ���������� �����-���������� ��� ������� ����������.

Select Continent.Name, count(Country.Debut)
from Country,Continent
where Country.Debut > 0 and Country.ContinentId = Continent.Id
group by Continent.Name

--10. ���������� ��� ������� ����� ���������� �����, � ������� ���� ���� �������� �����������.

select Language.Name , count(Country.Name)
from Language, Country
where Language.Id = Country.

--11. ���������� ����������� ������, ���������� ������� ����������.
--12. ���������� ��� ������ ������ ���������� �����, � ������� ��� ������ �������� ������������.
--13. ���������� �������� ���������������� ���� � ������� ���������� �����, � ������� �� �������� �����������.
--14. ���������� ���������, � �������� ����� ������� ��������� ���������� �� ����������� �������.
--15. ���������� �������� ���������������� ���� ����� ����� ������������ � ������������ �����������.