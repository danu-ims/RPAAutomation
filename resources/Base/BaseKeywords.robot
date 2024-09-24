*** Settings ***
Resource    Resources/Base/BaseVariables.robot

*** Variables ***
${TABLE_LOCATOR}        //table[contains(@class, 'rz-grid-table')]    # Adjust as needed
${CODE_LINK_LOCATOR}    //td[2]//rz-chkbox-box                   # Assuming the link is in the second column

*** Variables ***
${tableXpath}    //table[contains(@class, 'rz-grid-table')]
${firstRowData}    ${TABLE_XPATH}//tr[1]//td[2]//a
${firstRowDataCheckbox}    ${TABLE_XPATH}//tr[1]//td[1]//a
${firstRowDataEfDate}    ${TABLE_XPATH}//tr[1]//td[3]//a

*** Keywords ***
Click Add
    Wait Until Element Is Visible    //button[.//span[contains(text(), "Add")]]
    Click Element    //button[.//span[contains(text(), "Add")]]

Click Submit
    Wait Until Element Is Visible    //button[@type="submit"]
    Click Element    //button[@type="submit"]
    
Click Back
    Wait Until Element Is Visible    //button[.//span[contains(text(), "Back")]]
    Click Element    //button[.//span[contains(text(), "Back")]]

Click Change Status
    [Arguments]         ${Status}
    Wait Until Element Is Visible    //button[.//span[contains(text(), "${Status}")]]
    Click Element    //button[.//span[contains(text(), "${Status}")]]

Click Checkbox
    Execute JavaScript    var checkbox = document.querySelector("input[type='checkbox'][aria-label='Select all items']"); if (checkbox) { checkbox.checked = true; checkbox.setAttribute('value', 'true'); checkbox.setAttribute('aria-checked', 'true'); } else { console.log('Checkbox not found'); }
    Click Element    xpath=//div[contains(@class, 'rz-chkbox')]



Open Browser & Login
    [Arguments]    ${UserName}    ${Password}

    Create Webdriver    Firefox
    Open Browser    ${BASEURL}
    Maximize Browser Window

    Wait Until Element Is Visible    id:UserName
    Wait Until Element Is Visible    id:Password

    Input Text    id:UserName    ${UserName}
    Input Password    id:Password    ${Password}
    Click Button    //button[@type="submit"]

Open Card
    [Arguments]    ${CardName}
    Wait Until Element Contains    //h4[@title="${CardName}"]    ${CardName}
    Click Element    //h4[(contains(text(), "${CardName}"))]

Open Sidebar Menu
    [Arguments]    ${Sidebar}
    Wait Until Element Contains    //span[(contains(text(), "${Sidebar}"))]    ${Sidebar}
    Click Element    //span[(contains(text(), "${Sidebar}"))]

Open To Edit Data
    ${link}=    Get Element Attribute    ${firstRowData}    href
    Log    ID: 
    Run Keyword If    '${link}' == ''    Fail    No link found for element.
    Go To          ${link}

Open To Edit Data Eff Date
    ${link}=    Get Element Attribute    ${firstRowDataEfDate}    href
    Log    ID: 
    Run Keyword If    '${link}' == ''    Fail    No link found for element.
    Go To          ${link}


    




