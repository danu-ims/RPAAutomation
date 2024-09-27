*** Settings ***
Resource    Resources/Base/BaseKeywords.robot


*** Keywords ***
Login To IFINSYS
    Open Browser & Login    Danu    Danu
    Open Card               Config

Navigate To General Code
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General Code

Add New General Code
    Click Add