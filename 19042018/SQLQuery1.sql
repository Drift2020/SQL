--1. при взятии определённой книги студентом или преподавателем,
--её количество в таблице Books должно уменьшаться на 1.
use LibrarySQL
go

CREATE TRIGGER Select_book
ON S_Cards  
AFTER insert
AS

update Books set Quantity = Quantity-1
where id in (select id from  inserted)


go

--2. сделать так, чтобы нельзя было выдать книгу,
--количество которой в библиотеке 0 (выдать сообщение - книги закончились).


CREATE TRIGGER Select_book_is_null
ON S_Cards 
after insert
AS

if exists( select * from books inner join S_Cards on S_Cards.Id_Book=Books.Id where Quantity < 1)
begin

delete from S_Cards
where id in (select id from books inner join inserted on books.Id=inserted.Id_Book where books.Quantity<1 )

end 
go

--3. при возврате книги студентом или преподавателем,
--её количество в таблице Books должно увеличиваться на 1.

CREATE TRIGGER Delete_book
ON S_Cards 
for delete
AS


update Books set Quantity = Quantity+1
where id in (select id from  deleted)

go
--4. сделать так, чтобы нельзя было выдать книгу студенту,
--если у него на руках 3 невозвращённые книги.

CREATE TRIGGER not_stude_book
ON S_Cards 
for update
AS

declare table_con cursor scroll  for select Id_Student,Id from inserted -- объявляем курсор
open table_con -- открываем курсор, выполняя запрос, указанный в курсоре
declare @idSTUD int, @idCards int

fetch next from table_con into @idSTUD ,@idCards-- забираем первую запись

while @@FETCH_STATUS = 0 
begin

if (
	select count(id) 
	from S_Cards 
	where @idSTUD=id
	)>=3
begin 

delete from S_Cards 
where @idCards = S_Cards.Id

fetch next from table_con into @idSTUD ,@idCards
end

end
close table_con -- закрываем курсор
deallocate table_con
go


--5. нельзя выдать книгу студенту, если прошлую книгу он читал дольше двух месяцев.

CREATE TRIGGER Delete_book_date
ON S_Cards 
for delete
AS


delete Books set Quantity = Quantity+1
where id in (select id from  deleted)

go


--6. если студента зовут Александр, он получает 2 экземпляра книги вместо одного
--(если конечно книги в наличии)




--7. если в наличии нет книги, которую хочет взять преподаватель, выдать ему одну случайную книгу.
--если книги закончились вообще, выдать сообщение об этом.





--8. сделать так, чтобы нельзя было вернуть больше книг, чем их было изначально.


