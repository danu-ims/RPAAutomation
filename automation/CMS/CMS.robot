*** Settings ***
Resource    resources/Base/Login.robot
Resource    ../../resources/Base/OpenCard.robot
Resource    ../../resources/Base/OpenSidebar.robot


*** Test Cases ***
Login IFINCMS
    Set Selenium Speed    0.2 seconds
    Valid User Can Login    Danu    Danu
    Open Card CMS    Client Management

    Open Sidebar Menu    Setting
    Open Sidebar Menu    General

    # Click Element    //button[@contains=(@class, 'rz-button') and contains(text(), 'Add')]

    # Wait Until Element Contains    //button[(contains(text(), "Add"))]    Add
    Click Element    //button[(contains(text(), Add))]


    # Input Text    Code    AUTCODE001
    # Input Password    Description    AUTDESC001
    # Click Element    //button[@type="submit"]
