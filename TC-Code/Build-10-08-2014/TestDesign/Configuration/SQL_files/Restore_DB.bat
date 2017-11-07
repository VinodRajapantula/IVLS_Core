@echo off

REM variables creation and getting the paths
SET ABS_PATH=%~dp0 
SET REL_PATH=Restore_LABSTATION_DB.sql
SET REL_PATH1=Restore_SETTINGS_DB.sql
echo %ABS_PATH%
echo %REL_PATH%

REM concatinating and getting path of SQL
SET COMBINED_PATH=%ABS_PATH%%REL_PATH%
SET COMBINED_PATH=%COMBINED_PATH: =%

SET COMBINED_PATH1=%ABS_PATH%%REL_PATH1%
SET COMBINED_PATH1=%COMBINED_PATH1: =%

SQLCMD.EXE -S lpc:(local) -U swtltester -P automation! -i %COMBINED_PATH%


SQLCMD.EXE -S lpc:(local) -U swtltester -P automation! -i %COMBINED_PATH1%



cd \
cd C:\
cd "C:\IDEXX\LabStation\bin\ManageIvlsDatabase"
ManageIvlsDatabase.exe -v -verify

pause

exit