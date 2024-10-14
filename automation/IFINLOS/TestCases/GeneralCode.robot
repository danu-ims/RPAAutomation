*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Keywords ***
Navigate To General Code
    Open Card            Loan Management
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General Code

Add New General Code
    Click Add
    Input Field              Code
    Input Field              Description
    Click Editable Status
    Click Submit

Handle General Code Process
    Navigate To General Code 
    Add New General Code
    Logout

