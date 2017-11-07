-- =============================================
--Author     :Venu Sumanth Gorantla		
--Create date: March-21-2014
--Description:	Creates a back up for both LABSTATION_DB and SETTINGS_DB
--Dependencies:N/A
--===============================================
IF Not Exists(Select name from sys.databases where name = 'LABSTATION_DB')
	Begin
		-- Display Error message
		Print 'IVLS database doesnot exist. Hence cannot take backup'
	End
Else 
	Begin
		-- Backup Database IVLS_DB to 'C:\Users\Administrator\Desktop\venu\IVLS4.0_Framework\TestDesign\Configuration\SQL_files\IVLS_DB_backup_Automate.bak'
		Use LABSTATION_DB
		Backup database LABSTATION_DB
		To Disk = 'C:\Users\Administrator\Desktop\venu\IVLS4.0_Framework\TestDesign\Configuration\SQL_files\IVLS_DB_backup_Automate.bak'
		With 
		Description = 'Full database backup of IVLS database',
		INIT
	End
	Go
	-- Display success message
	Print Char(10) 
	Print 'Successfully created backup file - "IVLS_DB_backup_Automate" at "C:\Users\Administrator\Desktop\venu\IVLS4.0_Framework\TestDesign\Configuration\SQL_files"'
Go



IF Not Exists(Select name from sys.databases where name = 'SETTINGS_DB')
	Begin
		-- Display Error message
		Print 'SETTINGS database doesnot exist. Hence cannot take backup'
	End
Else 
	Begin
		-- Backup Database SETTINGS_DB to 'C:\Users\Administrator\Desktop\venu\IVLS4.0_Framework\TestDesign\Configuration\SQL_files\SETTINGS_DB_backup_Automate.bak'
		Use SETTINGS_DB
		Backup database SETTINGS_DB
		To Disk = 'C:\Users\Administrator\Desktop\venu\IVLS4.0_Framework\TestDesign\Configuration\SQL_files\SETTINGS_DB_backup_Automate.bak'
		With 
		Description = 'Full database backup of SETTINGS database',
		INIT
	End
	Go
	-- Display success message
	Print Char(10) 
	Print 'Successfully created backup file - "SETTINGS_DB_backup_Automate" at "C:\Users\Administrator\Desktop\venu\IVLS4.0_Framework\TestDesign\Configuration\SQL_files"'
Go