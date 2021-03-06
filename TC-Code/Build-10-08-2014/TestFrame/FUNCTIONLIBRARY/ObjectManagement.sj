////USEUNIT GenericFunctions
//USEUNIT GenericFunctions
//USEUNIT GlobalVariables


// Declare all the object variables accross application
// The object variable name should be the label name appearing on the application and prefixed by "o"
var oPatientName;

//##############################################################################################################
//  Function Name      : GetWindowHandler()
//  Purpose                   :This function  is used to get main window handler.
//  Pre-Condition         : IVLS Application should be opened 
//  Created By             :Vijay
//  Date                       :  Dec-18-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################



function getWindowHandler(){
    var oParent;

     try { 
          oParent =Sys.Process("javaw") //Sys.FindChild(WindowPropertyName,WindowPropertyValue,2);
     
           if(oParent.Exists) {
                  return oParent;
              }
            else {  
                  Log.Error(" Unable to find IVLS window Main Handler");
       
          }  
        } catch (exception) {                   
             // Stops the test execution and posts an exception message to the test log
              Log.Error(" Unable to find IVLS window Main Handler");
              Runner.Halt(exception.description);
        } 
}


//##############################################################################################################
//  Function Name      : getORClassName()
//  Purpose                   :This function  is used to get class name from OR xml file
//  Pre-Condition         : OR file should exists. 
//  Created By             : Murali
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getORClassName(oLogicalName) {
    oControlClassValue = getORPropertyValue(orFileName,oLogicalName,"ClassName");
    return oControlClassValue;
}

//##############################################################################################################
//  Function Name      : getORExpectedValue()
//  Purpose                   :This function  is used to get class name from OR xml file
//  Pre-Condition         : OR file should exists. 
//  Created By             : Murali
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getORExpectedValue(oLogicalName) {
    oControlClassValue = getORPropertyValue(orFileName,oLogicalName,"ExpectedValue");
    return oControlClassValue;
}

//##############################################################################################################
//  Function Name      : getORObjectType()
//  Purpose                   :This function  is used to get Object Type(list,text,lable,window....) from OR xml file
//  Pre-Condition         : OR file should exists. 
//  Created By             : Vinod
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getORObjectType(oLogicalName) {
   oControlClassValue = getORPropertyValue(orFileName, oLogicalName, "ObjectType");
   return oControlClassValue;
}

//##############################################################################################################
//  Function Name      : getORObjectName()
//  Purpose                   :This function  is used to get object name from OR xml file
//  Pre-Condition         : OR file should exists. 
//  Created By             : Vinod
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getORObjectName(oLogicalName) {
   oControlNameValue = getORPropertyValue(orFileName, oLogicalName, "ObjectName");
   return oControlNameValue;
}

//##############################################################################################################
//  Function Name      : getORObjectIndex()
//  Purpose                   :This function  is used to get object Index from OR xml file
//  Pre-Condition         : OR file should exists. 
//  Created By             : Vinod
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getORObjectIndex(oLogicalName) {
    oControlIndexValue = getORPropertyValue(orFileName, oLogicalName, "ObjectIndex");
    return oControlIndexValue;
}


//##############################################################################################################
//  Function Name      : getORObjectText()
//  Purpose                   :This function  is used to get object Text from OR xml file
//  Pre-Condition         : OR file should exists. 
//  Created By             : Vinod
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getORObjectText(oLogicalName) {
    oControlIndexValue = getORPropertyValue(orFileName, oLogicalName, "ObjectText");
    return oControlIndexValue;
}
//##############################################################################################################
//  Function Name      : getORPropertyValue()
//  Purpose                   :This function  is used to read attribute values from xml file(OR)
//  Pre-Condition         : OR file should exists. 
//  Created By             : Murali
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getORPropertyValue(orFileName, oLogicalName, oAttributeName) {
   
     var XMLDoc, s, Nodes, ChildNodes, i, Node;
     //XMLDoc = Sys.OleObject("Msxml2.DOMDocument.6.0");
     XMLDoc = Sys.OleObject("Msxml2.DOMDocument.6.0");
     XMLDoc.async = false;
     // Load data from a file
     XMLDoc.load(orFileName);
  
     // Report an error, if, for instance, the markup or file structure is invalid 
     if (XMLDoc.parseError.errorCode != 0) {
        s = "Reason:\t" + XMLDoc.parseError.reason + "\n" +
          "Line:\t" + aqConvert.VarToStr(XMLDoc.parseError.line) + "\n" + 
          "Pos:\t" + aqConvert.VarToStr(XMLDoc.parseError.linePos) + "\n" + 
          "Source:\t" + XMLDoc.parseError.srcText;
         // Post an error to the log and exit
         Log.Error("Cannot parse the document.", s); 
         return;
     }
  
     // Use an XPath expression to obtain a list of "control" nodes 
     Nodes = XMLDoc.selectNodes("//Property");
  
     // Process the node
     for (i = 0; i < Nodes.length; i++) {
       // Get the node from the collection of found nodes 
       Node = Nodes.item(i);
       // Get child nodes 
       ChildNodes = Node.childNodes;
       // Output two child nodes to the log
       if (ChildNodes.item(0).text.toLowerCase() == oLogicalName.toLowerCase()) {   
     
          switch (oAttributeName.toLowerCase()) {  
             
             case "objecttype"      :  return ChildNodes.item(1).text
                                       break;
                                      
             case "classname"       :  return ChildNodes.item(2).text;
                                       break;
                                       
             case "expectedvalue"   :  return ChildNodes.item(2).text;
                                       break;
                                                                                                                                                     
             case "objectname"      :  return ChildNodes.item(3).text
                                       break; 
                                          
             case "objecttext"      :  return ChildNodes.item(3).text
                                       break;                                                                                  
           
             case "objectindex"     :  return ChildNodes.item(4).text
                                       break;
            } 
        } 
     }
}

//##############################################################################################################
//  Function Name      : getORProperty()
//  Purpose                   :This function  is used to read attribute values from xml file(OR)
//  Pre-Condition         : OR file should exists. 
//  Created By             : Murali
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function getORProperty(oLogicalName){
   
   try { 
     var objProperties = new ActiveXObject("Scripting.Dictionary");      
     var XMLDoc, s, Nodes, ChildNodes, i, Node;
     //XMLDoc = Sys.OleObject("Msxml2.DOMDocument.6.0");
     XMLDoc = Sys.OleObject("Msxml2.DOMDocument.6.0");
     XMLDoc.async = false;
     // Load data from a file
     XMLDoc.load(orFileName);
  
     // Report an error, if, for instance, the markup or file structure is invalid 
     if (XMLDoc.parseError.errorCode != 0) {
        s = "Reason:\t" + XMLDoc.parseError.reason + "\n" +
          "Line:\t" + aqConvert.VarToStr(XMLDoc.parseError.line) + "\n" + 
          "Pos:\t" + aqConvert.VarToStr(XMLDoc.parseError.linePos) + "\n" + 
          "Source:\t" + XMLDoc.parseError.srcText;
         // Post an error to the log and exit
         Log.Error("Cannot parse the document.", s); 
         return;
     }
  
     // Use an XPath expression to obtain a list of "control" nodes 
     Nodes = XMLDoc.selectNodes("//Property");
  
     // Process the node
     for (i = 0; i < Nodes.length; i++) {
       // Get the node from the collection of found nodes 
       Node = Nodes.item(i);
       // Get child nodes 
       ChildNodes = Node.childNodes;
       // Output two child nodes to the log
       if (ChildNodes.item(0).text.toLowerCase() == oLogicalName.toLowerCase()) {   

          Attrs = ChildNodes;
            for(k = 1; k < Attrs.length; k++)
            {
              Attr = Attrs.item(k);
              onjName = Attr.nodeName;
              if (onjName.toLowerCase() != "childproperty") {
                  objProperties.Add(Attr.nodeName, Attr.text);
              }
              else
              {
                break;
              }
              
            }
 
        } 
        
     }
      } catch (exception) {                   
          Log.Message("Cannot parse the document");
    }
return objProperties      
      
}


//##############################################################################################################
//  Function Name      : getORChildProperty()
//  Purpose                   :This function  is used to read attribute values from xml file(OR)
//  Pre-Condition         : OR file should exists. 
//  Created By             : Murali
//  Date                       :  oct-2-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function getORChildProperty(oChildLogicalName) {
  
     try { 
     var objProperties = new ActiveXObject("Scripting.Dictionary");
     var XMLDoc, s, Nodes, ChildNodes, i, Node;
     //XMLDoc = Sys.OleObject("Msxml2.DOMDocument.6.0");
     XMLDoc = Sys.OleObject("Msxml2.DOMDocument.6.0");
     XMLDoc.async = false;
     // Load data from a file
     XMLDoc.load(orFileName);
  
     // Report an error, if, for instance, the markup or file structure is invalid 
     if (XMLDoc.parseError.errorCode != 0) {
        s = "Reason:\t" + XMLDoc.parseError.reason + "\n" +
          "Line:\t" + aqConvert.VarToStr(XMLDoc.parseError.line) + "\n" + 
          "Pos:\t" + aqConvert.VarToStr(XMLDoc.parseError.linePos) + "\n" + 
          "Source:\t" + XMLDoc.parseError.srcText;
         // Post an error to the log and exit
         Log.Error("Cannot parse the document.", s); 
         return;
     }
  
    // Use an XPath expression to obtain a list of "control" nodes 
     Nodes = XMLDoc.selectNodes("//ChildProperty");
  
     // Process the node
     for (i = 0; i < Nodes.length; i++) {
       // Get the node from the collection of found nodes 
       Node = Nodes.item(i);
       // Get child nodes 
       ChildNodes = Node.childNodes;
       // Output two child nodes to the log
//       if (ChildNodes.item(0).text.toLowerCase() == oLogicalName.toLowerCase()) {   
      if (ChildNodes.item(0).text.toLowerCase() == oChildLogicalName.toLowerCase()) {  
          Attrs = ChildNodes;
            for(k = 1; k < Attrs.length; k++)
            {
                  Attr = Attrs.item(k);
                  onjName = Attr.nodeName;
                  objProperties.Add(Attr.nodeName, Attr.text);
                            
            }
 
        } 
     }
      } catch (exception) {                   
          Log.Message("Cannot parse the document");
    }
              return objProperties;
}



//##############################################################################################################
//  Function Name      : SetObject()
//  Purpose                   :This function  is used to return object based on oLogicalName,ObjectName and ClassName
//  Pre-Condition         : IVLS Application should be opened 
//  Created By             : Vijay
//  Date                       :  Dec-18-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function setObject(oLogicalName,status,Text) {
           
      // Variable Initilization
      var oParent = null;            
      var actualObj = null;
      var arrPropNames=null;
      var arrPropValues=null;
     // var undefined=false;
      var  arrPropNames= new Array();
      var arrPropValues = new Array();
      var objDictProperties =  getORProperty(oLogicalName);
      var objtext=null;
      var iCnt=0;
       try {
       
        // Read Object propertyNames and Property Values from the OR xml file to identify the object on application
              var objkeys=(new VBArray(objDictProperties.Keys())).toArray(); 
              var count=objkeys.length;
              for (i=0;i<count;i++) {
                      arrPropNames[i]= objkeys[i];
                      arrPropValues[i] = objDictProperties(objkeys[i]);
//                      if (arrPropNames[i].toUpperCase() == "FULLNAME"){  
//                       var blnflag =languageCheck();                                  
//                        if (blnflag==true)
//                        {
//                          arrPropValues[i]= arrPropValues[i].replace("Sys.Process(\"javaw\").JavaFXObject(\"Stage\", \"\")","Sys.Process(\"javaw\").JavaFXObject(\"Stage\", \"\",0)")
//                        }                      
//                      }
              }
               var objtext=Text;
              if(typeof objtext!= 'undefined')
              {
                arrPropNames.push("JavaFXObjectText");
                arrPropValues.push(Text);
              }
              objDictProperties.RemoveAll();

             // Set main Window Handler
              var oParent =getWindowHandler();
              
             oParent.Refresh();
             if (oParent != null) {  

                   var actualObj= oParent.Find(arrPropNames,arrPropValues, 50);
                   while ((actualObj.Exists) || (iCnt<=5)) {
                    var actualObj= oParent.Find(arrPropNames,arrPropValues, 50);
                       if (actualObj.Exists) {                                        
                           Log.Message("Object Found :"+oLogicalName );
                           return actualObj;
                       }
                      iCnt=iCnt+1;
//                      Delay(int500MSec)
                       Delay(1000);
                   }

                if ((! actualObj.Exists))  { 
                   actualObj=null;
                   // validating status to log the result
                   if (!status ){
                   
                    Log.Error("Object Not Found :"+oLogicalName );
                    logResult("Fail-", "Object not exist "+oLogicalName, 1);
                    }
                  }
  
             }
             else {      
                Log.Error("Application Main Window Not Found");
             }
                     
    } catch (exception) {                   
          Log.Error(oLogicalName + "   Object Not Found on Main Window");
    }
    return actualObj;
}


function languageCheck()
{
try {
     // dataDriverSheetone = DDT.ExcelDriver(driverDataPath, "IVLS");
    //  strLang = dataDriverSheetone.Value(3);
////      if ((strLang=="Japanese"||"Portuguese"))
      if ((strLang =="Portuguese"))
      {
      // DDT.CloseDriver(dataDriverSheetone.Name)
        return true;
      }
    // DDT.CloseDriver(dataDriverSheetone.Name)
     
}catch(eMsg3) {
   Log.Error(" Error While executing the function languageCheck with Desc :"+eMsg3.description) ;
}

}

//##############################################################################################################
//  Function Name      : SetObject()
//  Purpose                   :This function  is used to return object based on oLogicalName,ObjectName and ClassName
//  Pre-Condition         : IVLS Application should be opened 
//  Created By             : Vinod
//  Date                       :  oct-16-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function setUserDefinedObject(oLogicalName,strInputValue) {
           
    // Variable Initilization
    var foundFlag = false;
    var resultFlag = false;
    var oParent = null;            
    var objectID = null;
    var actualObj = null;    
    
    // Read ObjectType Property Value from the OR xml file
    var objectType = getORObjectType(oLogicalName);
    if (objectType != null){
        objectType = objectType.replace(/^\s+|\s+$/g,'');   
    }
    else {
    Log.Message("objectType is not found for oLigicalName " + oLogicalName);
    }
    // Read ClassName Property Value from the OR xml file
    var className = getORClassName(oLogicalName);
    if (className != null){        
        className = className.replace(/^\s+|\s+$/g,'');
        Log.Message("className: "+className);
    }
    else {
    Log.Message("className is not found for oLigicalName " + oLogicalName);
    }    
    
    // Read ObjectName / ObjectText Property Vale from the OR xml file to identify the object on application
    var objectName = getORObjectName(oLogicalName);
    if (objectName != null){
        objectName = objectName.replace(/^\s+|\s+$/g,'');
         Log.Message("objectName: "+objectName);
    }     
    else {
    Log.Message("objectName is not found for oLigicalName " + oLogicalName);
    } 
        
    // Set main Window Handler
    var oParent = getWindowHandler();
    oParent.Refresh();
    
    if (oParent != null) {
        objectID = oParent.FindAllChildren("JavaClassName",className, 50);
        objectID = (new VBArray(objectID)).toArray();
        Log.Message("length of array:"+ objectID.length);
        if (objectID.length > 0) {
          try { 
              for (i = 0; i < objectID.length && foundFlag == false; i++) {   

                 switch (objectType.toLowerCase()) {
                         
                       
                        case "grid"     :  var actualObject = aqObject.GetPropertyValue(objectID[i],"JavaFXObjectIndex" );
                                                Log.Message("actualObject"+actualObject);
                                                Log.Message("objectName"+objectName);
                                                if (actualObject == strInputValue) {
                                                   foundFlag = true;
                                                   actualObj = objectID[i];                                                   
                                                   resultFlag = foundFlag;
                                                   Log.Message("Object Found :"+className );
                                                }
                                           
                                           break;
                                                                                      
                                           
                        default     :   Log.Message(objectType + " not found");             
                                           break;  
                    }//switch          
                }//for
            } catch (exception) {                   
               if (foundFlag == false) {                  
                  Log.Message(ObjectName + "   Object Not Found on Main Window");
               }
            }        
        }
        else {
          if (foundFlag == false) {         
             Log.Message("No Object found with Given ObjectName "+ objectName);
          }
        }
    }
    else {      
      Log.Message("Application Main Window Not Found");
    }
    if (foundFlag == false) {        
        Log.Message("No Object found");    
    }
    return actualObj;   
}

//##############################################################################################################
//  Function Name    : setCustomObject()
//  Purpose          : This function  is used to return object which is identified with parent object properties.                      
//  Pre-Condition   : IVLS Application should be opened 
//  Created By      : Vinod
//  Date            : oct-17-2013
//  Reviewed By     :   
//  Reviewed On     : 
// ###############################################################################################################

function setCustomObject(oParentLogicalName,oChildLogicalName,Text) {

 // Variable Initilization
    var oParent = null;            
    var actualObj = null;
    var arrChildPropNames=null;
    var arrChildPropValues=null;
    var  arrChildPropNames = new Array();
    var  arrChildPropValues = new Array();
    var iCnt=0;
    var objDictProperties =  getORChildProperty(oChildLogicalName);
      
     try { 
            oParent=setObject(oParentLogicalName);
            // Read Child Object propertyNames and Property Values from the OR xml file to identify the object on application
             objDictProperties = getORChildProperty(oChildLogicalName);
              var objkeys=(new VBArray(objDictProperties.Keys())).toArray(); 
              var count=objkeys.length;
              for (i=0;i<count;i++) {
                      arrChildPropNames[i]= objkeys[i];
                      arrChildPropValues[i] = objDictProperties(objkeys[i]);
              }
              
                var objtext=Text;
              if(typeof objtext!= 'undefined')
              {
                arrChildPropNames.push("JavaFXObjectText");
                arrChildPropValues.push(Text);
              }            
              objDictProperties.RemoveAll();
                   
           // Set main Window Handler
             if (oParent != null) {  
      
                   var actualObj=oParent.Find(arrChildPropNames,arrChildPropValues, 20);
                   while ((actualObj.Exists) || (iCnt<=30)) {
                      var actualObj=oParent.Find(arrChildPropNames,arrChildPropValues, 20);
                       if (actualObj.Exists) {                                        
                           Log.Message("Object Found :"+oChildLogicalName );
                           return actualObj;
                       }
                       iCnt=iCnt+1;
                       Delay(int500MSec)
                       Delay(1000);
                     }
                  if ((! actualObj.Exists))  { 
                     actualObj=null;
                     Log.Error("Object Not Found :"+oChildLogicalName );
                     
                          
                     }      
     
                      
             }
             else {      
                Log.Error(oParentLogicalName+" Parent object Not Found");
             }
                     
    } catch (exception) {                   
          Log.Error(oChildLogicalName + "Object Not Found on Main Window");
    }
    return actualObj;
}


//##############################################################################################################
//  Function Name    : verifyDynamicLableText()
//  Purpose          : This function  is used to verify label text that dynamicall generating                  
//  Pre-Condition   : IVLS Application should be opened 
//  Created By      : Vinod
//  Date                : oct-17-2013
//  Reviewed By     :   
//  Reviewed On     : 
// ###############################################################################################################


function verifyDynamicLableText(oLogicalName,objectName) {

  // Variable Initilization
    var foundFlag = false;
    var resultFlag = false;
    var oParent = null;            
    var objectID = null;
    var actualObj = null;    
    
    // Read ObjectType Property Value from the OR xml file
    var objectType = getORObjectType(oLogicalName);
    if (objectType != null){
        objectType = objectType.replace(/^\s+|\s+$/g,'');   
    }
    else {
    Log.Message("objectType is not found for oLigicalName " + oLogicalName);
    }
    // Read ClassName Property Value from the OR xml file
    var className = getORClassName(oLogicalName);
    if (className != null){        
        className = className.replace(/^\s+|\s+$/g,'');
        Log.Message("className: "+className);
    }
    else {
    Log.Message("className is not found for oLigicalName " + oLogicalName);
    }    
        
    // Set main Window Handler
    var oParent = getWindowHandler();
    oParent.Refresh();
    
    if (oParent != null) {
        objectID = oParent.FindAllChildren("JavaClassName",className, 50);
        objectID = (new VBArray(objectID)).toArray();
        Log.Message("length of array:"+ objectID.length);
        if (objectID.length > 0) {
          try { 
              for (i = 0; i < objectID.length && foundFlag == false; i++) {   

                                    if (className == "FawkesLabel") {                        
                                               var actualObjectText = aqObject.GetPropertyValue(objectID[i], "JavaFXObjectText");
                                               actualObjectText = actualObjectText.replace(/^\s+|\s+$/g,'');          
                                               actualObjectText = actualObjectText.replace(/^\s+|\s+$/g,'');                                                                                              
                                               if ((actualObjectText.toLowerCase()) == (objectName.toLowerCase())) {                                                            
                                                    foundFlag = true;                                                
                                                    actualObj = objectID[i];                                              
                                                    resultFlag = foundFlag;
                                                    Log.Message("Object Found :"+actualObjectText);
                                                    
                                               }
                                                                                              
                                           }
                                           else { 
                                                 var actualObjectName = aqObject.GetPropertyValue(objectID[i], "JavaFXObjectName");                                           
                                                 Log.Message(actualObjectName);
                                                 actualObjectName = actualObjectName.replace(/^\s+|\s+$/g,'');
                                                 objectName = objectName.replace(/^\s+|\s+$/g,'');          
                                                 if (actualObjectName.length >0) { 
                                                     if (actualObjectName.toLowerCase() == objectName.toLowerCase()) {                            
                                                          var oLabelText = objectID[i].FindAllChildren("JavaClassName","FawkesLabel", 50);                  
                                                          oLabelText = (new VBArray(oLabelText)).toArray();
                                                          for (var j = 0; j < oLabelText.length; j++) {
                                                               foundFlag = true;
                                                               actualObj = oLabelText[0];                                                    
                                                               resultFlag = foundFlag;
                                                               Log.Message("Object Found :"+actualObjectName );
                                                         
                                                          }                    
                                                     }                            
                                                 } 
                                           }
                                           
                            }//for
            } catch (exception) {                   
               if (foundFlag == false) {                  
                  Log.Message(ObjectName + "   Object Not Found on Main Window");
               }
            }        
        }
        else {
          if (foundFlag == false) {         
             Log.Message("No Object found with Given ObjectName "+ objectName);
          }
        }
    }
    else {      
      Log.Message("Application Main Window Not Found");
    }
    if (foundFlag == false) {        
        Log.Message("No Object found");    
    }
    return actualObj; 

}
