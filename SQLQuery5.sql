--1. Отобразить страну, которая чаще других становилась чемпионом мира.
SELECT Country.Name,Country.Champion
from Country

WHERE  Country.Champion = (
							select max(Country.Champion)
							from country
							)


--2. Отобразить количество стран, представленное каждым континентом на чемпионате мира.

SELECT continent.name, count(country.CurrencyId)
FROM continent, country
WHERE continent.id=country.continentId
GROUP BY continent.name
ORDER BY 2 DESC;

--3. Отобразить европейскую страну, которая чаще других становилась чемпионом мира.

Select Country.Name, Country.Champion
from Country, Continent
WHERE country.CurrencyId = continent.id and continent.Name like 'Европа' and Country.Champion = (
																								select max(Country.Champion)
																								from 	Country, Continent
																								where country.CurrencyId = continent.id and continent.Name like 'Европа'
																								)


--4. Отобразить страну, территория которой наибольшая.
Select Country.Name , Country.Territory
from Country
where Country.Territory=(
							select max(country.Territory)
							from Country
							)

--5. Отобразить европейскую страну, территория которой наибольшая.

Select Country.Name , Country.Territory , Continent.Name
from Country, Continent
where Country.Territory=(
							select max(country.Territory)
							from Country
							where country.CurrencyId = continent.id and continent.Name like 'Европа'
							)  

--6. Отобразить по каждому континенту количество стран, которые становились чемпионами мира.

Select Continent.Name ,count(Country.CurrencyId)
from Continent , Country
WHERE continent.id=country.continentId and Country.Champion > 0
group by Continent.Name

--7. Отобразить для каждого континента суммарное количество чемпионских титулов.

Select Continent.Name ,sum(Country.Champion)
from Continent , Country
WHERE continent.id=country.continentId
group by Continent.Name

--8. Определить по каждому континенту среднее значение территории для стран, входящих в этот континент.

select Continent.Name, AVG(Country.Territory)
from Continent, Country
where Country.ContinentId = Continent.Id
GROUP BY Continent.Name


--9. Отобразить количество стран-дебютантов для каждого континента.

Select Continent.Name, count(Country.Debut)
from Country,Continent
where Country.Debut > 0 and Country.ContinentId = Continent.Id
group by Continent.Name

--10. Отобразить для каждого языка количество стран, в которых этот язык является официальным.

select Language.Name , count(Country.Name)
from Language, Country, CountryLanguage
where Country.id = CountryLanguage.CountryId and Language.Id = CountryLanguage.LanguageId
group by Language.Name

--11. Отобразить африканскую страну, территория которой наименьшая.

select  * 
from Country, Continent
where Country.Territory = (
							select min(Country.Territory) 
							from Country where Continent.Name = 'Африка' 
							and Continent.Id = Country.ContinentId)

							and  Continent.Name = 'Африка' and Continent.Id = Country.ContinentId

--12. Отобразить для каждой валюты количество стран, в которых эта валюта является национальной.

select Currency.name , count(Country.name)
from Currency,Country
where Country.CurrencyId=Currency.Id
group by Currency.Name

--13. Отобразить наиболее распространенный язык и указать количество стран, в которых он является официальным.??????????????????????????

select Language.Name , count(Country.Name)
from Language, Country, CountryLanguage
where Country.id = CountryLanguage.CountryId and Language.Id = CountryLanguage.LanguageId
group by Language.Name
HAVING  count(Country.Name) =  (select top 1 count(Country.Name)
								from Language, Country, CountryLanguage
								where Country.id = CountryLanguage.CountryId and Language.Id = CountryLanguage.LanguageId
								group by Language.Name
								order by 1 desc
								)



--14. Отобразить континент, у которого самый высокий суммарный показатель по чемпионским титулам.

select Continent.Name, sum(Country.Champion)
from Continent, Country
where Country.ContinentId = Continent.Id 
group by Continent.Name
HAVING  sum(Country.Champion) =  (select top 1 sum(Country.Champion)
																		from Continent, Country
																		where Country.ContinentId = Continent.Id
																		group by Continent.Name
																		order by 1 desc
																		)

--15. Отобразить наиболее распространенный язык среди стран европейского и африканского континентов.


select Language.Name , count(Country.Name)
from Language, Country, CountryLanguage,Continent
where Country.id = CountryLanguage.CountryId and Language.Id = CountryLanguage.LanguageId and Country.ContinentId = Continent.Id and (Continent.Name like 'Европа' or Continent.Name like  'Африка')
group by Language.Name
HAVING  count(Country.Name) =  (select top 1 count(Country.Name)
								from Language, Country, CountryLanguage,Continent
								where Country.id = CountryLanguage.CountryId and Language.Id = CountryLanguage.LanguageId and Country.ContinentId = Continent.Id and (Continent.Name like 'Европа' or Continent.Name like  'Африка')
								group by Language.Name
								order by 1 desc
								)

