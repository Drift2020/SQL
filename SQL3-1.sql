--База данных «Teams». Агрегатные функции
--1. Определить количество стран-участниц чемпионата мира.
SELECT  count(country) As [Участники чемпионата мира]
From Teams
--2. Определить количество стран, становившихся чемпионами мира.
SELECT count(country) As [Страны, становившиеся чемпионами мира]
From Teams
WHERE Champion > 0;

--3. Определить количество стран-участниц чемпионата мира, в которых официальным языком является испанский язык.
SELECT  count(country) As [Участники чемпионата мира]
From Teams
WHERE Language like '%испанский%';

--4. Определить количество дебютантов чемпионата мира.
SELECT count(country) As [Страны, дебютантанты чемпионата мира]
From Teams
WHERE Debut = 'true';

---5. Определить наибольшую территорию из всех стран-участниц. (2 варианта)

SELECT country, territory
From Teams
WHERE territory =(select max(territory) from Teams)

SELECT max(territory) As [Територия]
From Teams

SELECT TOP 1 country, territory
From Teams
ORDER BY 2 DESC;
---6. Определить наибольшую территорию из всех европейских стран-участниц. (2 варианта)

SELECT country, territory
From Teams
WHERE territory =(
					select max(territory) 
					from Teams 
					where Continent like '%Европа%'
					) and Continent like '%Европа%'

SELECT max(territory) As [Територия]
From Teams
WHERE Continent like '%Европа%'


SELECT TOP 1 country, territory
From Teams
WHERE Continent like '%Европа%'
ORDER BY 2 DESC;

--7. Определить суммарное количество чемпионских титулов, выигранных странами участницами.

SELECT sum(Champion) as [Все титулы]
From Teams



--8. Определить суммарное количество чемпионских титулов, выигранных европейскими странами участницами.
SELECT sum(Champion) as [Все титулы]
From Teams
WHERE Continent like '%Европа%'


--9. Определить наименьшую территорию из всех американских стран-участниц. (2 варианта)

SELECT country, territory
From Teams
WHERE territory =(
					select min(territory) 
					from Teams 
					where Continent like '%Америка%'
					) and Continent like '%Америка%'

SELECT min(territory) As [Територия]
From Teams
WHERE Continent like '%Америка%'


SELECT TOP 1 country, territory
From Teams
WHERE Continent like '%Америка%'
ORDER BY 2;

--10. Определить среднее значение территории среди африканских стран.

SELECT AVG(territory) As [Територия африканских стран]
From Teams
WHERE Continent like '%Африка%'