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



--3. ����������, �������� �� ������ �����������. ������� �����������:

--����� ����� �� ��������.
--� ��� �����, ����.
--Nurse, I spy gypsies run!

--4. ���������, ������� ��� �������� ����� ���������� � ������.

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


