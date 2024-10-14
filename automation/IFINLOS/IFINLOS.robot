*** Settings ***
Resource    automation/IFINLOS/TestCases/GeneralCode.robot

*** Test Cases ***
IFINSYS
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Danu                  Danu

    Handle General Code Process