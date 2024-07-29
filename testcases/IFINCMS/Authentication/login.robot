*** Settings ***
Resource    resources\keywords\WebKeywords.robot
Resource    resources\variables\GlobalVariables.robot


*** Test Cases ***
Valid User Can Login
    Open Browser To Login IFINCMS Page
