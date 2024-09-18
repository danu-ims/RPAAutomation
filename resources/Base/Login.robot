*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/BaseVariables.robot
Resource    resources/keywords/OpenCardModulesKeyword.robot


*** Keywords ***
Valid User Can Login
    [Arguments]    ${UserName}    ${Password}

    Create Webdriver    Firefox
    Open Browser    ${BASEURL}
    Maximize Browser Window

    Input Text    id:UserName    ${UserName}
    Input Password    id:Password    ${Password}
    Click Button    //button[@type="submit"]


