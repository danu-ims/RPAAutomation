*** Settings ***
Resource    automation/IFINCOLL/TestCases/GLLink.robot

*** Test Cases ***
IFINCOLL
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Yaqi                  Yaqi@2
    Open Modul              Collection

    # region process
    Handle GL Link Process

    #endregion process

    Logout