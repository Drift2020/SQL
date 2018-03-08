--1 Отобразить список авторов книг без повторений. Отсортировать по возрастанию.

SELECT distinct(author) as [Авторы]
FROM books
ORDER BY author

--2 Отобразить книги по программированию издательств «Питер» и «BHV».
SELECT Name as [Названия книг] ,Press as [Издательство], Themes as [Тема]
FROM books
WHERE (Press like 'BHV' or  Press like 'Питер') and Themes like 'Программирование'
ORDER BY Press

--3. Отобразить все книги, у которых количество страниц лежит в пределах от 200 до 600.

SELECT Name as [Названия книг] , Pages as  [Количество страниц]
FROM books
WHERE Pages BETWEEN 200 and  600
ORDER BY Pages

--4. Отобразить все книги, имена авторов которых лежат 
--в диапазоне от буквы 'В' до 'О'. Отсортировать по возрастанию (по авторам).

SELECT Name as [Названия книг] ,author as [Авторы]
FROM books
WHERE author like '[В-О]%'
ORDER BY author

--5 Выбрать книги, относящиеся к программированию или к базам данных, 
--и издательства которых не 'Питер' и не 'Бином'.

SELECT Name as [Названия книг] ,Press as [Издательство], Themes as [Тема]
FROM books
WHERE (Themes like 'Программирование' or Themes like 'Базы данных') and (Press <> 'Питер' and Press <> 'Бином')
ORDER BY Press,Themes

--6. Выбрать из таблицы тех авторов (без повторений), у которых в имени  не менее двух букв 'а'.

SELECT distinct(author) as [Авторы]
FROM books
WHERE author like '%а%а%'
ORDER BY author

--7. Отобразить всех авторов и их книги. Авторов отсортировать по возрастанию,
-- а названия книг (по авторам) по убыванию (вторичная сортировка).
SELECT Name as [Названия книг] ,author as [Авторы]
FROM books
ORDER BY author,Name DESC 

--8. Выбрать из таблицы книги, названия которых начинаются с цифры.
SELECT Name as [Названия книг]
FROM books
WHERE Name like '[0-9]%'
ORDER BY Name 

--9. Выбрать из таблицы книги, названия которых заканчиваются на четыре цифры.

SELECT Name as [Названия книг]
FROM books
WHERE Name like '%[0-9][0-9][0-9][0-9]'
ORDER BY Name 

--10. Выбрать из таблицы книги, в названиях которых ровно две цифры.
SELECT Name as [Названия книг]
FROM books
WHERE Name like '%[0-9]%[0-9]%' and Name not like  '%[0-9]%[0-9]%[0-9]%'
ORDER BY Name

--11. Выбрать из таблицы книги, которые имеются в наличии в единственном экземпляре. 
--Отсортировать по возрастанию.

SELECT Name as [Названия книг], Quantity as [Количество]
FROM books
WHERE Quantity = 1 
ORDER BY Name

--12. Выбрать из таблицы книги по программированию, 
--не относящиеся к издательству «BHV», в названиях которых есть слово «Visual».

SELECT Name as [Названия книг], Themes as [Темы], Press as [Издательство]
FROM books
WHERE Themes like 'Программирование' and Press not like 'BHV' and Name like '%Visual%'
ORDER BY Name

--13. Отобразить книги по программированию и Web-дизайну,
-- которые относятся к издательствам «BHV» и «Бином».

SELECT Name as [Названия книг], Themes as [Темы], Press as [Издательство]
FROM books
WHERE (Themes like 'Программирование' or Themes like 'Web-дизайн')and   (Press like 'BHV' or Press like 'Бином')
ORDER BY Name,Themes

--14. Выбрать книги, являющиеся справочниками или руководством.
SELECT Name as [Названия книг], Comment 
FROM books
WHERE Comment like '%Справочник%' or Comment like '%Руководство%'
ORDER BY Name,Comment

--15. Отобразить книги, названия которых начинаются на английскую букву.
SELECT Name as [Названия книг]
FROM books
WHERE Name like '[A-Z]%' 
ORDER BY Name

--16. Отобразить книги, названия которых заканчиваются на русскую букву.
SELECT Name as [Названия книг]
FROM books
WHERE Name like '%[а-я]' 
ORDER BY Name

--17. Отобразить книги, в названии издательства которых ровно три символа.

SELECT Name as [Названия книг], Press as [Издательство]
FROM books
WHERE Press like '___' 
ORDER BY Press

--18. Отобразить книги по программированию за исключением книг по Pascal и Delphi.

SELECT Name as [Названия книг], Themes as [Темы]
FROM books
WHERE Themes  like 'Программирование'  and (Name not like '%Pascal%' and Name not like '%Delphi%')
ORDER BY Themes

--19. Вставить в таблицу следующие книги:
INSERT INTO books ( name, yearpress, themes, author, press, comment, quantity )
VALUES ('SQL', 2004, 'Базы данных', 'Генник', 'Питер', 'Карманный справочник', 3);
