create database hell--�������
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

--declare @pwdchars varchar(100),@pwdlen int,@counter int
--select 	
--			@pwdchars = '0123456789qwertyuiopasdfghjklzxcvbnm9876543210QWERTYUIOPASDFGHJKLZXCVBNM9876543210',
declare @max int = 3999, @i int=1,  @str nvarchar(9) = 'IVXLCDM ', @code nvarchar(100)='',@n1 int,@n2 int, @n3 int, @n4 int

print (1234%10)

while(@i<@max)
begin
set @n1=@i/1000
	if(@n1 != 0)
	begin 	
			if (@n1 =1)
			set @code=@code+substring(@str,7 ,1)
			if (@n1 =2)
			set @code=@code+substring(@str,7 ,1)+substring(@str,7 ,1)
			if (@n1 =3)
			set @code=@code+substring(@str,7 ,1)+substring(@str,7 ,1)+substring(@str,7 ,1)
	end
	

	set @n2=@i/100%10
		if(@n2!= 0)
	begin 	
			if(@n2=1)
			set @code=@code+substring(@str,5 ,1)
		else if(@n2=2)
			set @code=@code+(substring(@str, 5 ,1)+substring(@str, 5 ,1))
		else if(@n2=3)
			set @code=@code+substring(@str, 5 ,1)+substring(@str, 5 ,1)+substring(@str, 5 ,1)
		else if(@n2=4)
			set @code=@code+substring(@str, 5 ,1)+substring(@str, 6 ,1)
		else if(@n2=5)
			set @code=@code+substring(@str, 6 ,1)
		else if(@n2=6)
			set @code=@code+substring(@str,6 ,1)+substring(@str, 5 ,1)
		else if(@n2=7)
			set @code=@code+substring(@str, 6 ,1)+substring(@str, 5 ,1)+substring(@str, 5 ,1)
		else if(@n2=8)
			set @code=@code+substring(@str,6 ,1)+substring(@str, 5 ,1)+substring(@str, 5 ,1)+substring(@str, 5 ,1)
		else if(@n2=9)
			set @code=@code+substring(@str, 5 ,1)+substring(@str, 7 ,1)
	end
	

	set @n3=@i/10%10
		if(@n3!= 0)
	begin 	
			if(@n3=1)
			set @code=@code+substring(@str,3 ,1)
		else if(@n3=2)
			set @code=@code+(substring(@str, 3 ,1)+substring(@str, 3 ,1))
		else if(@n3=3)
			set @code=@code+substring(@str, 3 ,1)+substring(@str, 3 ,1)+substring(@str, 3 ,1)
		else if(@n3=4)
			set @code=@code+substring(@str, 3 ,1)+substring(@str, 4 ,1)
		else if(@n3=5)
			set @code=@code+substring(@str, 4 ,1)
		else if(@n3=6)
			set @code=@code+substring(@str,4 ,1)+substring(@str, 3 ,1)
		else if(@n3=7)
			set @code=@code+substring(@str, 4 ,1)+substring(@str, 3 ,1)+substring(@str, 3 ,1)
		else if(@n3=8)
			set @code=@code+substring(@str,4 ,1)+substring(@str, 3 ,1)+substring(@str, 3 ,1)+substring(@str, 5 ,1)
		else if(@n3=9)
			set @code=@code+substring(@str, 3 ,1)+substring(@str, 5 ,1)
	end

	set @n4=@i%10
    if(@n4!=0 )
	begin
		if(@n4=1)
			set @code=@code+substring(@str,1 ,1)
		else if(@n4=2)
			set @code=@code+(substring(@str, 1 ,1)+substring(@str, 1 ,1))
		else if(@n4=3)
			set @code=@code+substring(@str, 1 ,1)+substring(@str, 1 ,1)+substring(@str, 1 ,1)
		else if(@n4=4)
			set @code=@code+substring(@str, 1 ,1)+substring(@str, 2 ,1)
		else if(@n4=5)
			set @code=@code+substring(@str, 2 ,1)
		else if(@n4=6)
			set @code=@code+substring(@str,2 ,1)+substring(@str, 1 ,1)
		else if(@n4=7)
			set @code=@code+substring(@str, 2 ,1)+substring(@str, 1 ,1)+substring(@str, 1 ,1)
		else if(@n4=8)
			set @code=@code+substring(@str,2 ,1)+substring(@str, 1 ,1)+substring(@str, 1 ,1)+substring(@str, 1 ,1)
		else if(@n4=9)
			set @code=@code+substring(@str, 1 ,1)+substring(@str, 3 ,1)
				
	end
	
	

	raiserror('%s - %d%d%d%d', 0, 25, @code,@n1,@n2,@n3,@n4)

	set @code = ''
	set @i = @i+1
end


