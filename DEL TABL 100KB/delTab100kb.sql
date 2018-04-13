--Показать список всех таблиц определённой базы данных,
--количество записей в каждой из таблиц,
--и общий размер каждой таблицы в байтах.

--Удалить все таблицы:
-- размер которых меньше 100КБ
-- либо в которых нет записей
----------------------------------------



declare  @table table(name nvarchar(200), schemaName nvarchar(200),row int,totalKB int);

insert @table
SELECT  t.NAME AS TableName, s.Name AS SchemaName, p.rows AS RowCounts, 
SUM(a.total_pages) * 8 AS TotalSpaceKB
FROM sys.tables t INNER JOIN      
     sys.indexes i ON t.OBJECT_ID = i.object_id INNER JOIN 
     sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id INNER JOIN 
     sys.allocation_units a ON p.partition_id = a.container_id LEFT OUTER JOIN 
     sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.NAME NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.OBJECT_ID > 255 
GROUP BY t.Name, s.Name, p.Rows
ORDER BY t.Name






declare [table_my] cursor for select name,row,totalKB from  @table   -- объявляем курсор
open [table_my] -- открываем курсор, выполняя запрос, указанный в курсоре


declare @name nvarchar(200),@row int,@totalKB int
fetch next from [table_my] into @name,@row,@totalKB
declare @statement nvarchar(200)

while @@FETCH_STATUS = 0 
begin

	if @totalKB<100
		begin
			raiserror('%s-%d-%d-DELETE', 0, 25, @name,@row,@totalKB)

			--set @statement = 'DROP TABLE ' +@name
			--exec sp_executesql @statement

		end
	else
		begin 
			raiserror('%s-%d-%d', 0, 25, @name,@row,@totalKB)
		end
	fetch next from [table_my] into @name,@row,@totalKB
end

close [table_my]-- закрываем курсор
deallocate [table_my] -- удаляем память, выделенную под курсор

--https://msdn.microsoft.com/ru-ru/library/ms188776(v=sql.120).aspx












--declare  @STR1 nvarchar(max);
--declare gc cursor for select name from  sys.master_files   -- объявляем курсор
--open gc -- открываем курсор, выполняя запрос, указанный в курсоре

--declare @gname nvarchar(50)
 
---- SELECT name, size*1.0/128 AS[Size in MBs]  
----FROM sys.master_files 

--declare @si int
--declare sizes cursor for select size from sys.master_files 
--open sizes
--fetch next from sizes into @si


--while @@FETCH_STATUS = 0 
--begin


--raiserror('%d-%s', 0, 25, @si,@gname)

--if ( @si*1.0/128 < 1 and @gname!='master')
--begin

--	print @gname -- выводим значение временной переменной
	
--	-- забираем следующую запись
--	--set @STR1= 'Drop database '+@gname
--	--exec sp_sqlexec @gname

--end
--fetch next from sizes into @si
--fetch next from gc into @gname	

--end

--close gc 
--close sizes-- закрываем курсор
--deallocate gc -- удаляем память, выделенную под курсор
--deallocate sizes

