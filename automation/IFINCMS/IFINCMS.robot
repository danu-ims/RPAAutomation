*** Settings ***
Resource    automation/IFINCMS/cases/Authentication/login.robot
Resource    automation/IFINCMS/cases/Authentication/logout.robot
Resource    automation/IFINCMS/cases/GeneralCode.robot
Resource    automation/IFINCMS/cases/GeneralSubCode.robot


*** Test Cases ***
Login IFINCMS
    Set Selenium Speed    0.2 seconds
    Valid User Can Login IFINCMS

Open Card IFINCMS
    Open Card IFINCMS

General Code & General Sub Code
    Open Sidebar Menu Setting
    Open General Code

    Add General Code
    Insert General Code    CODEAUTOMATION08    DESCRIPTIONAUTOMATION08

    Add General Sub Code
    Insert General Sub Code    SUBCODEAUTOMATION08    SUBDESCRIPTIONAUTOMATION08    1

    Back To General Code Info
    Back To General Code List

    Logout
    BaseKeywords.Close Browser
