Set objShell = CreateObject("Wscript.Shell")
   ForReading = 1
   ForWriting = 2
   ForAppending = 8
strPath = Wscript.ScriptFullName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set vbFileName = objFSO.GetFile(strPath)
strFolder = objFSO.GetParentFolderName(vbFileName)
strSqlFile=strFolder+"\SQL_files\Restore_LABSTATION_DB.sql"

Set objFile = objFSO.OpenTextFile(strSqlFile)

do while not objFile.AtEndOfStream 
    strTxtLine =  objFile.ReadLine()
    if (instr(strTxtLine,"FROM DISK =")>0) then
		strText=strText+"FROM DISK ='"+strFolder+"\SQL_files\LABSTATION_DB_Backup.bak'"& VBCrLf
	else
	strText=strText+strTxtLine & VBCrLf
	end if
loop
  objFile.Close
  set objFile=nothing
  set objFile = objFSO.OpenTextFile(strSqlFile, ForWriting)
  objFile.Write(strText)
  objFile.Close
set objFile=nothing



strSqlFile1=strFolder+"\SQL_files\Restore_SETTINGS_DB.sql"

Set objFile1= objFSO.OpenTextFile(strSqlFile1)

do while not objFile1.AtEndOfStream 
    strTxtLine1 =  objFile1.ReadLine()
    if (instr(strTxtLine1,"FROM DISK =")>0) then
		strText1=strText1+"FROM DISK ='"+strFolder+"\SQL_files\SETTINGS_DB_Backup.bak'"& VBCrLf
	else
	strText1=strText1+strTxtLine1 & VBCrLf
	end if
loop
  objFile1.Close
  set objFile1=nothing
  set objFile1 = objFSO.OpenTextFile(strSqlFile1, ForWriting)
  objFile1.Write(strText1)
  objFile1.Close
set objFile1=nothing


objShell.run strFolder&"\SQL_files\Restore_DB.bat"
set objShell=nothing