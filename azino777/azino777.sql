--����������� �� ����� Transact-SQL ������� ������� "��������� ������".

--� ������ ���� ���� ����� ��������� �������, ��������, 500 ��������.
--��� ������ ���� ���������� ������ F5.
--��������� ������ ������� - 10 ��������.
--��� ������� ��������� ��� ��������� ����� (�� 0 �� 7).
--���� ��� ��� ����� ���������, ��������� ���� (��������, 50 ��������).
--���� ��� - �� � ���� ������� �� ����������� (������ ������ 10 ��������).

--����� ��� ��������� ����� ���������� ������� ��������� �����.

--���� ����������� ����������, ���� ����������� ������
--(������ ������ ������, ��� ������� �� F5 ����� "��� �����, ��� �������")

--���� ����������� �������, ���� ������ 777.
--������ ��������� � ������ � ������� ��� ������.

--�������������� ���� (����� ������� �� ����� 50 ������� �� F5 �� ���������).

--��� �����, ��������, ������� �������� �������� ������ � ����� ������.

create database Azino777--�������
go
use Azino777
go
create table ballans(
ID int not null primary key IDENTITY(1,1),
[money] float
)
go


insert into ballans (money) values (500)
go 

declare [my_money] cursor scroll  for select ballans.money from ballans -- ��������� ������
open [my_money] -- ��������� ������, �������� ������, ��������� � �������
declare @balans int, @b1 int, @b2 int , @b3 int,@sum_win int = 50,@sum_lost int = 10
fetch next from [my_money] into @balans -- �������� ������ ������




set @b1 = ABS(Checksum(NewID()) % 7)
set @b2 = ABS(Checksum(NewID()) % 7)
set @b3 = ABS(Checksum(NewID()) % 7)

if(@balans>=10)
begin
if (@b1=@b2 and @b2=@b3)
begin 

raiserror('Your win, %d+%d', 0, 25,@balans, @sum_win)
set @balans  = @balans + @sum_win
raiserror('Your ballans = %d', 0, 25,@balans)

UPDATE ballans SET money = @balans WHERE ballans.id=1;

end
else 
begin

raiserror('Your lost, %d-%d', 0, 25,@balans, @sum_lost)
set @balans  = @balans - @sum_lost
raiserror('Your ballans = %d', 0, 25,@balans)

UPDATE ballans SET money = @balans WHERE ballans.id=1;

end
end
else
begin
print('LOOOOL, �� ��� ���������, ��������� ��� �������!1!!XD')
end
close [my_money] -- ��������� ������
deallocate [my_money] -- ������� ������, ���������� ��� ������ 

