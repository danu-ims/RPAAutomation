*** Settings ***
Resource    automation/IFINLOS/TestCases/GeneralCode.robot


*** Test Cases ***
IFINSYS
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Yaqi                  Yaqi@2
    Open Card               Loan Origination

    #region process
    Handle General Code Process


    #endregion process

    Logout