
declare @numner int =0, @status int=3, @STR1 nvarchar(max);
declare gc cursor for select name from  sys.master_files   -- объявляем курсор
open gc -- открываем курсор, выполняя запрос, указанный в курсоре

declare @gname nvarchar(50) -- создаем временную переменную для хранения результатов
 -- забираем первую запись

 
-- SELECT name, size*1.0/128 AS[Size in MBs]  
--FROM sys.master_files 

declare @si int
declare sizes cursor for select size from sys.master_files 
open sizes
fetch next from sizes into @si


while @@FETCH_STATUS = 0 
begin

if((@numner%4=0and @gname!='master' and @status=1 )
 or (@gname!='master' and @status=2 and (CHARINDEX('a', @gname)!= 0 or CHARINDEX('A', @gname)!=0 )) 
or ( @si*1.0/128 < 1 and @gname!='master' and @status=3))
begin

	print @gname -- выводим значение временной переменной
	
	-- забираем следующую запись
	--set @STR1= 'Drop database '+@gname
	--exec sp_sqlexec @gname

end
fetch next from sizes into @si
fetch next from gc into @gname	
set @numner= @numner+1
end

close gc 
close sizes-- закрываем курсор
deallocate gc -- удаляем память, выделенную под курсор
deallocate sizes

