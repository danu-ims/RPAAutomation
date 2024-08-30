*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
# region IFINCMS SideNav
Open Sidebar Menu Setting
    Wait Until Element Contains    //span[(contains(text(), "Setting"))]    Setting
    Click Element    //span[(contains(text(), "Setting"))]
# endregion IFINCMS SideNav
