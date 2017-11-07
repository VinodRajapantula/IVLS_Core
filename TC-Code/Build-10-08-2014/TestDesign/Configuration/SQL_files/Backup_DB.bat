@echo off
REM variables creation and getting the paths
SET ABS_PATH=%~dp0 
SET REL_PATH=Backup_LABSTATION_DB.sql
echo %ABS_PATH%
echo %REL_PATH%

REM concatinating and getting path of SQL
SET COMBINED_PATH=%ABS_PATH%%REL_PATH%
set COMBINED_PATH=%COMBINED_PATH: =%


echo %COMBINED_PATH%
Sqlcmd.exe -S(local) -U swtltester -P automation! -i %COMBINED_PATH%


pause
Exit