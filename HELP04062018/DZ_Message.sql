-- ���������� ����� �������� ������������ ���������
-- ���
-- �������
-- ���
--+ �������������� ����, ��������� � �������.

--1. �������� TOP-10 ������������� � ����� ������� ������� ��������� ������ (Anketa_Rate, AVG, ������� ������� ������ ���� ����������� � ���� ������������� �����).

declare @rate int


select top 10 u.user_id, u.nick, u.age, gender.name , AVG(anketa_rate.rating)as[lol]
from  anketa_rate inner join users as u inner join gender on gender.id = u.sex on anketa_rate.id_kogo= u.user_id 
group by u.user_id, u.nick, u.age, gender.name
order by [lol] desc

-- --select*
-- --from sys.systypes



----create type mytable as table (id int ,[sum] int)
----declare @My_table mytable

----declare my_rate cursor scroll  for select anketa_rate.rating,anketa_rate.id_kogo from anketa_rate -- ��������� ������
----open my_rate -- ��������� ������, �������� ������, ��������� � �������
----declare @id int, @sum int 
----fetch next from my_rate into @sum, @id -- �������� ������ ������

----declare my_rate_y cursor scroll  for select anketa_rate.rating,anketa_rate.id_kogo from anketa_rate -- ��������� ������
----open my_rate_y -- ��������� ������, �������� ������, ��������� � �������
----declare @id_y int, @sum_y int 
----fetch next from my_rate_y into @sum_y, @id_y -- �������� ������ ������

----declare @end_sum int , @count int 

----while @@FETCH_STATUS = 0
----begin

----set @end_sum = @end_sum + @sum_y

----	while @@FETCH_STATUS = 0
----	begin
----		if(@id_y=@id)
----		begin
----		set @end_sum = @end_sum + @sum
----		set @count = @count + 1
----			--raiserror('%d-%d', 0, 25, @sum,@id)
----		end
----			fetch next from my_rate into @sum, @id	-- �������� ��������� ������
		
----	end
----	fetch first from my_rate into @sum, @id
----	 set @end_sum =  @end_sum /@count
----	 insert  @My_table (id,[sum])
----	values(@end_sum,@id_y)


----	fetch next from my_rate_y into @sum_y, @id_y
----	set @end_sum=0
----	set @count = 1
----end
----close my_rate -- ��������� ������
----deallocate my_rate -- ������� ������, ���������� ��� ������
----close my_rate_y -- ��������� ������
----deallocate my_rate_y -- ������� ������, ���������� ��� ������

--select *
from @My_table
--2. �������� ���� ������������� � ������ ������������, ������� �� �����, �� ���� � �� ����������� ���������.

select  u.user_id, u.nick, u.age, gender.name ,e.name,s.name,d.name, dr.name
from education as e inner join
 users as u inner join 
 gender on gender.id = u.sex on e.id = u.id_education inner join
  smoking as s on s.id=u.my_smoke inner join 
  drinking as d on d.id=u.my_drink inner join drugs as dr on dr.id = u.my_drugs
where e.id = 4 and s.id=1  and d.id=1 and dr.id=1


--3. ������� ������, ������� �������� ����� ������������� �� ��������� ������:
--- ��� (�� ����������� ������)
--- ���
--- ����������� �������
--- ������������ �������
--- ����������� ����
--- ������������ ����
--- ����������� ���
--- ������������ ���

declare @nic nvarchar(50) , @gender nvarchar(50), @min_age int ,
 @max_age int , @min_hege int ,@max_hege int, @max_mass int, @min_mass int

 set @nic = 'a'
 set @min_mass = 50
 set @max_mass = 70
 set @min_age = 15
 set @max_age = 20
 set @max_hege = 200
  set @min_hege = 150

select u.nick, u.age, gender.name
from  users as u inner join gender on gender.id = u.sex 
where u.nick like ('%'+@nic+'%') and
 @min_mass>= u.ves and u.ves <= @max_mass and
 @min_age>= u.age and u.age <= @max_age and
  @min_hege>= u.rost and u.rost <= @max_hege





--4. �������� ���� �������� ������������ ���������, ����� ���� ���������� ���������� ��������, � � ����� �� ����� ���������� (UNION, ����� �������� �� SELECT).

 
select u.nick, gender.name
from  users as u inner join 
gender on gender.id = u.sex inner join
 eyescolor as e on e.id = u.eyes_color inner join 
  haircolor as h on h.id = u.hair_color  inner join 

 figure as f on f.id  = u.my_build
 where e.id = 4 and gender.id = 2 and h.id= 1 and f.


 select u.nick, gender.name
from  users as u inner join 
gender on gender.id = u.sex inner join
 eyescolor as e on e.id = u.eyes_color inner join
 haircolor as h on h.id = u.hair_color

 
 where e.id = 2 and gender.id = 1 and h.id=4
