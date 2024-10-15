*** Settings ***
Resource    automation/IFINLOS/TestCases/GeneralCode.robot
Resource    automation/IFINLOS/TestCases/GLLink.robot
Resource    automation/IFINLOS/TestCases/AmortizationType.robot


*** Test Cases ***
IFINSYS
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Danu                  Danu
    # Open Card               Loan Management

    #region process
    #Handle General Code Process
    # Handle GL Link Process
    Handle Amortization Type Process


    #endregion process

    Logout