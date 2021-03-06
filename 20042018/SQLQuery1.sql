


--1. �������� �������, ������� ������� ������ ���� ���������������� ��� ������ SQL Server,
--� �� ����� ������� � �.

CREATE FUNCTION dbo.tables()  
RETURNS TABLE  
AS  
RETURN  	
	(select sysdatabases.name , size*8 as size
	from sys.master_files inner join  master.dbo.sysdatabases  on database_id = dbid
	WHERE dbid > 4 and type_desc like 'ROWS' );
 
 
go

--2. �������� �������, ������� ������� ������ ���� ������ ���� ������,
--�������� ������� �������� ��� ��������, ���������� ������� � ������ �� ������,
--� ����� ������ ������ ������� � ������.


CREATE FUNCTION dbo.tables_select(@name nvarchar(max))  
RETURNS   @table TABLE (name nvarchar(200), schemaName nvarchar(200),row int,totalKB int)
AS  
  	
begin

insert @table


SELECT  t.NAME AS TableName, s.Name AS SchemaName, p.rows AS RowCounts , 
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

RETURN
end
 
go
select *
from  dbo.tables_select('LibrarySQL')  
go

drop FUNCTION dbo.tables_select

go


--3. �������� �������, ������� ������� ������ ���� ����� ����������� �������,
--��� ������� ��������� ��� ��������.
--���� ���� ��������� ���������� ������ (� ������ ��) - �������� ���������� �� ������ �������.
--����� �������� ���� ������� ��� ���, ��������� ������� ��������
--� �������� ���� ������������ (����� ������� � ����� ����).





--4. �������� �������, ������� ������� ���������� �������������� � ������� �������������.
CREATE FUNCTION dbo.users_conect()  
RETURNS TABLE  
AS  
RETURN  
(select count(DISTINCT  loginame) as [count]
from   sys.sysprocesses)
