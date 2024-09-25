*** Settings ***
Resource    Resources/Base/BaseVariables.robot

*** Variables ***
${TABLE_LOCATOR}        //table[contains(@class, 'rz-grid-table')]    # Adjust as needed
${CODE_LINK_LOCATOR}    //td[2]//rz-chkbox-box                        # Assuming the link is in the second column

*** Variables ***
${TableXpath}              //table[contains(@class, 'rz-grid-table')]
${FirstRowData}            ${TableXpath}//tr[1]//td[2]//a
${FirstRowDataCheckbox}    ${TableXpath}//tr[1]//td[1]//a
${FirstRowDataEfDate}      ${TableXpath}//tr[1]//td[4]//a

*** Keywords ***
Click Add
    Wait Until Element Is Visible    //button[.//span[contains(text(), "Add")]]
    Click Element                    //button[.//span[contains(text(), "Add")]]

Click Submit
    Wait Until Element Is Visible    //button[@type="submit"]
    Click Element                    //button[@type="submit"]

Click Back
    Wait Until Element Is Visible    //button[.//span[contains(text(), "Back")]]
    Click Element                    //button[.//span[contains(text(), "Back")]]

Click Change Status
    [Arguments]                      ${Status}
    Wait Until Element Is Visible    //button[.//span[contains(text(), "${Status}")]]
    Click Element                    //button[.//span[contains(text(), "${Status}")]]

Click Checkbox
    Execute JavaScript    var checkbox = document.querySelector("input[type='checkbox'][aria-label='Select all items']"); if (checkbox) { checkbox.checked = true; checkbox.setAttribute('value', 'true'); checkbox.setAttribute('aria-checked', 'true'); } else { console.log('Checkbox not found'); }
    Click Element         xpath=//div[contains(@class, 'rz-chkbox')]

Click Lookup
    Wait Until Element Is Visible    //button[.//i[contains(text(), "feature_search")]]
    Click Element                    //button[.//i[contains(text(), "feature_search")]]
    Click Element                    //tr[1]//button[normalize-space()='Select']


Input Field
    [Arguments]                    ${Field}                     ${Value}
    Wait Until Element Is Visible    id:${Field}
    Wait Until Element Is Visible    id:${Field}
    Input Text                     ${Field}                     ${Value}

Open Browser & Login
    [Arguments]    ${UserName}    ${Password}

    Create Webdriver           Firefox
    Open Browser               ${BASEURL}
    Maximize Browser Window

    Wait Until Element Is Visible    id:UserName
    Wait Until Element Is Visible    id:Password

    Input Text        id:UserName                 ${UserName}
    Input Password    id:Password                 ${Password}
    Click Button      //button[@type="submit"]

Open Card
    [Arguments]                    ${CardName}
    Wait Until Element Contains    //h4[@title="${CardName}"]                 ${CardName}
    Click Element                  //h4[(contains(text(), "${CardName}"))]

Open Sidebar Menu
    [Arguments]                    ${Sidebar}
    Wait Until Element Contains    //span[(contains(text(), "${Sidebar}"))]    ${Sidebar}
    Click Element                  //span[(contains(text(), "${Sidebar}"))]

Open To Edit Data
    ${link}=          Get Element Attribute    ${FirstRowData}    href
    Log               ID: 
    Run Keyword If    '${link}' == ''          Fail               No link found for element.
    Go To             ${link}

Open To Edit Data Eff Date
    ${link}=          Get Element Attribute    ${FirstRowDataEfDate}    href
    Log               ID: 
    Run Keyword If    '${link}' == ''          Fail                     No link found for element.
    Go To             ${link}







