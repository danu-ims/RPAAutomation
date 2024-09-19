*** Settings ***
Library     RPA.Excel.Files
Library     SeleniumLibrary
Library     OperatingSystem
Resource    resources/Base/Login.robot
Resource    ../../resources/Base/OpenCard.robot
Resource    ../../resources/Base/OpenSidebar.robot
Resource    ../../Resources/Base/InsertDataToExcel.robot

*** Variables ***
${ORIGINAL_EXCEL_FILE}    E:/Project/Learn/project3/files/fileocr/excel/SysGeneralSubCode.xlsx
${WORKING_EXCEL_FILE}     E:/Project/Learn/project3/files/fileocr/excel/SysGeneralSubCode.xlsx
${TIMEOUT}                30s

@{DATA}
...    ${1}    A55123    Example Item 1    ${10}    ${1}
...    ${2}    DXF456    Example Item 2    ${20}    ${1}
...    ${3}    GHG789    Example Item 3    ${30}    ${-1}
...    ${4}    JKS012    Example Item 4    ${40}    ${1}
...    ${5}    MXO345    Example Item 5    ${50}    ${-1}
...    ${6}    MFO345    Example Item 5    ${50}    ${-1}
...    ${7}    MHO345    Example Item 5    ${50}    ${-1}

*** Test Cases ***
Complete IFINBASE Workflow
    [Setup]    Set Selenium Speed    0.2 seconds
    # Login To IFINBASE
    # Navigate To General Settings
    # Add New General Code
    Download And Prepare Excel
    # Upload Excel File

*** Keywords ***
Login To IFINBASE
    Valid User Can Login    Danu    Danu
    Open Card    Base

Navigate To General Settings
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General

Add New General Code
    Wait And Click    //button[.//span[contains(text(), "Add")]]
    Input Text    Code    AUTCODE020
    Input Text    Description    AUTDESC020
    Click Element    //button[@type="submit"]

Download And Prepare Excel
    # Wait And Click    //button[.//span[contains(text(), "Download Template")]]
    Insert Data Into Excel    ${ORIGINAL_EXCEL_FILE}    ${WORKING_EXCEL_FILE}    3    @{DATA}

Upload Excel File
    ${file_input_locator}    Set Variable    xpath=//input[@type='file' and contains(@oninput, 'Radzen.uploadInputChange')]
    
    Wait Until Page Contains Element    ${file_input_locator}    timeout=${TIMEOUT}
    
    ${is_visible}    Run Keyword And Return Status    
    ...    Execute JavaScript    
    ...    var elem = document.evaluate("${file_input_locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    if(elem) { elem.style.display = 'block'; elem.style.height = '1px'; elem.style.width = '1px'; elem.style.opacity = '0'; return true; } else { return false; }
    
    Run Keyword If    not ${is_visible}    Log    Warning: Could not make file input visible. Attempting upload anyway.
    
    ${upload_success}    Run Keyword And Return Status    Choose File    ${file_input_locator}    ${ORIGINAL_EXCEL_FILE}
    
    Run Keyword If    not ${upload_success}    Upload File Alternative Method    ${file_input_locator}
    
    Wait For Upload Completion

Upload File Alternative Method
    [Arguments]    ${locator}
    ${element}    Get WebElement    ${locator}
    Execute JavaScript    arguments[0].setAttribute('style', 'display:block; height:1px; width:1px; opacity:0;');    ARGUMENTS    ${element}
    Choose File    ${locator}    ${ORIGINAL_EXCEL_FILE}

Wait For Upload Completion
    # Replace this with the actual way your application indicates a successful upload
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Upload successful')]    timeout=${TIMEOUT}
    # Or, if there's no visible confirmation, you might wait for an element to disappear:
    # Wait Until Element Is Not Visible    xpath=//div[contains(text(), 'Uploading...')]    timeout=${TIMEOUT}

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT}
    Click Element    ${locator}