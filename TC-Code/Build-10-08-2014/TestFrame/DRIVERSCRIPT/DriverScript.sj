//USEUNIT ActionKeywords
//USEUNIT BusinessFunctions
//USEUNIT CommonFunction
//USEUNIT GenericFunctions
//USEUNIT GlobalVariables
//USEUNIT ObjectManagement

//================================================================================================================
//  Script Name  : IDEXIVLS DriverScript
//  Purpose      : This script Controls the flow of Test Scenarion execution.
//                 Reads test data and Configuration data from respective files and 
//                 Provides the required data for Test Script to execute Business Components 
//  Pre-Condition : IDEXIVLS Framework with application installed in your machine.
//   Created By    : Venu Gorantla
//  Date          :Sep-19-2013
//  Reviewed By   :          
//  Reviewed On   : 
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modification Log<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//               Modified By       Date                      Purpose                                                                                Reviewed By       Reviewed On                   
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//            
//================================================================================================================

function driverScript() {
// variables declaration 
var strScriptName, strScenarioId, strScenarioDesc, strScenarioFlag, strOutPutParm,  strInputParm, strScenarioFlag,  strOutPutParm;
  Indicator.Hide(); 
  
  // loading all global variables
   loadGlobalVariables();
  
  // creating a text file to write the execution log result 
  createLogFile();

  var  timestp=timeStamp();
  // this function is input to the xml file for environament
  startTime=getTimeXmlFormat();
  // create TestSuitenode node and respective attributes 
  addTestSuitenodeandchildnodes( dom,rootNode,TestSuitenode,"IDEXX-IVLS 4.0","","TestComplete","IDEXX-IVLS4.0","Firefox 14.0.1",timestp)
  try {
  
    // Creates a DDT driver and getting execution language details
    dataDriverSheet = DDT.ExcelDriver(driverDataPath, "IVLS");
     strLang = dataDriverSheet.Value(4);
      strLanguage = strLang
     writeExecutionDetails("===============================================================================================");
     writeExecutionDetails("Started Executing Automation suite in "+strLang +" Language");
     writeExecutionDetails("===============================================================================================");
      //Writting application version in log file
       writeIVLSVersioninLogFile();
     //  Iterates all the modules in module sheet
      while(! dataDriverSheet.EOF()) { 
         
          //Gets a Execution Flag from Module level to execute the specific module
             strDivExeFlag = dataDriverSheet.Value(2);
            if (strDivExeFlag.toUpperCase() == "YES") {
                    strModStartTime=getFullTimeString();
                  //Getting the values of name of the module,  type of execution and language from driver sheet
                      strModuleName = dataDriverSheet.Value(1);
                      strModID = dataDriverSheet.Value(0);
                      numberOfIterations = dataDriverSheet.Value(3);
                      // assiging numberOfIterations to 1 if the value is null
                      if (numberOfIterations == null) numberOfIterations=1
                      
                      for (iCnt = 1; iCnt <= numberOfIterations; iCnt++){
                      // creating dictionary object to store the execution details.
                       objDictionary = new ActiveXObject("Scripting.Dictionary");
                       objDictionary.compareMode=1;
                         
                    //this function creates a screen shot folder
                      //createScreenshotFolder();
                                          
                     // writting Result file with the execution module name
                      writeExecutionDetails("===============================================================================================");
                      writeExecutionDetails("----------------------------Started Executing module: "+strModuleName +" Iteration :"+iCnt);
                       writeExecutionDetails("===============================================================================================");

                      TestNode=addNodeWithoutValue(dom,TestSuitenode,"Test")
                      TestCaseDetailNode= createTestCaseDetailsNode(dom,TestNode);
                       childNodeSteps= addNodeWithoutValue( dom,TestNode,"Steps");    
                    
                  //Accessing specific module sheet
                    var dataModuleSheet = DDT.ExcelDriver(driverDataPath, strModID);
               
                             try {
                                      //  Iterates all the scripts exist in  specific module sheet
                                  while (! dataModuleSheet.EOF()) {
                                     
                                          strRunFlag = dataModuleSheet.Value(3);
                                          // assigining pre-execution status as true.
                                              bcExecutionStatus="true";
                                              strFailScriptName="";
                                         //Gets a Execution Flag from Script level to execute the specific script in a specific module
                                          if (strRunFlag.toUpperCase() == "YES") {
                                               // Assigning the value
                                               strScriptName = dataModuleSheet.Value(1);
                                                strScenarioId = dataModuleSheet.Value(0);
                                                strScenarioDesc = dataModuleSheet.Value(2);  
                                               strDependencyScenarioDetails = dataModuleSheet.Value(4);
                                                                                                      
                                                Log.Message(" started executing scenario "+strScenarioId)  
                                                // validating dependent scenario status   
                                                if (dependencyScenarioVerification(strDependencyScenarioDetails, strScenarioId) == true) {
                                                // writting the log file before each scenario  execution
                                                 //   scriptStartLog(strScenarioId+" "+strScriptName, strScenarioDesc); 
                                                   scriptStartLog(strScenarioId, strScenarioDesc);
                                                                                                     
                                                    // Accessing the test case sheet                                      
                                                    tcSheet = DDT.ExcelDriver(tcDataPath+"\\"+strModID+".xls", strScenarioId);
                                                    
                                                       while (! tcSheet.EOF()) {
                                                         // Assigning the value
                                                          strInputParm = tcSheet.Value(3);
                                                          strScenarioFlag = tcSheet.Value(4);
                                                          strActionName = tcSheet.Value(2);
                                                          strActionDescription = tcSheet.Value(1);
     
                                                                //verifying the ActionName whether is it startiteration or stopiteration and based on that assiging the parameters
                                                                if((strActionName.toUpperCase() == "STARTITERATION")||(strActionName.toUpperCase() == "STOPITERATION")) {
                                                                  strOutPutParm = strInputParm
                                                                  }  else {
                                                                 strOutPutParm = getArrayTestData(strInputParm);
                                                                  }
                                                                  // Assiging scenario Flag to NO if it is null
                                                                 if ((strScenarioFlag == null)||(strActionName.toUpperCase() == "STOPITERATION")) {
                                                                 strScenarioFlag = "NO"
                                                                 }
                                                                                                              
                                                                 if(strScenarioFlag.toUpperCase() == "YES") {
                                                                    strTestStepDescription = tcSheet.Value(1); 
                                                                     //retrieving based on the language
                                                                     testDataRetrieve(strModID, strActionName, strLang, strOutPutParm, strScenarioId);                                                                                                                                                                                         
                                                                  } 
                               
                                                              //validating tc sheet moved to last row     
                                                               if(! tcSheet.EOF()){
                                                                    tcSheet.Next();
                                                                } else{
                                                                   DDT.CloseDriver(tcSheet.Name)
                                                               }       
                                                        }
                                                        if (objDictionary.Exists(strScenarioId)) objDictionary.Remove(strScenarioId);
                                                        objDictionary.add (strScenarioId,bcExecutionStatus); 
                                                        DDT.CloseDriver(tcSheet.Name)
                                              }//Closing dependency script validation
                                              }
                                                dataModuleSheet.Next();
                                         }
                                             //retrieving values in the dictionary object and printing
                                              Log.Message( "Length of dictionary object is "+objDictionary.count)
                                             var objkeys=(new VBArray(objDictionary.Keys())).toArray(); 

                                    } catch(exception)  {            
                                      Log.Message(exception.description);
                                 
                                    } 
                                    strModEndTime=getFullTimeString()                                   
                             addTestnodeandchildnodes(dom,TestSuitenode,TestNode,timeDiffXmlForm(strModEndTime,strModStartTime),strModuleName,"verify the "+strModuleName,"Pass","Test case requirement id")                                     
                           
						       DDT.CloseDriver(dataModuleSheet.Name)
						    }
						   }
                        dataDriverSheet.Next();
              }
  
 }  catch (errorDetails) { 
          Log.Message(errorDetails.description);  
      } finally  {
      endTime=getTimeXmlFormat();
      logFile=strResultFile;
      //addEnvironmentNodeandAttributes( dom,rootNode,endTime,getComputerName(),logFile,startTime,timeDiffXmlForm(endTime, startTime),getOSName())
     // createTestResultListXml(strTestResultfile,xmllogfilename,"4","0","55","0");
      //dom.save(xmllogfilepath);
      }
}
