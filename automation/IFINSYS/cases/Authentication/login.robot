*** Settings ***
Resource    ./resources/keywords/BaseKeywords.robot
Resource    ./resources/variables/BaseVariables.robot


*** Keywords ***
Valid User Can Login IFINSYS
    Open Browser To Login IFINSYS Page
    Login With Valid Credentials    Danu    Danu
