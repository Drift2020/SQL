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



--3. Определить, является ли строка палиндромом. Примеры палиндромов:

--Нажал кабан на баклажан.
--Я так нежен, Катя.
--Nurse, I spy gypsies run!

--4. Посчитать, сколько раз заданное слово содержится в строке.

--5. Проверить, содержит ли заданная строка слова 'viagra' или 'XXX'.
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


