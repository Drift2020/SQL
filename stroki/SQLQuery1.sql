--1. Ввести строку, а затем символ. Показать на экран индексы и количество совпадений.

declare @str nvarchar(200), @symbvol nvarchar(200)

set @str = 'asdfghjf'
set @symbvol = 'f'

  declare @i int =-1, @count int =0
  


  while  @i <> 0  
  begin
   set @i = CHARINDEX(@symbvol,@str,@i+1)
	if(@i <> 0)
	 begin

	  set @count=@count+1
	  raiserror('Indecs - %d', 0, 25,@i)

	 end 
  end

  raiserror('count - %d', 0, 25,@count)

--2. Подсчитать количество слов во введённом предложении.

declare @str1 nvarchar(200), @symbvol1 nvarchar(200)

set @str1 = 'asdfghjf dfgdfg dfgdfg dfgdfg gdfg'
set @symbvol1 = ' '

  declare @i1 int =-1, @count1 int =0
  


  while  @i1 <> 0  
  begin
   
    set @i1 = CHARINDEX(@symbvol1,@str1,@i1+1)
	if(@i1 <> 0)
	 begin

	  set @count1=@count1+1


	 end 
  end
   set @count1=@count1+1
  raiserror('count - %d', 0, 25,@count1)

--3. Определить, является ли строка палиндромом. Примеры палиндромов:
declare @str2 nvarchar(200) = 'Нажал кабан на баклажан',@str3 nvarchar(200)
SET @str2 = REPLACE(@str2, ' ', '');

set @str2=LOWER(@str2)
set @str3 = reverse(@str2)
if(@str2=@str3)
print('палиндром')
else
print('nooo палиндром')

--Нажал кабан на баклажан.
--Я так нежен, Катя.
--Nurse, I spy gypsies run!

--4. Посчитать, сколько раз заданное слово содержится в строке. not

declare @str5 nvarchar(200), @symbvol5 nvarchar(200)
set @str5 = 'Nurse, I spy gypsies run'
set @symbvol5 = 'run'


  declare @i5 int =-1, @count5 int =0,@iPS nvarchar(200),@iPE nvarchar(200) 
  set @iPS = @symbvol5 + ' '
  set @iPE =' ' + @symbvol5 


  while  @i5 <> 0
  begin

   set @i5 = CHARINDEX(@symbvol5,@str5,@i5+1)

	if(@i5 <> 0 )
	 begin

	  set @count5=@count5+1

	 end 
  end

  raiserror('count - %d', 0, 25,@count5)


--5. Проверить, содержит ли заданная строка слова 'viagra' или 'XXX'.


create database [kill]--пифагор
go
use [kill]
go
create table mat(
ID int not null primary key IDENTITY(1,1),
[str] nvarchar(255)
)
go


insert into mat ([str]) values ('viagra')
insert into mat ([str]) values ('xxx')
go 

declare @str_mat nvarchar(255)='buy ViAgRA now'

declare [table_my] cursor for select ID,[str] from  mat   -- объявляем курсор
open [table_my] 


declare @name nvarchar(200),@id int, @is_ bit = 1
fetch next from [table_my] into @id, @name


while @@FETCH_STATUS = 0 
begin

	if CHARINDEX(LOWER(@str_mat),@name,0)<>0
		begin
			print('Spam')
			set @is_=0
		end
	

	fetch next from [table_my] into @id,@name
end

if @is_ = 1
raiserror('Not spam', 0, 25, @name,@id)

close [table_my]-- закрываем курсор
deallocate [table_my] -- удаляем память, выделенную под курсор




--Регистр не учитывать.
--Если содержит - пишем на экране "это спам".
--Если нет - пишем "это не спам".

--declare @str nvarchar(50) = "buy ViAgRA now"
---- это спам!

--declare @str nvarchar(50) = "free xxxxx"
---- это спам!

--declare @str nvarchar(50) = "innocent rabbit"
---- это НЕ спам!

--Предусмотреть возможность добавления новых нежелательных слов (слова хранить в таблице).


--1


