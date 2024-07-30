*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/BaseVariables.robot


*** Keywords ***
# region Open IFINCMS
Open Browser To Login IFINCMS Page
    Create Webdriver    Firefox
    Open Browser    ${IFINCMS}
    Maximize Browser Window
# endregion Open IFINCMS
