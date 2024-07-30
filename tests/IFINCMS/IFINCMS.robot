*** Settings ***
Resource    tests/IFINCMS/cases/Authentication/login.robot
Resource    tests/IFINCMS/cases/Authentication/logout.robot
Resource    tests/IFINCMS/cases/GeneralCode.robot
Resource    tests/IFINCMS/cases/GeneralSubCode.robot


*** Test Cases ***
Login IFINCMS
    Set Selenium Speed    0.5 seconds
    Valid User Can Login IFINCMS

    Logout

Open Card IFINCMS
    Open Card IFINCMS

General Code & General Sub Code
    Open Sidebar Menu Setting
    Open General Code

    Add General Code
    Insert General Code    CODEAUTOMATION05    DESCRIPTIONAUTOMATION05

    Add General Sub Code
    Insert General Sub Code    SUBCODEAUTOMATION05    SUBDESCRIPTIONAUTOMATION05    1

    Back To General Code Info
    Back To General Code List
