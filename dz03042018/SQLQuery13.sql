create database hell--пифагор
go
use hell
go
create table pihogor(
n0 int,
n1 int,
n2 int,
n3 int,
n4 int,
n5 int,
n6 int,
n7 int,
n8 int,
n9 int,
n10 int,
)
go

declare @x int = 1, @m int


insert into pihogor (n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10) values (null,1,2,3,4,5,6,7,8,9,10)

	while(@x<11)
	begin

	

	insert into pihogor (n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10) values (@x, @x*1,@x*2,@x*3,@x*4,@x*5,@x*6,@x*7,@x*8,@x*9,@x*10)
	set @x = @x+1
	end

select *
from pihogor

------------------------------------------------M M X V I I I


declare @max int = 3999, @i int=1




while(@i<@max)
begin

if(@i%10 != 0)
begin

end

set @i = @i+1
end


