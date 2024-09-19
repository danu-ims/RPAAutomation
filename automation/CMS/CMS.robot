*** Settings ***

Library    RPA.Excel.Files
Library    OperatingSystem


Resource    resources/Base/Login.robot
Resource    ../../resources/Base/OpenCard.robot
Resource    ../../resources/Base/OpenSidebar.robot
Resource    ../../Resources/Base/InsertDataToExcel.robot

*** Variables ***
${ORIGINAL_EXCEL_FILE}    C:/Users/IMS-USER81/Downloads/SysGeneralSubCode.xlsx
${WORKING_EXCEL_FILE}    C:/Users/IMS-USER81/Downloads/SysGeneralSubCodeCpy.xlsx

@{DATA}    
...    ${1}    A55123    Example Item 1    ${10}    ${1}
...    ${2}    DXF456    Example Item 2    ${20}    ${1}
...    ${3}    GHG789    Example Item 3    ${30}    ${-1}
...    ${4}    JKS012    Example Item 4    ${40}    ${1}
...    ${5}    MXO345    Example Item 5    ${50}    ${-1}
...    ${6}    MFO345    Example Item 5    ${50}    ${-1}
...    ${7}    MHO345    Example Item 5    ${50}    ${-1}


*** Test Cases ***
Login IFINBASE
    Set Selenium Speed    0.2 seconds
    Valid User Can Login    Danu    Danu
    Open Card   Base

Insert General Code
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General
    
    Wait Until Element Is Visible    //button[.//span[contains(text(), "Add")]]    timeout=10
    Click Element    //button[.//span[contains(text(), "Add")]]

    Input Text    Code    AUTCODE015
    Input Password    Description    AUTDESC015
    Click Element    //button[@type="submit"]
    
Download Excel Sub General Code
    
    Wait Until Element Is Visible    //button[.//span[contains(text(), "Download Template")]]    timeout=10
    Click Element    //button[.//span[contains(text(), "Download Template")]]
    #Click Element When Visible    //span[contains(text(), Download Template)]

Open Excel And Write Data 
    Insert Data Into Excel    ${ORIGINAL_EXCEL_FILE}    ${WORKING_EXCEL_FILE}    3    @{DATA}

Upload Excel
    Click Element    //button[.//span[contains(text(), "Upload")]]
    Choose File     //button[.//span[contains(text(), "Upload")]]  D:/RPA/project3/Files/fileocr/excel/SysGeneralSubCode.xlsx
