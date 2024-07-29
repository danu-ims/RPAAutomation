*** Settings ***
Library     SeleniumLibrary
Resource    resources/variables/GlobalVariables.robot


*** Keywords ***
# IFINCMS LOGIN
Open Browser To Login IFINCMS Page
    Open Browser    ${IFINCMS}    chrome
    Maximize Browser Window

# IFINSYS LOGIN

Open Browser To Login IFINSYS Page
    Open Browser    ${IFINCMS}    chrome
    Maximize Browser Window

Login With Valid Credentials
    [Arguments]    ${UserName}    ${Password}
    Input Text    ${UserName}    ${UserName}
    Input Password    ${Password}    ${Password}
    Click Button    //button[@type="submit"]

Close Browser
    Close Browser
