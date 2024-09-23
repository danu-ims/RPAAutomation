*** Settings ***
Resource   Automation/IFINCMS/Cases/GeneralCode.robot

*** Test Cases ***
General Code
    [Setup]    Set Selenium Speed    0.2 seconds
    Login To IFINCMS
    Navigate To General Code
    Add New General Code
    Add New General Code Detail
    Edit General Code
    Edit General Code Detail