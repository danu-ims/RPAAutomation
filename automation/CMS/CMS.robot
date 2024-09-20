*** Settings ***
Library     RPA.Excel.Files
Library     SeleniumLibrary
Library     OperatingSystem
Library     RPA.Tables
Library     ../../Resources/CustomLib/UploadFile.py
Resource    resources/Base/Login.robot
Resource    ../../resources/Base/OpenCard.robot
Resource    ../../resources/Base/OpenSidebar.robot
Resource    ../../Resources/Base/InsertDataToExcel.robot

*** Variables ***
${TABLE_LOCATOR}        //table[contains(@class, 'rz-grid-table')]    # Adjust as needed
${CODE_LINK_LOCATOR}    //td[2]//a                   # Assuming the link is in the second column

${UPLOAD_BUTTON_CLASS}   rz-button-text
${FILE_INPUT_CSS}        input[type="file"]

${ORIGINAL_EXCEL_FILE}   D:/RPA/project3/Files/fileocr/excel/GeneralCode.xlsx
${WORKING_EXCEL_FILE}    D:/RPA/project3/Files/fileocr/excel/GeneralCodee.xlsx
${TIMEOUT}               30s

${COLUMNS_TO_FILL}    4

@{DATA}
...    ${1}    A55123    Example Item 1     ${1}
...    ${2}    DXF456    Example Item 2     ${1}
...    ${3}    GHG789    Example Item 3     ${-1}
...    ${4}    JKS012    Example Item 4     ${1}
...    ${5}    MXO345    Example Item 5     ${-1}
...    ${6}    MFO345    Example Item 5     ${-1}
...    ${7}    MHO345    Example Item 5     ${-1}

*** Keywords ***
Edit Table Entry
    [Arguments]    ${row_number}
    ${row}    Get WebElement    ${TABLE_LOCATOR}//tr[${row_number}]
    ${code_link}    Get WebElement    ${row}${CODE_LINK_LOCATOR}
    Click Element    ${code_link}


*** Task ***
Complete IFINBASE Workflow
    [Setup]    Set Selenium Speed    0.2 seconds
    Login To IFINBASE
    Navigate To General Settings
    #Add New General Code
    #Download And Prepare Excel
    Update General Code

*** Keywords ***
Login To IFINBASE
    Valid User Can Login    Danu    Danu
    Open Card    Base

Navigate To General Settings
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General

Update General Code
    Edit Table Entry    1  # Change to the desired row number

#Add New General Code
    #Wait Until Element Is Visible    //button[.//span[contains(text(), "Add")]]    timeout=10
    #Click Element    //button[.//span[contains(text(), "Add")]]

    #Input Text    Code    AUTCODE015
    #Input Password    Description    AUTDESC015
    #Click Element    //button[@type="submit"]










