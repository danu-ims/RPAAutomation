*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/BaseVariables.robot


*** Keywords ***
# region IFINSYS LOGIN

Open Browser To Login IFINSYS Page
    Create Webdriver    Firefox
    Open Browser    ${IFINCMS}
    Maximize Browser Window
# endregion IFINSYS LOGIN
