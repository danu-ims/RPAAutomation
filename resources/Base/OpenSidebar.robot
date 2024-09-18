*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/BaseVariables.robot
Resource    resources/keywords/OpenCardModulesKeyword.robot


*** Keywords ***
Open Sidebar Menu
    [Arguments]    ${Sidebar}
    Wait Until Element Contains    //span[(contains(text(), "${Sidebar}"))]    ${Sidebar}
    Click Element    //span[(contains(text(), "${Sidebar}"))]
