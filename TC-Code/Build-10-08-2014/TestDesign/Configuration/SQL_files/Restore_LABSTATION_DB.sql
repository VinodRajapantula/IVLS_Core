-- =============================================
--Author     : Venu Sumanth Gorantla		
--Create date: Mar-21-2014
--Description:	Restoring Lab station DB
--Dependencies:
--===============================================
--Change focus to Master DB
Use master
Go

--Drop Existing LABSTATION_DB database and display message
Drop Database LABSTATION_DB
Go
Print 'Drop existing LABSTATION_DB database - LABSTATION_DB'
Print Char(10) 

--Restore LABSTATION_DB database(LABSTATION_DB) from backup file (placed in C:\TestData) to create IVLSDB.mdf and IVLS_DB_log.ldf
RESTORE DATABASE LABSTATION_DB
FROM DISK ='C:\Users\Administrator\Desktop\venu\Daily_Execution\TestDesign\Configuration\SQL_files\LABSTATION_DB_Backup.bak'
WITH Recovery,
MOVE 'LABSTATION_DB' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\LABSTATION_DB.mdf',
MOVE 'LABSTATION_DB_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\LABSTATION_DB_Log.ldf'
Go 
Print Char(10)
Print 'Successfully Restored LABSTATION_DB database from the backup file - LABSTATION_DB_Backup.bak'

--Change focust to LABSTATION_DB database - LABSTATION_DB
Use LABSTATION_DB
Go
