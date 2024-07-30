*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/BaseVariables.robot
Resource    resources/keywords/modules/ModuleKeywords.robot


*** Keywords ***
# region Login
Login With Valid Credentials
    [Arguments]    ${UserName}    ${Password}
    Input Text    id:UserName    ${UserName}
    Input Password    id:Password    ${Password}
    Click Button    //button[@type="submit"]
# endregion Login
