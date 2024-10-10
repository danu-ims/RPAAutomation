*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Login To IFINLOS
    Open Browser & Login
    Open Card               IFINLOS    #Dinamis

Navigate To General Code
    Open Sidebar Menu    Setting         #Dinamis
    Open Sidebar Menu    General Code    #Dinamis

Add New General Code
    Click Add
    Input Field     Code           #Dinamis
    Input Field     Description    #Dinamis
    Click Active Status
    Click Editable Status
    Click Submit

*** Test Cases ***
General Code
    Login To IFINLOS
    Navigate To General Code
    Add New General Code
    Logout
