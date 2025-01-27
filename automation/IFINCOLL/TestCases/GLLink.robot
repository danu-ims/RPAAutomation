*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate GL Link
    Open Sidebar Menu    Setting
    Open Sidebar Menu    GL Link

Add GL Link
    ${Code} =            Create Dictionary    name=Code            column=A    field_type=text
    ${GLLinkName} =      Create Dictionary    name=GLLinkName      column=B    field_type=text
    ${FunctionName} =    Create Dictionary    name=FunctionName    column=C    field_type=text
    ${IsBank} =          Create Dictionary    name=IsBank          column=D    field_type=switch
    ${IsActive} =        Create Dictionary    name=IsActive        column=E    field_type=switch

    ${fields}=          Create List                          ${Code}        ${GLLinkName}    ${FunctionName}    
    ...                 ${IsBank}                            ${IsActive}

    Input From Excel    files/excel/IFINCOLL/GL link.xlsx    2              @{fields}


Handle GL Link Process
    Navigate GL Link
    Add GL Link
