--”далить все ограничени€/уточнени€ (констрейнты) со всех таблиц определЄнной Ѕƒ

use Teachers;

declare @constraints_table table(con nvarchar(200), tab nvarchar(200), typ nvarchar(200))

CREATE TABLE #constraints_table
(con  nvarchar(200),
 tab nvarchar(200),
 typ nvarchar(200))


-----------------------------------------------------------------
insert #constraints_table
select * 
from (	
		SELECT OBJECT_NAME(OBJECT_ID) AS NameofConstraint, OBJECT_NAME(parent_object_id) AS TableName, type_desc AS ConstraintType
		FROM sys.objects
		WHERE type_desc LIKE '%CONSTRAINT'
		) as allconstraints


select *
from #constraints_table



--------------------------------------------------------------

declare table_con cursor scroll  for select #constraints_table.con,#constraints_table.tab,#constraints_table.typ from #constraints_table -- объ€вл€ем курсор
open table_con -- открываем курсор, выполн€€ запрос, указанный в курсоре
declare @con nvarchar(200),  @tab nvarchar(200), @typ nvarchar(200)

fetch next from table_con into @con,@tab,@typ -- забираем первую запись





-----------------------------------------------------------------
declare @statement nvarchar(200)
while @@FETCH_STATUS = 0 
begin

	if(@typ like '%CHECK%' or @typ like '%UNIQUE%' )
	begin
		set @statement = 'alter table dbo.' +@tab+' DROP CONSTRAINT '+@con
		exec sp_executesql @statement
	end

fetch next from table_con into @con,@tab,@typ
end
--------------------------------------------------------------------------------
fetch first from table_con into @con,@tab,@typ
---------------------------------------------------------------------------------
while @@FETCH_STATUS = 0 
begin

	if(@typ like '%FOREIGN%' )
	begin
		set @statement = 'alter table dbo.' +@tab+' DROP CONSTRAINT '+@con
		exec sp_executesql @statement
	end

fetch next from table_con into @con,@tab,@typ
end
--------------------------------------------------------------------------------
fetch first from table_con into @con,@tab,@typ
---------------------------------------------------------------------------------
while @@FETCH_STATUS = 0 
begin

	if(@typ like '%PRIMARY%' )
	begin
		set @statement = 'alter table dbo.' +@tab+' DROP CONSTRAINT '+@con
		exec sp_executesql @statement
	end

fetch next from table_con into @con,@tab,@typ
end


close table_con -- закрываем курсор
deallocate table_con

DROP table #constraints_table


