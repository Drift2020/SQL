--реализовать на языке Transact-SQL игровой автомат "однорукий бандит".

--в начале игры есть некий стартовый капитал, например, 500 кредитов.
--для начала игры необходимо нажать F5.
--стоимость одного нажатия - 10 кредитов.
--при нажатии генерится три случайных числа (от 0 до 7).
--если все три числа одинаковы, назначить приз (например, 50 кредитов).
--если нет - то и приз никакой не назначается (просто теряем 10 кредитов).

--кроме трёх случайных чисел показывать текущее состояние счёта.

--игра завершается поражением, если закончились деньги
--(дальше нельзя играть, при нажатии на F5 пишет "нет денег, иди работай")

--игра завершается победой, если выпало 777.
--выдать сообщение о победе в селекте или принте.

--сбалансировать игру (можно сделать не менее 50 нажатий на F5 до проигрыша).

--для этого, возможно, придётся изменить значения ставки и сумму призов.

create database Azino777--пифагор
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

declare [my_money] cursor scroll  for select ballans.money from ballans -- объявляем курсор
open [my_money] -- открываем курсор, выполняя запрос, указанный в курсоре
declare @balans int, @b1 int, @b2 int , @b3 int,@sum_win int = 50,@sum_lost int = 10
fetch next from [my_money] into @balans -- забираем первую запись




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
print('LOOOOL, вы все просадили, неудачник иди работай!1!!XD')
end
close [my_money] -- закрываем курсор
deallocate [my_money] -- удаляем память, выделенную под курсор 

