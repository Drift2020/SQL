CREATE FUNCTION dbo.MyPow(@a int , @b int)  
RETURNS int  
AS  
begin

declare @c int, @i int = 0;

set @c = @a

while @i < @b-1
begin

set @c = @c * @a
set @i = @i + 1

end

return @c
end
go

print dbo.MyPow(dbo.MyPow(2,3), dbo.MyPow(1,2))