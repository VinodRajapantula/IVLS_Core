//USEUNIT GlobalVariables




// ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  = 
//  Library Name          : GenericFunctions
//  Purpose                 : Used for Utility functions to be used across the scripts
//  Pre-Condition         :
//  Created By            : Venu Gorantla
//  Date                   : 26/09/2013
//  Reviewed By           :
//  Reviewed On               : 
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//     Modified By       Date                      Purpose                                                                                Reviewed By       Reviewed On                   
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





//##############################################################################################################
//  Function Name      : getUniqueTime()
//  Purpose                   :This function  is used to generate the Unique time and return the value
//  Pre-Condition         : N/A
//  Created By             : Venu Gorantla
//  Date                       :  Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getUniqueTime() {
        var n2 = new Date().getTime();
        return n2;
}

//##############################################################################################################
//  Function Name      : createLogFile()
//  Purpose                   :This function  is used to create a test file 
//  Pre-Condition       :N/A
//  Created By             : Venu Gorantla
//  Date                       :  Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function createLogFile() {
      var network  =  new ActiveXObject('WScript.Network');
      // Show a pop up if it works
        var  strcompName = network.computerName
        var fso,  file;
        var strResultfileName = "resultFile"+getUniqueTime();
        fso  =  new ActiveXObject("Scripting.FileSystemObject");
        strResultFilePath = strTestResultfilepath+"\\"+strcompName+"_"+strResultfileName+".txt";
        file  =  fso.CreateTextFile(strResultFilePath);
        file.Close();
}

//##############################################################################################################
//  Function Name        : logDescription()
//    Purpose                   :This function  is used to write a result file with appropriate execution details 
//    Pre-Condition         : N/A
//    Created By             : Venu Gorantla
//    Date                       :  Sep-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function logDescription(strTestStepDescription,strExpectedResult,strActualResult,strStatus) {
    var forReading,forWriting,forAppending,tristateFalse;
    forReading  =  1;
    forWriting  =  2;
    forAppending  =  8;
    tristateFalse  =  0;
    // Creates a new file object
    fs  =  new ActiveXObject("Scripting.FileSystemObject")
    strResultFile = strResultFilePath
  
    f  =  fs.OpenTextFile(strResultFile, forAppending, tristateFalse);
    // Writes string to file
    f.WriteLine(strTestStepDescription+","+strExpectedResult+","+strActualResult+","+strStatus);
    // Closes the file
    f.Close();
}

//##############################################################################################################
//  Function Name        : writeExecutionDetails()
//    Purpose                   :This function  is used to write a result file with appropriate execution details 
//    Pre-Condition      :N/A
//    Created By        : Venu Gorantla
//    Date               : Sep-26-2013 
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function writeExecutionDetails(strTestCaseDescription) {
    // variables declaration and assiging the values
    var forReading,forWriting,forAppending,tristateFalse;
    forReading  =  1;
    forWriting  =  2;
    forAppending  =  8;
    tristateFalse  =  0;
    // Creates a new file system object
    fs  =  new ActiveXObject("Scripting.FileSystemObject")
    strResultFile = strResultFilePath
  
    f  =  fs.OpenTextFile(strResultFile, forAppending, tristateFalse);
    // Writes string to file
    f.WriteLine(strTestCaseDescription);
    // Closes the file
    f.Close();
}

//##############################################################################################################
//  Function Name        : logResult()
//    Purpose                   :This function  is used to write a log file about the execution
//    Pre-Condition         : N/A
//    Created By        : Venu Gorantla
//    Date               : Sep-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################
function logResult(strStatus, strTestDescription, intLogtype) {
 try {
    var forReading, forWriting, forAppending, tristateFalse, fs, f;
    forReading  =  1;
    forWriting  =  2;
    forAppending  =  8;
    tristateFalse  =  0;
    if (intLogtype == 0) strLogtype = ""
    else if (intLogtype == 1) strLogtype = "\t"
    // Creates a new file object
    fs  =  new ActiveXObject("Scripting.FileSystemObject")
    strResultFile = strResultFilePath
  
    f  =  fs.OpenTextFile(strResultFile,  forAppending,  tristateFalse);
    // Writes string to file
   f.WriteLine(timeStamp()+":"+strLogtype+strStatus+"-:"+strTestDescription);
    f.Close();
   } catch(emsg) {
  }   

}

 //##############################################################################################################
//  Function Name        : timeStamp
//    Purpose                   :This function  is used to give current timeStamp
//    Pre-Condition         : N/A
//    Created By        : Venu Gorantla
//    Date                       :  Sep-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function timeStamp() {
    var DtTimeStamp, strTimeStamp;
    DtTimeStamp =  Date();
    strTimeStamp = DtTimeStamp.toString();    
    return strTimeStamp
}

function TimeStampHHMMSS()
{
  time1 = new Date();
  timeStamp1=time1.getHours() + ":" + time1.getMinutes()+":"+time1.getSeconds();
  Delay(52050)
  time2 =  new Date();
  timeStamp2=time2.getHours() + ":" + time2.getMinutes()+":"+time2.getSeconds()  
  var diff234=timeDiffrence(timeStamp1,timeStamp2)
  Log.Message(diff234);
}

function timeDiffrence(start, end) {
    start = start.split(":");
    end = end.split(":");
    var startDate = new Date(0, 0, 0, start[0], start[1], 0);
    var endDate = new Date(0, 0, 0, end[0], end[1], 0);
    var diff = endDate.getTime() - startDate.getTime();
    var hours = Math.floor(diff / 1000 / 60 / 60);
    diff -= hours * 1000 * 60 * 60;
    var minutes = Math.floor(diff / 1000 / 60);
    diff -= minutes * 1000 * 60;
   var secounds = Math.floor(diff / 1000);
   
    return (hours <= 9 ? "0" : "") + hours + ":" + (minutes <= 9 ? "0" : "") + minutes+":" +(secounds <= 9 ? "0" : "") + secounds;
}

 //##############################################################################################################
//  Function Name            : fnCreateXMLObject()
//    Purpose                : Create XML dom object
//    Pre-Condition          : N/A
//    Created By            : RK
//    Date                  : Sep-30-2013
//    Reviewed By           :   
//    Reviewed On             : 
// ###############################################################################################################

function fnCreateXMLObject(xmlDoc) {
    // Creates an XML object
    var xmlDoc  =  null;
    try {
    xmlDoc = new ActiveXObject("Microsoft.XMLDOM");    
    return xmlDoc;
    }catch (e){
    Log.Message(e.message);
    return"";
  }
}



//##############################################################################################################
//  Function Name      : getExcelRowcount()
//  Purpose                   : This function  is used to return the number of rows used in the execle sheet
//  Pre-Condition        : Excel sheet should exist in the path
//  Created By            : Venu Gorantla
//  Date                        : Sep-25-2013
//  Reviewed By        :    
//  Reviewed On         : 
// ###############################################################################################################

function  getExcelRowcount(strExcelPath, strsheetName){
try{
      var excelSheet = DDT.ExcelDriver(strExcelPath, strsheetName);
      var rCnt = 0;
            while (! excelSheet.EOF()){
            rCnt = rCnt+1;
            excelSheet.Next();
            }
           return  rCnt;
}

catch(eMsg){
      Log.Message( "excel sheet is not accessible in the path :"+strExcelPath);
}
finally{
   DDT.CloseDriver(excelSheet.Name);
   excelSheet = null;
    rCnt = null;
    
}
}
 
//##############################################################################################################
//  Function Name      : scriptStartLog()
//  Purpose                   : This function  is used to write the log file before each scenario  execution
//  Pre-Condition        : strScriptName and strScenarioDesc variables should exist
//  Created By            : Venu Gorantla
//  Date                        : Oct-15-2013
//  Reviewed By        :    
//  Reviewed On         : 
// ###############################################################################################################

function scriptStartLog(strScriptName, strScenarioDesc){
try {
       Log.Message(strScriptName);
       Log.Message(strScenarioDesc);
       writeExecutionDetails("Started Executing script: "+strScriptName+"--Description--"+strScenarioDesc);
       writeExecutionDetails("TimeStamp:Execution Status:Step Description");
       writeExecutionDetails("--------------------------------------------");   
      }
    catch (eMsg4){
    Log.Error(" Error While executing the function scriptStartLog with Desc :"+eMsg4.description) ; 
    }       
  }

//##############################################################################################################
//  Function Name      : getArrayTestData()
//  Purpose                   :This function  retrieves all the data and removes angular braces and keep it in another array
//  Pre-Condition      :N/A
//  Created By             : Venu Gorantla
//  Date                       :  Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getArrayTestData(strInputParm) {
    var strParamValue;
    var strOutParm  =  new Array();
    var strParamArray = strInputParm.split("|");
              
   //Iterating all the data                                                   
    for(i = 0;i<strParamArray.length;i++){
        strParamValue = strParamArray[i].split("<")[1].split(">")[0];
        //retrieving data and assigining it to another variable
        strOutParm[i]  =  strParamValue; //.trim();                   
        }   
              
    return strOutParm;                                                                   
}

//##############################################################################################################
//  Function Name      : getArrayConcatinate()
//  Purpose                   :This function Concatinate the array values into string
//  Pre-Condition         : N/A
//  Created By             : Venu Gorantla
//  Date                       :  Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getArrayConcatinate(Arrayobj) {
  var strString = ""; 
  for(i = 0;i<Arrayobj.length;i++){
   strString = strString+Arrayobj[i]+","
  }
  subString = strString.substring(0,strString.length-1);
  return subString;
}

//##############################################################################################################
//  Function Name        : getExcelColumnIndex()
//    Purpose                   :This function  return the value of columName and if  value not exist for columName return -1
//    Pre-Condition     : N/A
//    Created By             : Venu Gorantla
//    Date                       :  Sep-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function getExcelColumnIndex(excelPath, sheetName, columName) {
try{
  // Specifies two new Excel drivers
   driver  =  DDT.ExcelDriver(excelPath, sheetName);
    var colNum  =  driver.ColumnCount;
  // Iterates through the columns
  for (var i  =  0; i < colNum; i++){
    var colName  =  driver.ColumnName(i);
      if (colName == columName)
       {
          // returning the index of the colum
          return i;
       }
       else if(i == colNum-1)
       {
          return -1;
       } 
  }
  }
  catch(eMsg1){
  // writting result file  and test complete logs
  Log.Warning(" DDt driver creation problem in  getExcelColumnIndex  function for the path :"+excelPath);
  logResult (" DDt driver creation problem in  getExcelColumnIndex  function for the path :"+excelPath);
  }
  
  finally
  {
  // variable deallocation
  DDT.CloseDriver(driver.Name);
  colNum = null;
  }  
}

//##############################################################################################################
//  Function Name        : getMachineName()
//    Purpose             : This function  return the value of columName and if  value not exist for columName return -1
//    Pre-Condition     :N/A
//    Created By             : Venu Gorantla
//    Date                       :  Oct-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################


function getMachineName() {
try {
  var network  =  new ActiveXObject('WScript.Network');
  // Show a pop up if it works
  var  strcompName = network.computerName
  network=null;
  return strcompName;
  }
  catch(e){
  Log.Message("Error in getMachineName function Desc : "+e.description);
  
  }
}


//##############################################################################################################
//  Function Name        : getOSName()
//    Purpose                   : This function  returns OS name 
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function getOSName() {
try {
    var  osName;
    osName=(Sys["OSInfo"]["Name"] + " " +Sys["OSInfo"]["ServicePackVersion"]);
    return osName;
} catch (e){
      Log.Message("Failed in Function getOSName with desc :"+e.description);
   }
 }
 


//##############################################################################################################
//  Function Name        : getScreenshot()
//    Purpose                   : This function  is used to take a snap shot
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       :Oct-24-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function getScreenshot( strFileName) {
try{
var  picObj;
picObj=Sys.Desktop;
picObj.Picture().SaveToFile(strSnapFolder+"\\"+strFileName+".jpg");
} catch(e) {
    Log.Message(e.description);
  }
  picObj=null;
  return (strSnapFolder+"\\"+strFileName+".jpg");
}


//##############################################################################################################
//  Function Name        : createScreenshotFolder()
//    Purpose                   : This function  is used to create a folder for store screen  shots
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-24-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function createScreenshotFolder() {
   strSnapFolder=strSnapsParentfolder+"\\"+strModuleName+"_"+strResultfileName;
try{
var fso= new ActiveXObject("Scripting.FileSystemObject");
  if (fso.FolderExists(strSnapFolder)) {
      Log.Message("folder already exist");
    }
  else  {
   var  a = fso.CreateFolder(strSnapFolder);
   }
} catch(e) {
  Log.Message(" craetion of  a new folder is failed with desc : "+e.description);
}

}



//##############################################################################################################
//  Function Name        : getTimeXmlFormat()
//    Purpose                   : This function  returns date and time to store in XML
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-24-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function getTimeXmlFormat() {
 try { 
     var dt = new Date(); 
     var strmonth =dt.getMonth()+1
    
   var strDate=dt.getFullYear().toString()+"-"+getIntToString(strmonth)+"-"+getIntToString(dt.getDate());
    var time=getIntToString(dt.getHours())+":"+getIntToString(dt.getMinutes())+":"+getIntToString(dt.getSeconds());
   
   var Dateandtime=strDate+" "+time 
   return Dateandtime; 
 }  catch (e) { 
   Log.message (e.description); 
 }

}

 
 //##############################################################################################################
//  Function Name        : getComputerName()
//    Purpose                   : This function  returns OS name 
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function getComputerName() {
try {
     var network  =  new ActiveXObject('WScript.Network');
  // Show a pop up if it works
    var  strcompName = network.computerName
    var network  =null;
     return strcompName;
} catch (e){
      Log.Message("Failed in Function getComputerName with desc :"+e.description);
   }
 }
 
 
 

//##############################################################################################################
//  Function Name        : timeDiffXmlForm()
//    Purpose                   : This function retuns Execution time defference in hour minutes and seconds format
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

 
 function timeDiffXmlForm(endTime, startTime) {
    // getting difference of years months date and time   
   diffYear=parseInt(endTime.split(" ")[0].split("-")[0])-parseInt(startTime.split(" ")[0].split("-")[0]);
   diffMonth=parseInt(endTime.split(" ")[0].split("-")[1])-parseInt(startTime.split(" ")[0].split("-")[1]);
   diffDate=parseInt(endTime.split(" ")[0].split("-")[2])-parseInt(startTime.split(" ")[0].split("-")[2]);
   diffHour=parseInt(endTime.split(" ")[1].split(":")[0])-parseInt(startTime.split(" ")[1].split(":")[0]);
   diffMinute=parseInt(endTime.split(" ")[1].split(":")[1])-parseInt(startTime.split(" ")[1].split(":")[1]);
   diffSecond=parseInt(endTime.split(" ")[1].split(":")[2])-parseInt(startTime.split(" ")[1].split(":")[2]);
   diffMillSecond=null;
   //verifying milli seconds exist 
   if  ((startTime.split(" ")[1].split(":").length==4 ) && (endTime.split(" ")[1].split(":").length==4 )){
     diffMillSecond=parseInt(endTime.split(" ")[1].split(":")[3])-parseInt(startTime.split(" ")[1].split(":")[3]);
    }
   intYear=parseInt(startTime.split(" ")[0].split("-")[0]);
   intMonth=parseInt(startTime.split(" ")[0].split("-")[1]);
   //this function validates the time and return in XML form
  return diffTimeValidation(diffYear, diffMonth, diffDate, diffHour, diffMinute, diffSecond, diffMillSecond,intYear,intMonth);
 
}


//##############################################################################################################
//  Function Name        : diffTimeValidation()
//    Purpose                   : This function  validates the time and return xml format
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function diffTimeValidation(diffYear, diffMonth, diffDate, diffHour, diffMinute, diffSecond, diffMillSecond,intYear,intMonth){
if (diffMillSecond==null){
  diffMillSecond="";
  }
  //milliseconds validation and make sure that they are non negative numbers
    if (diffMillSecond<0) {
         diffMillSecond=diffMillSecond+1000;
        diffSecond=diffSecond-1
    }
  //seconds validation and make sure that they are non negative numbers
    if (diffSecond<0) {
       diffSecond=diffSecond+60;
       diffMinute=diffMinute-1
         }
   //Minutes validation and make sure that they are non negative numbers    
    if (diffMinute<0){
       diffMinute=diffMinute+60;
        diffHour=diffHour-1
     }
    //hours validation and make sure that they are non negative numbers      
   if (diffHour<0){
       diffHour=diffHour+24;
       diffDate=diffDate-1
     }
         //days validation and make sure that they are non negative numbers          
    if  (diffDate<0){
         diffDate=diffDate+numberOfDays(intYear,intMonth);
         diffMonth=diffMonth-1
    }
     //months validation and make sure that they are non negative numbers          
    if  (diffMonth<0){
      diffMonth=diffMonth+12
   }
 // converting milli seconds to string                 
   diffMillSecond=diffMillSecond.toString();
   if(diffMillSecond.length==1) {
       diffMillSecond=":00"+diffMillSecond;
       } else if(diffMillSecond.length==2){
         diffMillSecond=":0"+diffMillSecond;
       }
       else {
       diffMillSecond=":"+diffMillSecond;
       }
         
 return   getIntToString(diffHour)+":"+getIntToString(diffMinute)+":"+getIntToString(diffSecond)+diffMillSecond;  
}




//##############################################################################################################
//  Function Name        : getIntToString()
//    Purpose                   : This function  converting number to string if number is only one digit it adds 0
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################


function getIntToString(intNum) {
  intNum=intNum.toString();
   if(intNum.length==1) {
       intNum="0"+intNum;
       } 
  return intNum;
}

 //##############################################################################################################
//  Function Name        : numberOfDays()
//    Purpose                   : This function  returns number of days for the month
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-25-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function numberOfDays(year, month) {
    var d = new Date(year, month, 0);
    return d.getDate();
}

//##############################################################################################################
//  Function Name        : getFullTimeString()
//    Purpose                   : This function  returns date and time  and milli seconds 
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Oct-24-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function getFullTimeString() {
 try { 
     var dt = new Date(); 

   // retrieving all time details and assigning the values       
   var strDate=dt.getFullYear().toString()+"-"+getIntToString(dt.getMonth()+1)+"-"+getIntToString(dt.getDate());
   var time=getIntToString(dt.getHours())+":"+getIntToString(dt.getMinutes())+":"+getIntToString(dt.getSeconds())+":"+getIntToString(dt.getMilliseconds());
   var Dateandtime=strDate+" "+time 
   dt=null;
   strDate=null;
   time=null;
   return Dateandtime;
   
 }  catch (e) { 
   Log.message (e.description); 
 }

}


//##############################################################################################################
//  Function Name        : appLogResult()
//    Purpose                   : This function  writes the log files for both html report and execution log
//    Pre-Condition        : N/A
//    Created By             : Venu Gorantla
//    Date                       : Nov-11-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################


function appLogResult(stepStatus, oLogicalName, actionDescription, actionType) {

   //  verify Records button
    if (stepStatus ==  true) {
       Log.Message("Pass: "+oLogicalName);
       logResult("Pass-", actionDescription, 1);
       addTestStepnodeandattributes(dom, childNodeSteps, actionType, actionDescription, strActionName, "", "", oLogicalName, "Pass");
    }
    else  if (stepStatus ==  false) {
      Log.Message("Fail: "+actionDescription);
        logResult("Fail-",  actionDescription,  1);
       addTestStepnodeandattributes(dom, childNodeSteps, actionType, actionDescription, strActionName, "", getScreenshot(oLogicalName), oLogicalName, "Fail");
    }
    else {
        Log.Message("Fail: "+actionDescription);
         logResult("Fail-",  stepStatus,  1);
        addTestStepnodeandattributes(dom, childNodeSteps, actionType, actionDescription+": "+stepStatus, strActionName, "", getScreenshot(oLogicalName), oLogicalName, "Fail");
    }
}


//##############################################################################################################
//  Function Name        : textCompare(string1,string2)
//    Purpose                   :This function returns true if string2 exist in string1
//    Pre-Condition      :N/A
//    Created By        : Venu Gorantla
//    Date               : Nov-18-2013
//    Reviewed By         :   
//    Reviewed On         : 
// ###############################################################################################################

function textCompare(string1, string2) {
      var compVal;
      var  status;
    //converting strings to lower case
    string1=string1.toString().toLowerCase();
    string2=string2.toString().toLowerCase();
    // Creates a new file system object
     compVal=string1.indexOf(string2);
     if (compVal>=0) {
     status= true;
    } else {
    status= false;
    }
 return status;
}

//##############################################################################################################
//  Function Name      : getUniqueNum()
//  Purpose                   :This function  is used to generate the Unique time and return the value
//  Pre-Condition         : N/A
//  Created By             : Venu Gorantla
//  Date                       :  Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getUniqueNum() {
 try { 
     var dt = new Date(); 

   // retrieving all time details and assigning the values       
   
   var time=getIntToString(dt.getHours())+getIntToString(dt.getMinutes())+getIntToString(dt.getSeconds());
   dt=null;
   strDate=null;
  return time;
   
 }  catch (emsgs) { 
   Log.message (emsgs.description); 
}
}

//##############################################################################################################
//  Function Name            : replaceStringBasedOnAsci()
//    Purpose                :This function  is used to replace a specifi ASCII char in astring to another ASCII char
//    Pre-Condition          : N/A
//    Created By            : Venu Gorantla
//    Date                  :  Mar-14-2013
//    Reviewed By           :   
//    Reviewed On            : 
// ###############################################################################################################


function replaceStringBasedOnAsci(str,asciiCodeSearch,asciiCodeReplace)
{
 var str1="";
      for (i=0; i<str.length; i++)
      {
       var res = str.substr(i,1)
       if (res.charCodeAt(0) == asciiCodeSearch){
         res=String.fromCharCode(asciiCodeReplace)
       }
       str1=str1+res
      }
      return str1;
}



//##############################################################################################################
//  Function Name            : copyFileToFolder()
//    Purpose                :This function  is used to copy a file from source folder to destination folder
//    Pre-Condition          : N/A
//    Created By            : Venu Gorantla
//    Date                  :  Mar-14-2014
//    Reviewed By           :   
//    Reviewed On            : 
// ###############################################################################################################

function  copyFileToFolder (SourceFile, DestFolder)
{
try {
   var fs;
   fs  =  new ActiveXObject("Scripting.FileSystemObject")
   // copy file form source folder to destination folder 
   fs.Copyfile(SourceFile, DestFolder)
   fs=null;
   
  } catch(emsg) {
    Log.Message("INCOMPLETE-copyFileToFolder method is not executed successfully with error description "+emsg.description);
}      
   
}


//##############################################################################################################
//  Function Name            : replaceBlackSlashInPath()
//    Purpose                :This function  is used to replace double black slash with single
//    Pre-Condition          : N/A
//    Created By            : Venu Gorantla
//    Date                  :  Mar-21-2014
//    Reviewed By           :   
//    Reviewed On            : 
// ###############################################################################################################


function replaceBlackSlashInPath(string) {

var res=string.split("\\\\")
length=res.length;
result=""
for (var j=0; j<length; j++) {
result=result+res[j]+"\\"
}
return result.slice(0, -1);
}



//##############################################################################################################
//  Function Name      : monthDiff()
//  Purpose            : This function returns month differences between to dates. 
//                      It gives -ve number if required date is less than display date
//  Pre-Condition     : N/A
//  Created By        : Venu Gorantla
// Function call      : monthDiff ("March 2013", "April 2014")
//  Date              : April-11-2014
//  Reviewed By       :   
//  Reviewed On        : 
// ###############################################################################################################


function monthDiff(requiredDate, displayDate) {
    var months,requiredYear,displayYear,requiredMonth,displayMonth;
    requiredYear=parseInt(requiredDate.split(" ")[1]);
    displayYear= parseInt(displayDate.split(" ")[1]);
    
    requiredMonth = requiredDate.split(" ")[0]
    displayMonth =  displayDate.split(" ")[0]
    // multiplying the year difference with 12
    months = (displayYear - requiredYear) * 12;
    // identifying the month difference
    if (returnMonthNumber(requiredMonth)> returnMonthNumber(displayMonth) ) {
       months = months -(returnMonthNumber(requiredMonth)-returnMonthNumber(displayMonth))
    }
    else if (returnMonthNumber(requiredMonth) < returnMonthNumber(displayMonth) ){
      months = months +(returnMonthNumber(displayMonth)-returnMonthNumber(requiredMonth))
    }
    else  if (displayYear = requiredYear) months
   
    return months;
}


//##############################################################################################################
//  Function Name      : returnMonthNumber()
//  Purpose            : This function returns month number if user pass month name
//  Pre-Condition     : N/A
//  Created By        : Venu Gorantla
//  Date              : April-11-2014
//  Reviewed By       :   
//  Reviewed On        : 
// ###############################################################################################################

function returnMonthNumber (grade) {
grade=grade.toString().toLowerCase()
switch (grade)
{
  case 'january': return 1;
            break;
  case 'february': return 2;
            break;
  case 'march': return 3;
            break;
  case 'april': return 4;
            break;
  case 'may': return 5;
            break;
 case 'june': return 6;
            break;
  case 'july': return 7;
            break;
  case 'august':return 8;
            break;
  case 'september': return 9;
            break;
  case 'october': return 10;
            break;
 case 'november': return 11;
            break;
  case 'december': return 12;
            break;          
}

}


 //##############################################################################################################
//  Function Name        : compareTwoArrays
//    Purpose            :This function  is used to compare values of two arrays
//    Pre-Condition      : N/A
//    Created By        : Venu Gorantla
//    Date              :  Apr-15-2014
//    Reviewed By       :   
//    Reviewed On        : 
// ###############################################################################################################

function compareTwoArrays(Array1 ,Array2) {
try {
    // verifying two arrays size
    if (Array1.length == Array2.length) {
       for (var i=0 ; i<Array1.length; i++) {
              for (var j=0 ; j<Array2.length; j++) {
                   if (Array1[i].toString().toLowerCase().indexOf(Array2[j].toString().toLowerCase())>0) {
                   Log.Message( " First array value "+Array1[i]+ " matching with second array value: " +Array2[j]);
                   break;
                   }
                   else  if (j == Array2.length-1 ){
                      return false;
                   }  
             }
 
       }

    }

    else {
     Log.Message( " Two arrays are not in same size")
    return false
    }

return true;
}
catch (error1){
  Log.Message("compareTwoArrays function has an error message: " +error1.description); 
}
}


//##############################################################################################################
//  Function Name            : ExtractFile()
//    Purpose                :This function  is extrating the files from zip file.
//    Pre-Condition          : N/A
//    Created By            : RK
//    Date                  :  june-26-2014
//    Reviewed By           :   
//    Reviewed On            : 
// ###############################################################################################################

function ExtractFile(SourceFile,DestFolder)
 {
try {
  // If the extraction location does not exist, create it. 
  var fso = new ActiveXObject("Scripting.FileSystemObject"); 
  //fso.movefile(jarFile,SourceFile);
  if ( !fso.FolderExists(DestFolder) ){    
    fso.CreateFolder(DestFolder);
  }
  //Extract the contents of the zip file.
  var objShell = new ActiveXObject("Shell.Application"); 
  var FilesInZip =  objShell.NameSpace(SourceFile).Items(); 
  objShell.NameSpace(DestFolder).CopyHere(FilesInZip);
  fso = null;
  objShell = null;
  } catch(emsg) {
    fso = null;
    objShell = null;
    Log.Message("INCOMPLETE-ExtractFile method is not executed successfully with error description "+emsg.description);
  }    
 
}

//##############################################################################################################
//  Function Name            : getTextfromPropertiesFile()
//    Purpose                :This function  will return the text id from proprites file.
//    Pre-Condition          : N/A
//    Created By            : RK
//    Date                  :  june-26-2014
//    Reviewed By           :   
//    Reviewed On            : 
// ###############################################################################################################

function getTextfromPropertiesFile(File,TextID)
{
try {
  var FS, F, s;
 // var ZipFile="C:\\Documents and Settings\\Administrator\\Desktop\\HomeModule\\VetStationText.txt";
  var ForReading = 1;
  var ForWriting = 2;
  var ForAppending = 8;
  var i;
  FS = Sys.OleObject("Scripting.FileSystemObject");
  // Note that you can create FileSystemObject
  // using the following code:
  // FS = new ActiveXObject("Scripting.FileSystemObject")
  F = FS.OpenTextFile(File, ForReading);
  while(! F.AtEndOfStream){
    str = F.ReadLine();
    s=RemoveHTMLtags(str)
    var res = s.split("=");
    if (TextID== res[0])
    {
      if (res.length > 2){
        for (i=2;i<= res.length-1 ; i++) {
            res[1] = res[1]+ "="+ res[i]
        }
       
      }
	 return res[1];
     Log.Message(res[1]);
     break;
    }
  }
  F.Close();
  } catch(emsg) {
    Log.Message("INCOMPLETE-getTextfromPropertiesFile method is not executed successfully with error description "+emsg.description);
  } 
} 

//##############################################################################################################
//  Function Name            : ExtractFile()
//    Purpose                :This function  is extrating the files from zip file.
//    Pre-Condition          : N/A
//    Created By            : RK
//    Date                  :  june-26-2014
//    Reviewed By           :   
//    Reviewed On            : 
// ###############################################################################################################

function ChangeFileExtn(SourceFile,DestFile)
 {
try {
  // If the extraction location does not exist, create it. 
  var fso = new ActiveXObject("Scripting.FileSystemObject"); 
  fso.movefile(SourceFile,DestFile); 
  fso = null;  
  } catch(emsg) {
    fso = null;   
    Log.Message("INCOMPLETE-ChangeFileExtn method is not executed successfully with error description "+emsg.description);
  }    
 
}


//##############################################################################################################
//  Function Name            : RemoveHTMLtagsRemoveHTMLtags()
//    Purpose                :This function  is extrating the files from zip file.
//    Pre-Condition          : N/A
//    Created By            : RK
//    Date                  :  june-26-2014
//    Reviewed By           :   
//    Reviewed On            : 
// ###############################################################################################################

 function RemoveHTMLtags(str)
  {
  try { 

////      strHTMLtags="<html>|<div align=\"center\">| ?|<br />|</div>|</html>|<br/>|<B>|</B>|<b>|</b>&#160;|&#160;|&#160;|<br />|<I>|</I>|<br />|<font color=\"red\">|</font>|&#8482;|<UL><LI>|</LI><LI>|</LI></UL>|<br />" Commented by vijay
      strHTMLtags="<html>|<div align=\"center\">|<br />|</div>|</html>|<br/>|<B>|</B>|<b>|</b>&#160;|&#160;|&#160;|<br />|<I>|</I>|<br />|<font color=\"red\">|</font>|&#8482;|<UL><LI>|</LI><LI>|<div align=\"left\">|</b>|<br />|</LI></UL|<br /><br />|<ol><li>|<br/></li><li>|<br/><br/></li></ol>|</li><li>|<center>|</center>|<DIV align=\"left\">|<BR />|</DIV>|<ul>|<li>|</li>|<li>|</li>|</ul>|</LI>|<LI>"
      Arrayobj=strHTMLtags.split("|");
      for(i = 0;i<Arrayobj.length;i++){
        if ((Arrayobj[i]=="<br />") ||(Arrayobj[i]=="<br/>") ||(Arrayobj[i]=="<br />"))
        {
         str=str.replace(Arrayobj[i], " ");
        }
        else
        {
          str=str.replace(Arrayobj[i], "");
        }
      }
      return str;
      Log.Message(str);
  } catch(emsg) {
    fso = null;   
    Log.Message("INCOMPLETE-ChangeFileExtn method is not executed successfully with error description "+emsg.description);
  }    
  }
  
  function uniCodeToString(){
    var source ="\uae30\ud0c0";
    var escapedSource = escape(source);
    var codeArray = escapedSource.split("%u");
    var str = "";
    for(var i=1; i<codeArray.length; i++){
        str += String.fromCharCode("0x"+codeArray[i]);
    }
     Log.Message(str);
    //return str;
}

  function convertUnicodeValuesToStrings(source){
  try {
   var sourcen = "Page d\u2019accueil";
   String
    b=String.fromCharCode(source);
   var test6 = String(source);
   dd=unicodeToChar(source);
    var Strlength=source.length-1
    var strcharval="";
    for (i=0;i<=Strlength;i++)
    {    
      strcharval+=source.charAt(i);
    }
    Log.Message(strcharval);
    return strcharval;
  } catch(emsg) {
  strcharval = null;   
  Log.Message("INCOMPLETE-findUnicodeValues method is not executed successfully with error description "+emsg.description);
  }  
  }
 //##############################################################################################################
//  Function Name            : unicodeToChar()
//    Purpose                :This function  is Convert the Unicode values to strings.
//    Pre-Condition          : N/A
//    Created By            : RK
//    Date                  :  june-26-2014
//    Reviewed By           :   
//    Reviewed On            : 
// ###################################################################################################
  function unicodeToChar(text) {
    try {
   return text.replace(/\\u[\dABCDEFabcdef][\dABCDEFabcdef][\dABCDEFabcdef][\dABCDEFabcdef]/g, 
          function (match) {
               return String.fromCharCode(parseInt(match.replace(/\\u/g, ''), 16));
          });
          } catch(emsg) {
  strcharval = null;   
  Log.Message("INCOMPLETE-unicodeToChar method is not executed successfully with error description "+emsg.description);
  } 
}

function delfile(readfile)
  {
try {
// var readfile="C:\\Documents and Settings\\Administrator\\Desktop\\HomeModule\\VetStationText.txt";
   var fso = new ActiveXObject("Scripting.FileSystemObject");
   fileBool = fso.FileExists(readfile);
   if(fileBool)
     {
        fso.DeleteFile(readfile,true);
     }
      } catch(emsg) {
    Log.Message("INCOMPLETE-copyFileToFolder method is not executed successfully with error description "+emsg.description);
}   
  }

//function getVetStationTextfile() {
//try {
//        VetStationTextjarsSourceFile="C:\\IVLS4.0_Framework_customobjects\\TestDesign\\TestData\\propertiesfiles\\VetStationText.jar"
//        VetStationTextjarsDestFolder=   "C:\\IVLS4.0_Framework_customobjects\\TestDesign\\TestData\\propertiesfiles\\Temp"
//   //    var VetStationTextjarsSourceFile=propertiesName+"VetStationText.jar"
//     //  var VetStationTextjarsDestFolder=propertiesName+"Temp"
//       copyFileToFolder(VetStationTextjarsSourceFile,VetStationTextjarsDestFolder+"\\")
//      // click on Edit button to enter userid and comment                                                                                     
//
//        
//      
//  } catch(emsg) {
//           Log.Warning("Failed At navigateCustomDateSNAPLogReportScreen function with Desc :"+emsg.description)
//           logResult("Fail", "Error At navigateCustomDateSNAPLogReportScreen function with Desc :"+emsg.description ) 
//     }       
//}


//##############################################################################################################
//  Function Name            : RemoveFirstandlastspaces()
//    Purpose                :This function  is Convert the Unicode values to strings.
//    Pre-Condition          : N/A
//    Created By            : RK
//    Date                  : July-28-2014
//    Reviewed By           :   
//    Reviewed On           : 
// ###################################################################################################
  function RemoveFirstandlastspaces(Str)
  {
  try {
   
    chrlength=Str.length
    labarr=Str.split(/(?!$)/);
    var Stringval="";
    var pos1=Str.indexOf(" ")
    var pos2=Str.indexOf(" ",chrlength-1)
    for(i=0;i<=chrlength-1;i++)
    {  
      if(((pos1==0)&&(i==0))||((pos2==chrlength-1)&&(i==chrlength-1)))
      {
       labarr[i]=labarr[i].replace(labarr[i],"");
      }
      Stringval=Stringval+labarr[i];
    }
    
    Log.Message("String:"+Stringval);
    return Stringval;
    } catch(emsg) {
    Log.Message("INCOMPLETE-RemoveFirstandlastspaces method is not executed successfully with error description "+emsg.description);
    }   
  }
  

function getDateYYYYMMDD(){
  // GET CURRENT DATE
    var date = new Date();
 
    // GET YYYY, MM AND DD FROM THE DATE OBJECT
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth()+1).toString();
    var dd  = date.getDate().toString();
 
    // CONVERT mm AND dd INTO chars
    var mmChars = mm.split('');
    var ddChars = dd.split('');
 
    // CONCAT THE STRINGS IN YYYY-MM-DD FORMAT
    var datestring = yyyy + '-' + (mmChars[1]?mm:"0"+mmChars[0]) + '-' + (ddChars[1]?dd:"0"+ddChars[0]);
    return datestring;

 }