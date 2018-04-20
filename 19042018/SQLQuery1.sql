--1. ��� ������ ����������� ����� ��������� ��� ��������������,
--� ���������� � ������� Books ������ ����������� �� 1.
use LibrarySQL
go

CREATE TRIGGER Select_book
ON S_Cards  
AFTER insert
AS

update Books set Quantity = Quantity-1
where id in (select id from  inserted)


go

--2. ������� ���, ����� ������ ���� ������ �����,
--���������� ������� � ���������� 0 (������ ��������� - ����� �����������).


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

--3. ��� �������� ����� ��������� ��� ��������������,
--� ���������� � ������� Books ������ ������������� �� 1.

CREATE TRIGGER Delete_book
ON S_Cards 
for delete
AS


update Books set Quantity = Quantity+1
where id in (select id from  deleted)

go
--4. ������� ���, ����� ������ ���� ������ ����� ��������,
--���� � ���� �� ����� 3 �������������� �����.

CREATE TRIGGER not_stude_book
ON S_Cards 
for update
AS

declare table_con cursor scroll  for select Id_Student,Id from inserted -- ��������� ������
open table_con -- ��������� ������, �������� ������, ��������� � �������
declare @idSTUD int, @idCards int

fetch next from table_con into @idSTUD ,@idCards-- �������� ������ ������

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
close table_con -- ��������� ������
deallocate table_con
go


--5. ������ ������ ����� ��������, ���� ������� ����� �� ����� ������ ���� �������.

CREATE TRIGGER Delete_book_date
ON S_Cards 
for insert
AS


delete from inserted inner join S_Cards on
where Id_Student in (select Id_Student,max(DateOut)
					 from S_Cards
					 where GETDATE()-DateOut > 2
					 group by Id_Student
					 )

go


--6. ���� �������� ����� ���������, �� �������� 2 ���������� ����� ������ ������
--(���� ������� ����� � �������)

CREATE TRIGGER Upi
ON S_Cards 
for insert
AS

insert into S_Cards (money) values (500)
from S_Cards 
where Id_Student in (
					 select Id_Student,LastName
					 from S_Cards inner join Students on students.Id = S_Cards.Id_Student
					 where students.FirstName like '���������'
				
					 )

go


--7. ���� � ������� ��� �����, ������� ����� ����� �������������, ������ ��� ���� ��������� �����.
--���� ����� ����������� ������, ������ ��������� �� ����.





--8. ������� ���, ����� ������ ���� ������� ������ ����, ��� �� ���� ����������.


