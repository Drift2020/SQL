EXEC sp_addumpdevice 'disk', 'mydiskdump2', 'D:\buje_jy\dump2.bak'

go

BACKUP DATABASE LibrarySQL TO mydiskdump2

go

alter database LibrarySQL set single_user with rollback immediate
go

DROP DATABASE LibrarySQL

go

RESTORE DATABASE LibrarySQL FROM mydiskdump2

go
