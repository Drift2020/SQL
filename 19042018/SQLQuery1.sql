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

create table #ttables 
( 
id int,
id_stud int,
[date] datetime 
) 

insert into #ttables 
select id as ID , Id_Student as ID_S,max(DateOut)as [date]
from S_Cards
where GETDATE()-DateOut > 2
group by Id_Student,ID


delete from S_Cards 
where Id_Student in (select id_stud from #ttables) and DateOut in (select [date] from #ttables)


drop table #ttables
go


--6. ���� �������� ����� ���������, �� �������� 2 ���������� ����� ������ ������
--(���� ������� ����� � �������)

CREATE TRIGGER Upi
ON S_Cards 
for insert
AS

declare table_con cursor scroll  for select Id_Student,Id_Book, DateOut, DateIn,Id_Lib from inserted -- ��������� ������
open table_con -- ��������� ������, �������� ������, ��������� � �������
declare @Id_Student int,@Id_Book int, @DateOut datetime, @DateIn datetime,@Id_Lib int

fetch next from table_con into @Id_Student ,@Id_Book,@DateOut,@DateIn,@Id_Lib

while @@FETCH_STATUS = 0 
begin

if(@Id_Student in (select id from Students where FirstName like '���������'))
begin
INSERT INTO S_Cards (Id_Student, Id_Book, DateOut, DateIn,Id_Lib) 
VALUES ( @Id_Student, @Id_Book, @DateOut, @Id_Lib)
end
end

go


--7. ���� � ������� ��� �����, ������� ����� ����� �������������, ������ ��� ���� ��������� �����.
--���� ����� ����������� ������, ������ ��������� �� ����.




--8. ������� ���, ����� ������ ���� ������� ������ ����, ��� �� ���� ����������.


