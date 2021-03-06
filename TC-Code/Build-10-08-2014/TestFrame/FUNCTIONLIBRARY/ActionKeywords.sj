//USEUNIT CommonFunction
//USEUNIT GenericFunctions
//USEUNIT GlobalVariables
//USEUNIT ObjectManagement

//##############################################################################################################
//  Function Name      :  click()
//  Purpose                   : This function click on the object
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       : Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function click(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {
           actionObj.Keys	("^[ReleaseLast]");
           actionObj.click();
            resultFlag = true;
           Log.Message("Sucessfully Clicked");        
    }
    else {      
      resultFlag = false;
      Log.Message("Failed to Click as input object is null");      
    }
    return resultFlag;
}


function clickNew(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {
        actionObj.click();
        resultFlag = true;
        Log.Message("Sucessfully Clicked");        
    }
    else {      
      resultFlag = false;
      Log.Message("Failed to Click as input object is null");      
    }
    return resultFlag;
}



//##############################################################################################################
//  Function Name      :  selectItem()
//  Purpose                   :This function Select Item from list box
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function selectItem(actionObj, itemIndex) { 
    

    var resultFlag = false;
    if (actionObj != null) {
       oTextBox = actionObj;
       itemIndex=aqConvert.StrToInt(itemIndex);   
       if (((itemIndex >= 0) && (itemIndex < oTextBox.wItemCount)) > 0) {
            oTextBox.ClickItem(itemIndex);
            Log.Message("Sucessfully Selected Item"+ itemIndex +" on Combo box");            
            resultFlag = true;
        }
        else {
          Log.Message("ItemIndex not valid");          
        }    
    }
    else {
      Log.Message("Failed to Select Item as input object is null");      
      resultFlag = false;
    }
    return resultFlag;
}


//##############################################################################################################
//  Function Name      :  setText()
//  Purpose                   :This function set the given text in Edit box.
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Sep-25-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function setText(actionObj, strInput) { 
    
    var resultFlag = false;
    if (actionObj != null) {
       oTextBox = actionObj;
       oTextBox.Keys(strInput);
       Log.Message("Sucessfully set text "+ strInput +" on text box");       
       resultFlag = true;
    }
    else {
       Log.Message("Failed to Set Text as input object is null");       
       resultFlag = false;
    }
    return resultFlag;
}


//##############################################################################################################
//  Function Name      :  getText()
//  Purpose                   :This function get the text from Edit box.
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-08-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getText(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {
       oTextBox = actionObj;
       var textValue = aqObject.GetPropertyValue(oTextBox, "wText");
       resultFlag = true;
       Log.Message("Sucessfully get text " + textValue);       
    }
    else {
      Log.Message("Failed to get Text as input object is null");      
      resultFlag = false;
    }
    return resultFlag+";"+textValue;
}


//##############################################################################################################
//  Function Name      :  getItemCount()
//  Purpose                   :This function to return list/combo box items count.
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-15-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getItemCount(actionObj) { 
    
    var resultFlag = false;
    var listItemCount=""
    if (actionObj != null) {
        oCombo = actionObj;
        listItemCount = aqObject.GetPropertyValue(oCombo, "wItemCount");
        Log.Message("Sucessfully get Item Count: " + listItemCount);        
        resultFlag = true;
    }
    else {
      Log.Message("Failed to get Item Count as input object is null");      
      resultFlag = false;
    }
    return resultFlag+";"+listItemCount;
}






//##############################################################################################################
//  Function Name      :  getSelectedIndex()
//  Purpose                   :This function to returns index selected item from List/combo box
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-10-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function getSelectedIndex(actionObj) { 
    
    var resultFlag = false;
    var itemIndex=""
    if (actionObj != null) {
        oCombo = actionObj;
        itemIndex = aqObject.GetPropertyValue(oCombo, "wSelectedItem");                                                                 
        Log.Message("Sucessfully get selected index from combo as : " + itemIndex);        
        resultFlag = true;
    }
    else {
      Log.Message("Failed to get selected item as input object is null");      
      resultFlag = false;
    }
    return resultFlag+";"+itemIndex;
}


//##############################################################################################################
//  Function Name      :  getState()
//  Purpose                   :This function returns the object state based on property 
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-08-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function getState(actionObj, property ) { 
   
   var resultFlag = false;
   var objectState =false;
   if (actionObj != null) {
      olable = actionObj;        
      switch (property.toLowerCase()) { 
              
         case "enabled"        :  objectState = aqObject.GetPropertyValue(actionObj, "Enabled");                                                                              
                                  Log.Message("objectState Enabled found as "+objectState);                                              
                                  resultFlag = true;
                                  break;
                               
         case "exists"         :  objectState = aqObject.GetPropertyValue(actionObj, "Exists");                                                                              
                                  Log.Message("objectState Exists found as "+objectState);                                              
                                  resultFlag = true;
                                  break;
            
         case "visible"        :  objectState = aqObject.GetPropertyValue(actionObj, "Visible");                                                                                                                          
                                  Log.Message("objectState Visible found as "+objectState);                                              
                                  resultFlag = true;
                                  break;  
                                  
          case "visibleonscreen"  :  objectState = aqObject.GetPropertyValue(actionObj, "VisibleOnScreen");                                                                                                                          
                                  Log.Message("objectState Visible found as "+objectState);                                              
                                  resultFlag = true;
                                  break;  
                                                           
                                                                                                                                  
         default               :  Log.Message(" Provided property Name "+property+ " is not related to status of Object");
                                  resultFlag = true;                                  
                                  objectState = false;                                    
                                  break;                                                                                                                                      
        }
    }
    else {
      Log.Message("Failed to get State as input object is null");
    }
    return resultFlag+";"+objectState;
}


//##############################################################################################################
//  Function Name      :  getLable()
//  Purpose                   :This function get the lable from the object 
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-09-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function getLable(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {
       olable = actionObj;        
       var lableValue = aqObject.GetPropertyValue(olable, "JavaFXObjectText");
       Log.Message("Sucessfully get the lable "+ lableValue);       
       resultFlag = true;
    }
    else {
      Log.Message("Failed to get Lable as input object is null");      
      resultFlag = false;
    }
    return resultFlag+";"+lableValue;
}




//##############################################################################################################
//  Function Name      :  getWindowTitle()
//  Purpose                   :This function get the title of the window 
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-09-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function getWindowTitle(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {
        oWindow = actionObj;
        var windowTitle = aqObject.GetPropertyValue(oWindow, "JavaFXObjectText");
        Log.Message("Sucessfully get Window Title : " + windowTitle);        
        resultFlag = true;
    }
    else {
      Log.Message("Failed to get Window Title as input object is null");      
      resultFlag = false;
    }
    return resultFlag+";"+windowTitle;
}

//##############################################################################################################
//  Function Name      :  wait()
//  Purpose                   :This function pause the script execution for given period of time. 
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-15-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function wait(waitTimeInMilliSec) {  
  aqUtils.Delay(waitTimeInMilliSec);
}

//##############################################################################################################
//  Function Name      :  waitProperty()
//  Purpose                   :This function pause the script execution until the specified object
//                      property achieves the specified value or
//                      until the specified timeout elapses. 
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-15-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function waitProperty(actionObj, PropertyName, PropertyValue, WaitTime) {  
    
  if(actionObj != null){   
     actionObj.WaitProperty(PropertyName, PropertyValue, WaitTime);
     Log.Message(actionObj.JavaFXObjectName +" found and wait");          
   }
   else{        
     Log.Message(actionObj.JavaFXObjectName +" not found on main window");     
   }   
} 

     


//##############################################################################################################
//  Function Name      :  waitObjectExist()
//  Purpose                   :This function pause the script execution until the specified object
//                      exists or until the specified timeout elapses. 
//  Pre-Condition         : N/A
//  Created By             : Vijay
//  Date                       :  Dec-19-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function waitObjectExist(oLogicalName) {  
  var foundFlag = false;
  var counter=0;
  var timeOutCounter=0;  
  
  WaitTimeInMilliSec=aqConvert.StrToInt(WaitTimeInMilliSec);
  timeOutCounter= (WaitTimeInMilliSec/1000);
  Log.Message("timeOutCounter: "+ timeOutCounter); 
     for (var starter=0;starter<=timeOutCounter;starter++){
        var actionObj1= setObject(oLogicalName);        
       if ((actionObj1.Exists)||(timeOutCounter == counter)){
        foundFlag=true;
        Log.Message("foundFlag becomes true");
        break;
         
        }
        else{
          aqUtils.Delay(1000);
          Log.Message("setObject called");
          
        }      
           
        counter=counter+1;
        Log.Message("counter: "+counter);        
        Log.Message("foundFlag: "+foundFlag);
        
  } 
  return actionObj1;
}  
  
  
  //##############################################################################################################
//  Function Name      :  clickSpecialKey()
//  Purpose                   :This function is used to work with special keys like CAPS,Shift. 
//  Pre-Condition         : Required edit box should be focused.
//  Created By             : Vinod
//  Date                       :  Oct-24-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function clickSpecialKey(keyButton , strSpecialKey) {
      var shiftfoundFlag = false;
      var oParent = getWindowHandler();
      oParent.Refresh();
      if(keyButton != null) {
            for (ispecialkey = 0; ispecialkey < keyButton.length && shiftfoundFlag == false; ispecialkey++) {
                var actualObjectText = aqObject.GetPropertyValue(keyButton[ispecialkey],"JavaFXObjectText" );
                actualObjectText = actualObjectText.replace(/^\s+|\s+$/g,'');
                if (actualObjectText.toLowerCase() == strSpecialKey.toLowerCase()) {
                     shiftfoundFlag = true;
                     keyButton[ispecialkey].Click(); 
                     Log.Message("Clicked on special Key");
                               
                }
            } 
      }
      else {
        Log.Message(" No Special Key Object Found");        
      }
}

//##############################################################################################################
//  Function Name      :  getCheckBoxState()
//  Purpose                   :This function retun true if check box selected else returns flas. 
//  Pre-Condition         : Object should be available
//  Created By             : Vinod
//  Date                       :  Oct-21-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getCheckBoxState(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {
        oCheckBox = actionObj;
        var state = oCheckBox.selected.value();
        Log.Message("Check box status is : "+oCheckBox.selected.value());        
        resultFlag = true;
        
    }
    else {
       resultFlag = false; 
       Log.Message("Failed to get status of check box as input object is null");            
    }
    return resultFlag+";"+state;
 }
 
 
//##############################################################################################################
//  Function Name      :  getRadioButtonState()
//  Purpose                   :This function retun true if radio button is selected else returns flas. 
//  Pre-Condition         : Object should be available
//  Created By             : Vinod
//  Date                       :  Oct-21-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getRadioButtonState(actionObj) { 
    
    var resultFlag = false;
    var state="";
    
    
    if (actionObj != null) {       
       if (actionObj.selected!=null) {         
           state = actionObj.selected.value();
           if (state == true) {
               resultFlag = true;
               Log.Message("Radio Button status is : "+resultFlag);               
           }
           else {
              resultFlag = true;              
              Log.Message("Radio Button status is : "+resultFlag);            
           }              
       }
       else {
         resultFlag = true; 
         state = false;
         Log.Message("Radio Button status is :"+resultFlag);                         
       }
    }    
    else {
       Log.Message("Failed to get RadioButton State as input object is null");                 
    }
     return resultFlag+";"+state;
    
}


//##############################################################################################################
//  Function Name      :  isRadioButtonSelected()
//  Purpose                   :This function retun true if radio button is selected else returns flas. 
//  Pre-Condition         : Object should be available
//  Created By             : Vinod
//  Date                       :  Oct-21-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function isRadioButtonSelected(actionObj) {     
            
            var resultFlag = false;
            var state="";
            if (actionObj != null) {                         
                  if (actionObj.isSelected()) {   
                        resultFlag = true; 
                        state = true;               
                   }
                   else {
                       resultFlag = true;
                        state = false;              
                          
                   }              
             }
             else {
                      resultFlag = false ;                  
                      Log.Message("Failed to get RadioButton State as input object is null");                               
               }
      
             return resultFlag+";"+state;
    
}

//##############################################################################################################
//  Function Name      :  setRadioButton()
//  Purpose                   :This function sets the radio button on. 
//  Pre-Condition         : Object should be available
//  Created By             : Vinod
//  Date                       :  Oct-22-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function setRadioButton(actionObj) { 
    var resultFlag = false;
    if (actionObj != null) {
        oRadioButton = actionObj;
        oRadioButton.Click();
        Log.Message("Radio button is set");        
        resultFlag = true;
    }
    else {
       
       Log.Message("Failed to set radio button as input object is null");           
    }
    return resultFlag;
}



//##############################################################################################################
//  Function Name      :  setTextVirtulaKeyBoard()
//  Purpose                   :This function write given text in focuced editbox by using virtual keyboard. 
//  Pre-Condition         : Required edit box should be focused.
//  Created By             : Vinod
//  Date                       :  Oct-24-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function setTextByVirtulaKeyBoard(strInputString){
    
    var reqTextLength,actionObj;
    reqTextLength = 0;
    intcaps = 0;
    result = false;
    actionObj = null;
    var shiftSelect = 0;
    if (recordSearchPage == true) {
        actionObj = setObject("virtualKeyBoardNew");
    }
    else {
    actionObj = setObject("virtualKeyBoard");
    }
        
    if (actionObj != null) {
       
        var buttonkey = actionObj.FindAllChildren("JavaClassName","MultiKeyButton", 50);        
        buttonkey = (new VBArray(buttonkey)).toArray();        
        
        if (buttonkey.length > 0) {        
            reqTextLength = strInputString.length;
            Log.Message("reqTextLength: "+reqTextLength);            
            if (strInputString == strInputString.toUpperCase()) {
                clickSpecialKey(buttonkey , "caps");
                intcaps=intcaps+1;                       
            }
            try {            
                  var i = 0;
                   
                   if (recordSearchPage == true) {
                        skeyButton = setObject("virtualKeyBoardNew");
                    }
                    else {
                    skeyButton = setObject("virtualKeyBoard");
                    }
                  
                  //skeyButton = setObject("virtualKeyBoard");
                  var skeyButton = skeyButton.FindAllChildren("JavaClassName","MultiKeyButton", 50);        
                  skeyButton = (new VBArray(skeyButton)).toArray();
                  while (i < strInputString.length) {
                        foundFlag = false;
                        var character = strInputString.substring(i,i+1);
                        i = i+1;
                        Log.Message(character);
                        if (character == " ") {
                            character="Space";
                        }
                        if (intcaps == 0) {
                           if (character == character.toUpperCase()) {
                                clickSpecialKey(buttonkey , "shift");
                                shiftSelect = 1;
                           }
                        }
                       
                        Delay(1);                        
                        if (shiftSelect == 1) {      
                            if (recordSearchPage == true) {
                                  skeyButton = setObject("virtualKeyBoardNew");
                            }
                            else {
                                skeyButton = setObject("virtualKeyBoard");
                            }                   
                          // skeyButton = setObject("virtualKeyBoard");
                           var skeyButton = skeyButton.FindAllChildren("JavaClassName","MultiKeyButton", 50);        
                           skeyButton = (new VBArray(skeyButton)).toArray();
                           for (iKey = 0; iKey < skeyButton.length && foundFlag == false; iKey++) {   
////                                Log.Message("inside loop")
                                var actualText = aqObject.GetPropertyValue(skeyButton[iKey],"JavaFXObjectText" );
                                actualText = actualText.replace(/^\s+|\s+$/g,'');
                                if (actualText.toLowerCase() == character.toLowerCase()) { 
                                    foundFlag = true;
                                    skeyButton[iKey].Click();
                                    Log.Message("Virtual key " + character + " has been clicked");
                                }    
                           } 
                        }  
                        else {
                          for (iKey = 0; iKey < skeyButton.length && foundFlag == false; iKey++) {   
                               var actualText = aqObject.GetPropertyValue(skeyButton[iKey],"JavaFXObjectText" );
                               actualText = actualText.replace(/^\s+|\s+$/g,'');
                               if (actualText.toLowerCase() == character.toLowerCase()) { 
                                   foundFlag = true;
                                   skeyButton[iKey].Click();
                                   Log.Message("Virtual key " + character + " has been clicked");
                               }    
                          }
                      
                      }     
                      
                                                                                                   
                  }
                   result = true;
                  if (intcaps != 0) {
                      clickSpecialKey(skeyButton , "caps");              
                  }              
                  if (shiftSelect ==1) {
                      shiftSelect = 0;
                  }                  
            }
            catch(exception) {  
              Log.Message("Error occured during the click on virtual keys");              
           }        
        }
        else {
          Log.Message("Virtaul Key list not found");          
        } 
    }
    else {
       Log.Message("Virtaul Key board not found");      
    }
    return result;
}


//##############################################################################################################
//  Function Name      :  getTestResults()
//  Purpose                   :This function used to get all the values from grid 
//  Pre-Condition         : Object should be available
//  Created By             : Vinod
//  Date                       :  Oct-24-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function getTestResults(){
    
    var reqTextLength,actionObj;
    reqTextLength = 0;
    actionObj = null;
    actionObj = setObject("grdRecordsTestResults4Dx");   
    
    if (actionObj != null) {
       
        var grid = actionObj.FindAllChildren("JavaClassName","FawkesGridPane", 50);        
        grid = (new VBArray(grid)).toArray();        
        if (grid.length > 0) {                
            Log.Message(grid[0].ChildCount); 
            Log.Message(grid[0].FullName);
            gridObject = grid[0];
            var gridChildLabels = gridObject.FindAllChildren("JavaClassName","FawkesLabel", 50);
            gridChildLabels = (new VBArray(gridChildLabels)).toArray();
            for (j = 0; j < gridObject.ChildCount-1; j++){
                Log.Message("j: " +j );                
                Log.Message(gridChildLabels[j].JavaFXObjectText);
                Log.Message(gridChildLabels[j].JavaFXObjectIndex);
            }
            
        }
        else {
          Log.Message("Grid object is not found");          
        } 
    }
    else
    {
       Log.Message("Grid object is not found");       
    }
}



//##############################################################################################################
//  Function Name      :  SelectTab()
//  Purpose                   :This function will select required tab
//  Pre-Condition         : Object should be available
//  Created By             : Vinod
//  Date                       :  Oct-24-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function selectTab(oLogicalName , strTabName){
    
    var actionObj = null;
    actionObj = setObject(oLogicalName);
    actionflag = false;
    if (actionObj != null) {
       
        var oTab = actionObj.FindAllChildren("JavaClassName", "Label", 50);        
        oTab = (new VBArray(oTab)).toArray();
        if (oTab.length > 0) {                
            
            for (iTab = 0; iTab < oTab.length && actionflag == false; iTab++) {                
                  var actualTabObject = aqObject.GetPropertyValue(oTab[iTab], "JavaFXObjectText");
                  actualTabObject = actualTabObject.replace(/^\s+|\s+$/g,'');
                  strTabName = strTabName.replace(/^\s+|\s+$/g,'');
                  if (actualTabObject.length > 0) {                    
                      if (actualTabObject.toLowerCase() == strTabName.toLowerCase()) {
                          oTab[iTab].Click();
                          actionflag = true;
                          Log.Message("Sucessfully Clicked on "+strTabName +"  Tab Object");
                      }   
                  }
            }
        }
        else {
          Log.Message("Unable to found "+strTabName +"  Tab object");
        } 
    }
    else {
       Log.Message("Unable to found Tab Object, Failed to Set Tab Object");       
    }
}


//##############################################################################################################
//  Function Name      :  homeNavigation()
//  Purpose                   :This function will click on home button from any page.
//  Pre-Condition         : Object should be available
//  Created By             : Ramesh
//  Date                       :  Oct-28-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function homeNavigation(windowName, indexValue, oLogicalName) {
   
   var oParent = getWindowHandler();
   var oHome = getORObjectName(oLogicalName);
   var oHomeButton = oParent.JavaFXObject("Stage", "").JavaFXObject("FawkesScene", "").JavaFXObject("view").JavaFXObject("mainFrame").JavaFXObject("NavigationBar", "").JavaFXObject("FawkesHBox", "").JavaFXObject(oHome).JavaFXObject(oHome);

   if (oHomeButton != null) {
       oHomeButton.Click();
       Log.Message("Sucessfully Clicked on Home button to navigate  Main Home Window");        
   }
   else {
     Log.Message("Failed to Click on Home button to navigate  Main Home Window");     
   }
}

//##############################################################################################################
//  Function Name      :  selectCheckBox()
//  Purpose                   :This function select the checkbox to on. 
//  Pre-Condition         : Object should be available
//  Created By             : Vinod
//  Date                       :  Oct-21-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################



function selectCheckBox(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {       
       oCheckBox = actionObj;
       var statusList = getCheckBoxState(oCheckBox);
       Log.Message("status: "+ statusList);
       textValues=statusList.split(";");
       objExists=aqString.ToLower(textValues[0]);
       status=aqString.ToLower(textValues[1]);
       if (objExists == "true") {
       
           if (status == "false") {
               oCheckBox.Click();       
               Log.Message("Sucessfully selected check box");               
               resultFlag = true;
           }
           else {
              resultFlag = true;
              Log.Message("check box is already selected");              
           }
        }
        
        else {
           Log.Message("Object does not exist");       
        }
      }  
    else {
       Log.Message("Failed to click on check box as input object is null");       
       resultFlag = false;
    }
    return resultFlag;
}


 
//##############################################################################################################
//  Function Name      :  unSelectCheckBox()
//  Purpose                   :This function unselect the chcekbox
//  Pre-Condition         : N/A
//  Created By             : Vinod
//  Date                       :  Oct-21-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function unSelectCheckBox(actionObj) { 
    
    var resultFlag = false;
    if (actionObj != null) {       
       oCheckBox = actionObj;
       var statusList = getCheckBoxState(oCheckBox);
       Log.Message("status: "+ statusList);
       textValues=statusList.split(";");
       objExists=aqString.ToLower(textValues[0]);
       status=aqString.ToLower(textValues[1]);
       if (objExists == "true") {
       
           if (status == "true") {
               oCheckBox.Click();       
               Log.Message("Sucessfully unselected the check box");               
               resultFlag = true;
           }
           else {
              resultFlag = true;
              Log.Message("check box is already unselected");              
           }
    }
    else {
       Log.Message("Object does not exist");
    }
  }   
    else {
       Log.Message("Failed to click on check box as input object is null");       
       resultFlag = false;
    }
    return resultFlag;
}




//##############################################################################################################
//  Function Name      :  verifyCheckBoxState()
//  Purpose                   :This function compares checkbox state with expected.   
//  Pre-Condition         : getWindowTitle() function should be available.
//  Created By             : Murali LM Rao
//  Date                       :  Oct-09-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function verifyCheckBoxState(actionObj,strExpectedState) {

  var foundFlag =false;
  var resultFlag = false;
  
  if (actionObj != null) {  
     
     var getTextValues,textValues,textToVerify;    
     Sys.HighlightObject(actionObj,5,clBlue);
     getStatus = getCheckBoxState(actionObj);      
     
     textValues = getStatus.split(";");     
     objStatus = textValues[0];
     statusToVerify = textValues[1];
     
     objStatus = objStatus.toLowerCase();     
     statusToVerify = statusToVerify.toLowerCase();
     strExpectedState = strExpectedState.toLowerCase();
     
     Log.message("objStatus is: " + objStatus);
     Log.message("statusToVerify is: " + statusToVerify);
      
      if (objStatus == "true") {      
        if (aqString.Trim(statusToVerify) == aqString.Trim(strExpectedState)) {
            Log.Message("ActulaState: "+statusToVerify);               
            Log.Message("ExpectedState: "+strExpectedState);
            Log.Message("Status comparison is successful");                                  
            return true;
        } 
        else {  
          Log.Message("ActulaState: "+statusToVerify);               
          Log.Message("ExpectedState: "+strExpectedState);             
          Log.Message("Status comparison is failed while verificatying ");                     
          return false; 
        }      
     }      
     else {
       return "CheckBox Object is null";       
      }     
  }
}

//##############################################################################################################
//  Function Name      :  verifyRadioButtonState()
//  Purpose                   :This function compares Radio Button state with expected.   
//  Pre-Condition         : getRadioButtonState() function should be available.
//  Created By             : Vinod
//  Date                       :  Oct-23-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function verifyRadioButtonState(actionObj,strExpectedState) {

  var foundFlag =false;
  var resultFlag = false;
  
  if (actionObj != null) {  
     
      var textToVerify,getTextValues,textValues;    
      getTextValues = getRadioButtonState(actionObj);      
      textValues = getTextValues.split(";");     
      
      objStatus = textValues[0];
      statusToVerify = textValues[1];
      
      objStatus = objStatus.toLowerCase();
      statusToVerify = statusToVerify.toLowerCase();
      strExpectedState = strExpectedState.toLowerCase();
      
      Log.message("objStatus is: " + objStatus);
      Log.message("statusToVerify is: " + statusToVerify);
      
      if (objStatus == "true") {      
        if (aqString.Trim(statusToVerify) == aqString.Trim(strExpectedState)) {
           Log.Message("ActulaState: "+statusToVerify);               
           Log.Message("ExpectedState: "+strExpectedState);           
           Log.Message("Status comparison is successful");                                    
           return true;
        } 
        else {    
          Log.Message("ActulaState: "+statusToVerify);               
          Log.Message("ExpectedState: "+strExpectedState);  
          Log.Message("Status comparison is failed while verificatying ");                               
          return false; 
        }     
      }      
      else {
       return "RadioButton Object is null";       
      }     
  }
}
         
//##############################################################################################################
//  Function Name      :  verifyWindowTitle()
//  Purpose                   :This function compares Title for a given window on AUT.   
//  Pre-Condition         : getWindowTitle() function should be available.
//  Created By             : Murali LM Rao
//  Date                       :  Oct-09-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function verifyWindowTitle(actionObj,expectedTitle) {

  var foundFlag =false;
  var resultFlag = false;
  aqUtils.Delay(timeDelay1)
 
  if (actionObj != null) {
   
      var textToVerify,getTextValues,textValues;    
      getTextValues=getWindowTitle(actionObj);
      textValues=getTextValues.split(";");
      Log.message("Lable to verify is: " + textValues[1]);
      objStatus=textValues[0];
      valueToVerify=textValues[1];
     valueToVerify = valueToVerify.replace(/^\s+|\s+$/g,'');
      if (objStatus == "true") {      
        
          if (valueToVerify.toLowerCase()  == expectedTitle.toLowerCase()) {
              Log.Message("ActulaTitle: "+valueToVerify);               
              Log.Message("ExpectedTitle: "+expectedTitle);                          
              return true;
          } 
          else {
             Log.Message("ActulaTitle:"+valueToVerify);               
             Log.Message("ExpectedTitle:"+expectedTitle);                                 
             return false; 
          }      
      }            
      else {
        return "Window Not Found.";        
      }      
         
   }
}


//##############################################################################################################
//  Function Name      :  verifyLable()
//  Purpose                   :This function compares Lable for a given control on AUT.   
//  Pre-Condition         : getLable() function should be available.
//  Created By             : Murali LM Rao
//  Date                       :  Oct-09-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function verifyLable(actionObj,expectedLable) {

  var foundFlag =false;
  var resultFlag = false;
  aqUtils.Delay(timeDelay1)

  if (actionObj != null) {
      Sys.HighlightObject(actionObj,2,clBlue);
      var textToVerify,getTextValues,textValues;    
      getTextValues=getLable(actionObj);
      textValues=getTextValues.split(";");
      Log.message("Lable to verify is: " + textValues[1]);
      objStatus=textValues[0];
      valueToVerify=textValues[1];
      valueToVerify = valueToVerify.replace(/^\s+|\s+$/g,'');
      if (objStatus == "true") {      
        
          if (valueToVerify.toLowerCase() == expectedLable.toLowerCase()) {
              Log.Message("ActulaLabel: "+valueToVerify);               
              Log.Message("ExpectedLabel: "+expectedLable);                        
              return true;
          } 
          else {
              Log.Message("ActulaLabel: "+valueToVerify);               
              Log.Message("ExpectedLabel: "+expectedLable);                  
              return false;
          }      
      }      
      
      else {
        return "Object Not Found.";
      }     
         
  }
}

//##############################################################################################################
//  Function Name      :  VerifyText()
//  Purpose                   :This function compares the text from the given control with the given text. 
//  Pre-Condition         : getText() function should be available.
//  Created By             : Murali LM Rao
//  Date                       :  Oct-08-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function verifyText(actionObj, expectedText) {

  try {
    expectedText=expectedText.toString();
    var foundFlag =false;
    var resultFlag = false;
    var textToVerify,getTextValues,textValues;
    aqUtils.Delay(timeDelay1)
  
    if (actionObj != null) {
    Sys.HighlightObject(actionObj,5,clBlue);  
           
    try{
        getTextValues=getText(actionObj);
        textValues=getTextValues.split(";");
        Log.message("Text to verify is: " + textValues[1]);
        txtExists=textValues[0];
        textToVerify=textValues[1];
    } catch(error2) {
        Log.Message("Error occured in getText call, Split action block" + error2);
        logResult("Fail","Error occured in getText call, Split action block" + error2);
    }
       textToVerify = textToVerify.replace(/^\s+|\s+$/g,'');
       if (txtExists == "true") {      
        
        if (textToVerify.toLowerCase() == expectedText.toLowerCase()) {             
             return true;
            } 
        else{                   
              return false;
            }      
        }      
      
    else {
        return "Text Not Found.";
    }     
         
 }
}
catch(error) {
      Log.Message("Function level Error occured in the function verifyText " + error)
      logResult("Fail","Function level Error occured in the function verifyText")
 }
}

//##############################################################################################################
//  Function Name      :  VerifyTextAndCase()
//  Purpose                   :This function compares the text along with  verifying uppper or small from the given control with the given text 
//  Pre-Condition         : getText() function should be available.
//  Created By             : Murali LM Rao
//  Date                       :  Oct-08-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function VerifyTextAndCase(actionObj, expectedText) {

  try {
    expectedText=expectedText.toString();
    var foundFlag =false;
    var resultFlag = false;
    var textToVerify,getTextValues,textValues;
    aqUtils.Delay(timeDelay1)
  
    if (actionObj != null) {
    Sys.HighlightObject(actionObj,5,clBlue);  
           
    try{
        getTextValues=getText(actionObj);
        textValues=getTextValues.split(";");
        Log.message("Text to verify is: " + textValues[1]);
        txtExists=textValues[0];
        textToVerify=textValues[1];
    } catch(error2) {
        Log.Message("Error occured in getText call, Split action block" + error2);
        logResult("Fail","Error occured in getText call, Split action block" + error2);
    }
       textToVerify = textToVerify.replace(/^\s+|\s+$/g,'');
       if (txtExists == "true") {      
        
        if (textToVerify == expectedText) {             
             return true;
            } 
        else{                   
              return false;
            }      
        }      
      
    else {
        return "Text Not Found.";
    }     
         
 }
}
catch(error) {
      Log.Message("Function level Error occured in the function VerifyTextAndCase " + error)
      logResult("Fail","Function level Error occured in the function VerifyTextAndCase")
 }
}




//##############################################################################################################
//  Function Name      :  getGridCellData()
//  Purpose                   :This function will retun value by specifying TestName and columnName in Test Results window
//  Pre-Condition         : Object should be available
//  Created By             : Ramesh
//  Date                       :  Oct-24-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function getGridCellData(oLogicalName, strTestName , strColumnName,grdIndex) {
    
    var actionObj = null;
    actionObj = setUserDefinedObject(oLogicalName,grdIndex);
    actionflag = false
    getdata = "";
    objFound=false
   strTestName = strTestName.replace(/^\s+|\s+$/g,'');
    strColumnName = strColumnName.replace(/^\s+|\s+$/g,'');
////    strTestName = strTestName;
////    strColumnName = strColumnName;
    if (actionObj != null) {       
        var oGridCell = actionObj.FindAllChildren("JavaClassName","LabelSkin", 50);        
        oGridCell = (new VBArray(oGridCell)).toArray();
        
      //  var oGridCell1 = actionObj.FindAllChildren("JavaClassName","FawkesHelpAwareLabel", 50);        
      //  oGridCell1 = (new VBArray(oGridCell1)).toArray();
        
        
        if (oGridCell.length > 0) {                            
            for (iCell = 0; iCell < oGridCell.length && actionflag == false; iCell++){                
                 var strCellData= aqObject.GetPropertyValue(oGridCell[iCell].parent,"JavaFXObjectText" );
                strCellData = strCellData.replace(/^\s+|\s+$/g,'');
                strCellData = strCellData.replace(/(\r\n|\n|\r)/gm,""); 
                strTestName = strTestName.replace(/(\r\n|\n|\r)/gm,"");   
  //              Log.Message(iCell +" *****************  strCellData      :"+strCellData)
////                  strCellData = strCellData;
                 CellCount = strCellData.length
                 if (strCellData.length > 0) {
                   if(strCellData.toLowerCase() == strTestName.toLowerCase()) {
////                    if(strCellData== strTestName) {
                       var cellIndex = aqObject.GetPropertyValue(oGridCell[iCell],"JavaFXObjectIndex" );
                     switch (strColumnName.toLowerCase()) {
////                       switch (strColumnName) {   
////                          case ("results||????"): if (iCell-1 >= 0) {
                              case "results": if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;
                                   case "????": if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;                      
                                                         
                                case "sonuclar"            : if (iCell-1 >= 0) {
                            
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;
                                                              
                             case "resultats"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;  
                              case "検査結果"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;                                 
                             case "vysledky"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break; 
                          case "risultati"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break; 
                                                         
                                    case "resultados"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;   
                          case "resultado"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;  
                        case "????"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;   
                             case "ergebnis"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;   
                             case "??????????"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;  
                          case "??"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;    
                          case "????"   : if (iCell-1 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-1].parent,"JavaFXObjectText" );
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                         break;                                            
                             case "referenceinterval"  : if (iCell-2 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-2].parent,"JavaFXObjectText" );   
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
//                                                         else {
//                                                              getdata = "";
//                                                         }
                                                         break;
                      case "基準値"  : if (iCell-2 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-2].parent,"JavaFXObjectText" );   
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
//                                                         else {
//                                                              getdata = "";
//                                                         }
                                                         break;                        
                                                            
                              case "low"               : if (iCell-3 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-3].parent,"JavaFXObjectText" );   
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                           getdata = "";
                                                         }
                                                          break;
                                                            
                              case "normal"            : if (iCell-4 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-4].parent,"JavaFXObjectText" );   
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                              getdata = "";
                                                         }
                                                         break;
                                                            
                              case "high"              : if (iCell-5 >= 0) {
                                                             var cellData = aqObject.GetPropertyValue(oGridCell[iCell-5].parent,"JavaFXObjectText" );   
                                                             actionflag = true;
                                                             getdata = cellData;
                                                         } 
                                                         else {
                                                              getdata = "";
                                                         }
                                                         break;
                                                         
                              default                  : getdata = ""; 
                                                         Log.Message("No such column heading available");
                                                         break;
                       }
                    }//if                          
                 }
                }//for
        }
        else {
          Log.Message("No Grid available  "+oLogicalName +"  on Main Window");          
        }  
  }
  else {
    Log.Message("Unable to found "+oLogicalName +"  Grid on Main Window");    
  } 
  return actionflag+";"+getdata;
}     
//##############################################################################################################
//  Function Name      :  patientSearch()
//  Purpose                   :This function will retun true if given searchKey found in search patient table.
//  Pre-Condition         : Patient search table should be displayed on screen.
//  Created By             : Vinod
//  Date                       :  Nov-06-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################



function patientSearch() {
   
    var container,patientFound;
    //searchKey = "ST1105130559 (Canine)";
    //searchKey = "QualicheckH2 (Unknown)";
    patientFound = "false";
    noRowfound = "false";
    
    try{
        oLogicalName = "tblPatientSearch";
        actionObj = setObject(oLogicalName);
    
        container = actionObj.FindAllChildren("JavaClassName","VirtualFlow$ClippedContainer", 10);
        container = (new VBArray(container)).toArray();
    
        rows = container[0].FindAllChildren("JavaClassName","TableRow", 3);
        rows = (new VBArray(rows)).toArray();
        Log.Message(rows.length);
    
        for (i=0;i<rows.length;i++){
             
            //rows[i].Click();  
            var cells = rows[i].FindAllChildren("JavaClassName","IdentifyPatientScreenController$3$1", 50);
            cells = (new VBArray(cells)).toArray();   
            Log.Message(cells[0].JavaFXObjectText);
            actPatientValue= cells[0].JavaFXObjectText;
            actPatientValue = actPatientValue.replace(/^\s+|\s+$/g,'');
            
            //to handle table with no values
            if (actPatientValue != ""){
              noRowfound = "true";
            }
            
            if (actPatientValue == searchKey){
              patientFound = "true";
              Log.Message("patientFound");
              BuiltIn.ShowMessage("patientFound");
              break;
            }
        
        }
        if (noRowfound == "true"){
            rows[0].Click();
            actionObj.Keys("[Down]");
            oLogicalName = "tblPatientSearch";
            actionObj = setObject(oLogicalName);
    
            container = actionObj.FindAllChildren("JavaClassName","VirtualFlow$ClippedContainer", 10);
            container = (new VBArray(container)).toArray();
            rows = container[0].FindAllChildren("JavaClassName","TableRow", 3);
            rows = (new VBArray(rows)).toArray();
            Log.Message(rows.length );
    
            if ((rows.length > 6) && (patientFound == "false")) {
    
                oLogicalName = "scrPatientSearch";
                scrollObj = setObject(oLogicalName);

                if (scrollObj.Exists) {
                   scrollTop = scrollObj.Top
                   scrollTop=aqConvert.StrToInt(scrollTop);
                   while ((scrollTop < 277 )&& (patientFound =="false")) {
                       scrollTop = scrollObj.Top
                       scrollTop=aqConvert.StrToInt(scrollTop);
             
                       var oParent = getWindowHandler();
                       oParent.Refresh();
             
                       oLogicalName = "tblPatientSearch";
                       actionObj = setObject(oLogicalName);
                       actionObj.Keys("[Down][Down][Down][Down][Down][Down]");
         
                       container = actionObj.FindAllChildren("JavaClassName","VirtualFlow$ClippedContainer", 10);
                       container = (new VBArray(container)).toArray();
                       rows = container[0].FindAllChildren("JavaClassName","TableRow", 3);
                       rows = (new VBArray(rows)).toArray();
             
                       for (i=0;i<rows.length;i++) {
                             
                          var cells = rows[i].FindAllChildren("JavaClassName","IdentifyPatientScreenController$3$1", 50);
                          cells = (new VBArray(cells)).toArray();   
                          Log.Message(cells[0].JavaFXObjectText);
                          actPatientValue= cells[0].JavaFXObjectText;
                          actPatientValue = actPatientValue.replace(/^\s+|\s+$/g,'');
                          if (actPatientValue == searchKey){
                              patientFound = "true";
                              Log.Message("patientFound");
                              BuiltIn.ShowMessage("patientFound");
                              break;
                          }
                       }
           
                   } //While  
                                   
                }//if
                
            }//if
    
        }
        
     } catch(exception) {
        Log.Message("Error occured while patient searching");
        logResult("Fail","Error occured while patient searching");
    }
    if (patientFound == "false") {
        Log.Message("patient not Found");
        BuiltIn.ShowMessage("patient not Found");                    
    }      
    return patientFound;      
}


//##############################################################################################################
//  Function Name      :  verifyObject()
//  Purpose               : This function verify  the button object
//  Pre-Condition         : N/A
//  Created By             : Venu Gorantla
//  Date                  : Nov-07-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function verifyObject(actionObj) { 
    var resultFlag = false;
    if (actionObj != null) {
          resultFlag = true;
    }
    else {      
      resultFlag = false;      
    }
    return resultFlag;
}

//##############################################################################################################
//  Function Name      :  navigateWindow()
//  Purpose                   :This function will used to navigate to window by clicking on button and verifying the window title
//  Pre-Condition         : 
//  Created By             : Vinod
//  Date                       :  Nov-10-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################


function navigateWindow(buttonLogicalName, expectedWindowTitleLogicalName, expectedWindowTitle) {

    var actionflag,buttonState,buttonClick,actualWindowTitle;
    actionflag = false;
    buttonLogicalNamearr=buttonLogicalName.split("~")
    if (buttonLogicalNamearr.length >=2)
    {
    actionObj = setObject(buttonLogicalNamearr[0],"",buttonLogicalNamearr[1]);
    }
    else
    {
    actionObj = setObject(buttonLogicalName);
    }
    
    if (actionObj != null){
        
        stateValues = getState(actionObj, "enabled");                
        stateValues = stateValues.split(";");
        Log.message("State to verify is: " + stateValues[1]);
        resultFlag = stateValues[0];
        actualObjectState = stateValues[1];      
       actualObjectState = actualObjectState.replace(/^\s+|\s+$/g,'');
                
        if (actualObjectState == "true") {
            buttonClick = click(actionObj);
            aqUtils.Delay(2000);
            if (buttonClick == true) {                
                windowObj = setObject(expectedWindowTitleLogicalName);
                if (windowObj != null) {
                    windowTitleValidation = verifyWindowTitle(windowObj,expectedWindowTitle);
                                                                                                            
                    if (windowTitleValidation == true) {
                        actionflag = true;
                        Log.Message("Navigated to " + expectedWindowTitle);
                        Log.Message("Window Title verification is successful");
                        logResult("Pass-","Navigated to " + expectedWindowTitle + " Window",1 );
                        logResult("Pass-","Window Title verification is successful",1 );
                    }
                    else {
                      actionflag = false;
                      logResult("Fail-","Unable to navigated to " + expectedWindowTitle + " Window",1 );
                      logResult("Fail-",expectedWindowTitle+" Window Title verification is unsuccessful",1 );
                    }                    
                }
                else {
                  Log.Message("ExpectedWindow object is not found");
                  logResult("Fail-","ExpectedWindow " +expectedWindowTitle+ " object is not found",1);     
                }                                                                                    
            }
            else {
              Log.Message("Unable to click as button state is disabled");  
              logResult("Fail-","Unable to click as " + buttonLogicalName+ " state is disabled",1);          
            }                    
        }
        else {
          Log.Message("Unable to click as button state is disabled")
          logResult("Fail-","Unable to click as " + buttonLogicalName+ " state is disabled",1);        
        }                
    }
    else {
      Log.Message("Button object is null");  
      logResult("Fail-",buttonLogicalName + " Button object is null",1);  
    }
   return actionflag; 
}


//##############################################################################################################
//  Function Name      :  verifyState()
//  Purpose                   :This function compares object state with expected value and returns true or false   
//  Pre-Condition         : getState() function should be available.
//  Created By             : Vinod
//  Date                       :  Nov-08-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function verifyState(actionObj,expectedState,expectedStateValue) {

  var foundFlag =false;
  var resultFlag = false;
  aqUtils.Delay(timeDelay1)

  if (actionObj != null) {
      
      Sys.HighlightObject(actionObj,2,clBlue);
      var textToVerify,getTextValues,textValues;    
      getStateValues = getState(actionObj,expectedState);
      stateValues = getStateValues.split(";");
      Log.message("State to verify is: " + stateValues[1]);
      resultFlag = stateValues[0];
      actualObjectState = stateValues[1];      
      actualObjectState = actualObjectState.replace(/^\s+|\s+$/g,'');
      if (resultFlag == "true") {      
        
          if (actualObjectState.toLowerCase() == expectedStateValue.toLowerCase()) {
               Log.Message("ActulaState: "+actualObjectState);               
               Log.Message("ExpectedState: "+expectedStateValue);                          
              return true;
          } 
          else {   
              Log.Message("ActulaState: "+actualObjectState);               
              Log.Message("ExpectedState: "+expectedStateValue);                    
              return false;
          }      
      }      
      
      else {
        return "Object Not Found";
      }     
         
  }
}


//##############################################################################################################
//  Function Name      :  verifySelectedIndex()
//  Purpose             : This function compares index for select box
//  Pre-Condition         : selectedIndex() function should be available.
//  Created By             : Vinod
//  Date                       :  Nov-08-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function verifySelectedIndex(actionObj,expectedIndexValue) {

  var foundFlag =false;
  var resultFlag = false;
  aqUtils.Delay(timeDelay1)

  if (actionObj != null) {
   
      var getselectedIndex,selectedValues,selectedIndex;    
      getIndex= getSelectedIndex(actionObj)
      selectedValues = getIndex.split(";");
      Log.message("Index to verify is: " + selectedValues[1]);
      resultFlag = selectedValues[0];
      selectedIndex = selectedValues[1];      
       if (resultFlag == "true") {      
        
          if (parseInt(selectedIndex)== parseInt(expectedIndexValue)) {          
              return true;
          } 
          else {      
              return false;
          }      
      }      
      else {
                    return "Object Not Found";
          }     
      }     
}


//##############################################################################################################
//  Function Name      :  clearTextByClearButton()
//  Purpose                    : This function is used to delete the text in text boxes
//  Pre-Condition         : selectedIndex() function should be available.
//  Created By              : Vinod
//  Date                           : Nov-20-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################

function clearTextByClearButton(actionObj) {
        
        var objectList, resultFlag;
        resultFlag = false;     
       
        if (actionObj != null) {                            
            objectList = actionObj.FindAllChildren("JavaClassName","ButtonSkin",20);
            objectList = (new VBArray(objectList)).toArray();
            if (objectList.length >0) {   
                if (objectList[0].VisibleOnScreen == true) {  
                    objectList[0].Click();
                    resultFlag = true;
                    Log.Message("Successfully clicked on Cancel button in Text Box");  
                    logResult("Pass-","Successfully clicked on Cancel button in Text box",1);
                }
                else {
                    Log.Message("Cancel button does not exists on screen");  
                    logResult("Fail-","Cancel button is does not exists on screen",1);
                    resultFlag = false;                 
                }    
            } 
            else {
              Log.Message("Object does not contain ButtonSkin class objects");  
              logResult("Fail-","Object does not contain ButtonSkin class objects",1);
              resultFlag = false;  
            }   
        }
        else {
          Log.Message("Object is null");  
          logResult("Fail-","Object is null",1); 
          resultFlag = false; 
        }
        
        return resultFlag;
                    
} 


//##############################################################################################################
//  Function Name      :  setDate()
//  Purpose                    : This function is used to delete the text in text boxes
//  Pre-Condition         : N/A
//  Created By              : Vijay
//  Date                           : Nov-20-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function setDate(actionObj, strInput) { 
    
    var resultFlag = false;
    if (actionObj != null) {
       oTextBox = actionObj;
       oTextBox.SetText(strInput);
       Log.Message("Sucessfully set text "+ strInput +" on text box");       
       resultFlag = true;
    }
    else {
       Log.Message("Failed to Set Text as input object is null");       
       resultFlag = false;
    }
    return resultFlag;
}





//##############################################################################################################
//  Function Name      :  setTextVirtulaKeyBoard()
//  Purpose                   :This function write given text in focuced editbox by using virtual keyboard. 
//  Pre-Condition         : Required edit box should be focused.
//  Created By             : Vinod
//  Date                       :  Oct-24-2013
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function setTextByVirtulaKeyBoardNew(strInputString){
    
    var reqTextLength,actionObj;
    reqTextLength = 0;
    intcaps = 0;
    result = false;
    actionObj = null;
    var shiftSelect = 0;
    actionObj = setObject("virtualKeyBoardNew");
        
    if (actionObj != null) {
       
        var buttonkey = actionObj.FindAllChildren("JavaClassName","MultiKeyButton", 50);        
        buttonkey = (new VBArray(buttonkey)).toArray();        
        
        if (buttonkey.length > 0) {        
            reqTextLength = strInputString.length;
            Log.Message("reqTextLength: "+reqTextLength);            
            if (strInputString == strInputString.toUpperCase()) {
                clickSpecialKey(buttonkey , "caps");
                intcaps=intcaps+1;                       
            }
            try {            
                  var i = 0;
                  skeyButton = setObject("virtualKeyBoard");
                  var skeyButton = skeyButton.FindAllChildren("JavaClassName","MultiKeyButton", 50);        
                  skeyButton = (new VBArray(skeyButton)).toArray();
                  while (i < strInputString.length) {
                        foundFlag = false;
                        var character = strInputString.substring(i,i+1);
                        i = i+1;
                        Log.Message(character);
                        if (character == " ") {
                            character="Space";
                        }
                        if (intcaps == 0) {
                           if (character == character.toUpperCase()) {
                                clickSpecialKey(buttonkey , "shift");
                                shiftSelect = 1;
                           }
                        }
                       
                        Delay(1);                        
                        if (shiftSelect == 1) {                           
                           skeyButton = setObject("virtualKeyBoard");
                           var skeyButton = skeyButton.FindAllChildren("JavaClassName","MultiKeyButton", 50);        
                           skeyButton = (new VBArray(skeyButton)).toArray();
                           for (iKey = 0; iKey < skeyButton.length && foundFlag == false; iKey++) {   
                                Log.Message("inside loop")
                                var actualText = aqObject.GetPropertyValue(skeyButton[iKey],"JavaFXObjectText" );
                                actualText = actualText.replace(/^\s+|\s+$/g,'');
                                if (actualText.toLowerCase() == character.toLowerCase()) { 
                                    foundFlag = true;
                                    skeyButton[iKey].Click();
                                    Log.Message("Virtual key " + character + " has been clicked");
                                }    
                           } 
                        }  
                        else {
                          for (iKey = 0; iKey < skeyButton.length && foundFlag == false; iKey++) {   
                               var actualText = aqObject.GetPropertyValue(skeyButton[iKey],"JavaFXObjectText" );
                               actualText = actualText.replace(/^\s+|\s+$/g,'');
                               if (actualText.toLowerCase() == character.toLowerCase()) { 
                                   foundFlag = true;
                                   skeyButton[iKey].Click();
                                   Log.Message("Virtual key " + character + " has been clicked");
                               }    
                          }
                      
                      }     
                      
                                                                                                   
                  }
                   result = true;
                  if (intcaps != 0) {
                      clickSpecialKey(skeyButton , "caps");              
                  }              
                  if (shiftSelect ==1) {
                      shiftSelect = 0;
                  }                  
            }
            catch(exception) {  
              Log.Message("Error occured during the click on virtual keys");              
           }        
        }
        else {
          Log.Message("Virtaul Key list not found");          
        } 
    }
    else {
       Log.Message("Virtaul Key board not found");      
    }
    return result;
}

function buttonKey ()
{
     // virtual keyboard object creation   
      actionObject = setObject("virtualKeyBoard");
      var buttonKeys = actionObject.FindAllChildren("JavaClassName","MultiKeyButton", 50);        
      buttonKeys = (new VBArray(buttonKeys)).toArray();
      return buttonKeys;
}


//##############################################################################################################
//  Function Name      :  waitForObject()
//  Purpose                   :This function pause the script execution until the specified object
//                      exists or until the specified timeout elapses. 
//  Pre-Condition         : N/A
//  Created By             : Vijay
//  Date                       :  Sep-12-2014
//  Reviewed By         :   
//  Reviewed On         : 
// ###############################################################################################################
function waitForObject(strOutPutValue) { 
     strOutputParam = strOutPutValue.split(",");
     oLogicalName=strOutputParam[0];

  var foundFlag = false;
  var counter=0;
  var timeOutCounter=0;  
  timeOutCounter=60;
    Log.Message("timeOutCounter: "+ timeOutCounter);        
     oParentLogicalName="parent"+oLogicalName;
     oChildLogicalName=oLogicalName;    
     for (var starter=0;starter<=timeOutCounter;starter++){
         var actionObj1=setCustomObject(oParentLogicalName,oChildLogicalName);  
       if ((actionObj1.Exists)||(timeOutCounter == counter)){
        foundFlag=true;
        Log.Message("foundFlag becomes true");
        break;
         
        }
        else{
          aqUtils.Delay(6000);
          Log.Message("setObject called");
          
        }      
           
        counter=counter+1;
        Log.Message("counter: "+counter);        
        Log.Message("foundFlag: "+foundFlag);
        
  } 
}  

