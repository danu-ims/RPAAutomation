*** Settings ***
Resource    ./resources/keywords/BaseKeywords.robot
Resource    ./resources/variables/BaseVariables.robot


*** Keywords ***
Valid User Can Login IFINCMS
    Open Browser To Login IFINCMS Page
    Login With Valid Credentials    Danu    Danu
