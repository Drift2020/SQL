
--Напишіть запит, який визначає тип кожного запису
--в таблиці TRIANGLES, використовуючи три довжини боків.
--Виведіть одне з наступних тверджень для кожного запису в таблиці:

--- рівностороння: це трикутник з трьома сторонами однакової довжини.
--- Двостороння: це трикутник з двома сторонами однакової довжини.
--- Scalene: це трикутник з трьома сторонами різної довжини.
--- Не трикутник: задані значення A, B та C не утворюють трикутника.

--Таблиця TRIANGLES описується наступним чином:

--A B C
--20 20 20
--20 20 21
--20 21 22
--20 21 60

--Кожен рядок у таблиці позначає довжину кожного з три сторони трикутника.

--Вибірка вибірки

--Рівносторонній
--Рівноправні
--Скаліне
--Не трикутник
USE TRIANGLES;
GO
CREATE PROCEDURE ProductSummary @n int, @a int ,@b int, @c int AS
BEGIN

	if @a=@b and @b=@c
	raiserror('рівностороння #%d', 0, 25,@n)
	else if @a=@b or @b=@c or @c=@a
	raiserror('Двостороння #%d', 0, 25,@n)
	else if @a != @b and @b != @c and @c != @a  
	and @a < @b*2 and @a < @c*2 
	and @b < @c*2 and @b < @a*2 
	and @c < @a*2 and @c < @b*2 
	raiserror('Скаліне #%d', 0, 25,@n)
	else
	raiserror('Не трикутник #%d', 0, 25,@n)

END;
go

declare [table_my] cursor for select id,side1,side2,side3 from Table_1   -- объявляем курсор
open [table_my] 

declare @id int,@side1 int,@side2 int,@side3 int
fetch next from [table_my] into @id, @side1, @side2, @side3

while @@FETCH_STATUS = 0 
begin

exec ProductSummary @id, @side1, @side2, @side3
fetch next from [table_my] into @id, @side1, @side2, @side3

end

close [table_my]-- закрываем курсор
deallocate [table_my]