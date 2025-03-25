*** Settings ***
Resource    automation/IFINBASE/TestCases/Collectibility.robot

*** Test Cases ***
IFINBASE
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Danu                  Danu@1
    Open Modul              Base

    # region process
    Handle Collectibility Process


    #endregion process

    Logout