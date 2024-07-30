*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/BaseVariables.robot
Resource    resources/keywords/AuthenticationKeyword.robot
Resource    resources/keywords/OpenCardModulesKeyword.robot


*** Keywords ***
# region close browser
Close Browser
    Close Browser
# endregion
