*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/BaseVariables.robot
Resource    resources/keywords/OpenCardModulesKeyword.robot


*** Keywords ***
Open Card CMS
    [Arguments]    ${NameCard}
    Wait Until Element Contains    //h4[@title="${NameCard}"]    ${NameCard}
    Click Element    //h4[(contains(text(), "${NameCard}"))]
