*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
# region IFINSYS Sidenav
Open Sidebar Menu Company Information
    Wait Until Element Contains    //span[(contains(text(), "Company Information"))]    Company Information
    Click Element    //span[(contains(text(), "Company Information"))]
# endregion IFINSYS Sidenav
