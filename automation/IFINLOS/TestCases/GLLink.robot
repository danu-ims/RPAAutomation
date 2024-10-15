*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate To GL Link 
    Open Sidebar Menu     Setting
    Open Sidebar Menu     Gl Link

Add New GL Link 
    ${Code} =           Create Dictionary                       name=Code           column=A 
    ${GlLinkName} =           Create Dictionary                       name=GlLinkName           column=B 
    ${IsActive} =           Create Dictionary                       name=IsActive           column=C 
    ${fields}=               Create List                             ${Code}       ${GlLinkName}       ${IsActive}
    Input From Excel         files/excel/IFINLOS/GLLink.xlsx    3                   @{fields}

Handle GL Link Process
    Navigate To GL Link 
    Add New GL Link 
