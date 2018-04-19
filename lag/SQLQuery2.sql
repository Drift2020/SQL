
--�������� �����, ���� ������� ��� ������� ������
--� ������� TRIANGLES, �������������� ��� ������� ����.
--������� ���� � ��������� ��������� ��� ������� ������ � �������:

--- ������������: �� ��������� � ������ ��������� �������� �������.
--- �����������: �� ��������� � ����� ��������� �������� �������.
--- Scalene: �� ��������� � ������ ��������� ���� �������.
--- �� ���������: ����� �������� A, B �� C �� ��������� ����������.

--������� TRIANGLES ��������� ��������� �����:

--A B C
--20 20 20
--20 20 21
--20 21 22
--20 21 60

--����� ����� � ������� ������� ������� ������� � ��� ������� ����������.

--������ ������

--г�����������
--г��������
--������
--�� ���������
USE TRIANGLES;
GO
CREATE PROCEDURE ProductSummary @n int, @a int ,@b int, @c int AS
BEGIN

	if @a=@b and @b=@c
	raiserror('������������ #%d', 0, 25,@n)
	else if @a=@b or @b=@c or @c=@a
	raiserror('����������� #%d', 0, 25,@n)
	else if @a != @b and @b != @c and @c != @a  
	and @a < @b*2 and @a < @c*2 
	and @b < @c*2 and @b < @a*2 
	and @c < @a*2 and @c < @b*2 
	raiserror('������ #%d', 0, 25,@n)
	else
	raiserror('�� ��������� #%d', 0, 25,@n)

END;
go

declare [table_my] cursor for select id,side1,side2,side3 from Table_1   -- ��������� ������
open [table_my] 

declare @id int,@side1 int,@side2 int,@side3 int
fetch next from [table_my] into @id, @side1, @side2, @side3

while @@FETCH_STATUS = 0 
begin

exec ProductSummary @id, @side1, @side2, @side3
fetch next from [table_my] into @id, @side1, @side2, @side3

end

close [table_my]-- ��������� ������
deallocate [table_my]