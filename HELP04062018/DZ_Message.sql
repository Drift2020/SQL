-- ���������� ����� �������� ������������ ���������
-- ���
-- �������
-- ���
--+ �������������� ����, ��������� � �������.

--1. �������� TOP-10 ������������� � ����� ������� ������� ��������� ������ (Anketa_Rate, AVG, ������� ������� ������ ���� ����������� � ���� ������������� �����).

declare @rate int

select anketa_rate as [rate]
from  anketa_rate


select u.user_id, u.nick, u.age, gender.name , anketa_rate.rating

from  anketa_rate inner join users as u inner join gender on gender.id = u.sex on anketa_rate.id_kogo= u.user_id 


create type mytable as table (id int ,[sum] int)
declare @My_table mytable

--insert into t2
--values(250)
--select * from t2
declare my_rate cursor for select anketa_rate.rating,anketa_rate.id_kogo from anketa_rate -- ��������� ������
open my_rate -- ��������� ������, �������� ������, ��������� � �������
declare @id int, @sum int 
fetch next from my_rate into @sum, @id -- �������� ������ ������

declare my_rate_y cursor for select anketa_rate.rating,anketa_rate.id_kogo from anketa_rate -- ��������� ������
open my_rate_y -- ��������� ������, �������� ������, ��������� � �������
declare @id_y int, @sum_y int 
fetch next from my_rate_y into @sum_y, @id_y -- �������� ������ ������

declare @end_sum int , @count int 

while @@FETCH_STATUS = 0
begin

set @end_sum = @end_sum + @id_y

	while @@FETCH_STATUS = 0
	begin
		if(@id_y=@id)
		begin
		set @end_sum = @end_sum + @id
		set @count = @count + 1
			--raiserror('%d-%d', 0, 25, @sum,@id)
		end
			fetch next from my_rate into @sum, @id	-- �������� ��������� ������
		
	end
	fetch first from my_rate into @sum, @id
	 set @end_sum =  @end_sum /@count
	 insert into @My_table
	 values(@end_sum,@id_y)
  

	fetch next from my_rate_y into @sum_y, @id_y
	set @end_sum=0
	set @count = 0
end
close my_rate -- ��������� ������
deallocate my_rate -- ������� ������, ���������� ��� ������
close my_rate_y -- ��������� ������
deallocate my_rate_y -- ������� ������, ���������� ��� ������

--2. �������� ���� ������������� � ������ ������������, ������� �� �����, �� ���� � �� ����������� ���������.


--3. ������� ������, ������� �������� ����� ������������� �� ��������� ������:
--- ��� (�� ����������� ������)
--- ���
--- ����������� �������
--- ������������ �������
--- ����������� ����
--- ������������ ����
--- ����������� ���
--- ������������ ���

--4. �������� ���� �������� ������������ ���������, ����� ���� ���������� ���������� ��������, � � ����� �� ����� ���������� (UNION, ����� �������� �� SELECT).
