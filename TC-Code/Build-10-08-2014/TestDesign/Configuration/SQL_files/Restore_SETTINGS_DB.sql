Restore_SETTINGS_DBRestore_SETTINGS_DB
-- =============================================
--Author     :Venu Sumanth Gorantla		
--Create date: March-21-2014
--Description:	restore databases for SETTINGS_DB
--Dependencies:N/A
--===============================================
--Change focus to Master DB

Use master
Go

--Drop Existing SETTINGS_DB database and display message
Drop Database SETTINGS_DB
Go
Print 'Drop existing SETTINGS_DB database - SETTINGS_DB'
Print Char(10) 

--Restore SETTINGS_DB database(SETTINGS_DB) from backup file (placed in C:\TestData) to create SETTINGSDB.mdf and SETTINGS_DB_log.ldf
RESTORE DATABASE SETTINGS_DB
FROM DISK ='C:\Users\Administrator\Desktop\venu\Daily_Execution\TestDesign\Configuration\SQL_files\SETTINGS_DB_Backup.bak'
WITH Recovery,
MOVE 'SETTINGS_DB' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\SETTINGS_DB.mdf',
MOVE 'SETTINGS_DB_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\SETTINGS_DB_Log.ldf'
Go 
Print Char(10)
Print 'Successfully Restored SETTINGS_DB database from the backup file - SETTINGS_DB_Backup.bak'

--Change focust to SETTINGS_DB database - SETTINGS_DB
Use SETTINGS_DB
Go
