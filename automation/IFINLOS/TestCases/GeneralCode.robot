*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate To General Code 
    Open Sidebar Menu     Setting
    Open Sidebar Menu     General Code

Add New General Code 
    ${Code} =           Create Dictionary                       name=Code           column=A 
    ${Description} =           Create Dictionary                       name=Description           column=B 
    ${IsEditable} =           Create Dictionary                       name=IsEditable           column=C 
    ${fields}=               Create List                             ${Code}       ${Description}       ${IsEditable}
    Input From Excel         files/excel/IFINLOS/GeneralCode.xlsx    3                   @{fields}

Handle General Code Process
    Navigate To General Code 
    Add New General Code 
