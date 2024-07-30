*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
# region IFINSYS LOGIN
Open Sidebar Menu Setting
    Wait Until Element Contains    //span[(contains(text(), "Setting"))]    Setting
    Click Element    //span[(contains(text(), "Setting"))]
# endregion IFINSYS LOGIN
