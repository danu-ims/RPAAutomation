*** Settings ***
Resource    automation/IFINACC/TestCases/ChartOfAccount.robot
Resource    automation/IFINACC/TestCases/AmortizationType.robot


*** Test Cases ***
IFINACC
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Yaqi                  Yaqi@2
    Open Modul              Accounting

    # region process
    Handle Chart Of Account Process


    #endregion process

    Logout