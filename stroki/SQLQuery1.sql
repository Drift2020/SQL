--1. ������ ������, � ����� ������. �������� �� ����� ������� � ���������� ����������.

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

--2. ���������� ���������� ���� �� �������� �����������.

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

--3. ����������, �������� �� ������ �����������. ������� �����������:
declare @str2 nvarchar(200) = '����� ����� �� ��������',@str3 nvarchar(200)
SET @str2 = REPLACE(@str2, ' ', '');

set @str2=LOWER(@str2)
set @str3 = reverse(@str2)
if(@str2=@str3)
print('���������')
else
print('nooo ���������')

--����� ����� �� ��������.
--� ��� �����, ����.
--Nurse, I spy gypsies run!

--4. ���������, ������� ��� �������� ����� ���������� � ������.

declare @str5 nvarchar(200), @symbvol5 nvarchar(200)
set @str5 = 'Nurrunse, I spy gypsies run'
set @symbvol5 = 'run'

  declare @i5 int =-1, @count5 int =0
  


  while  @i5 <> 0
  begin
   set @i5 = CHARINDEX(@symbvol5,@str5,@i5+1)
	if(@i5 <> 0 and (CHARINDEX(@symbvol5,@str5,@i5+len(@str5)) <> 0 or CHARINDEX(@symbvol5,@str5,@i5-1) <> 0))
	 begin

	  set @count5=@count5+1

	 end 
  end

  raiserror('count - %d', 0, 25,@count5)


--5. ���������, �������� �� �������� ������ ����� 'viagra' ��� 'XXX'.




--������� �� ���������.
--���� �������� - ����� �� ������ "��� ����".
--���� ��� - ����� "��� �� ����".

--declare @str nvarchar(50) = "buy ViAgRA now"
---- ��� ����!

--declare @str nvarchar(50) = "free xxxxx"
---- ��� ����!

--declare @str nvarchar(50) = "innocent rabbit"
---- ��� �� ����!

--������������� ����������� ���������� ����� ������������� ���� (����� ������� � �������).


--1


