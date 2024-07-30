*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
# region Open Card IFINCMS
Open Card IFINCMS
    Wait Until Element Contains    //h4[@title="CLIENT MANAGEMENT"]    CLIENT MANAGEMENT
    Click Element    //h4[(contains(text(), "CLIENT MANAGEMENT"))]
# endregion Open Card IFINCMS
