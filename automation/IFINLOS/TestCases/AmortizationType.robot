*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate To Amortization Type
    Open Sidebar Menu    Setting
    Open Sidebar Menu    Amortization Type

Add New Amortization Type
    ${Code} =             Create Dictionary                            name=Code             column=A 
    ${Description} =      Create Dictionary                            name=Description      column=B 
    ${SpDefaultName} =    Create Dictionary                            name=SpDefaultName    column=C 
    ${IsActive} =         Create Dictionary                            name=IsActive         column=D 
    ${IsSpOverride} =     Create Dictionary                            name=IsSpOverride     column=E 
    ${fields}=            Create List                                  ${Code}               ${Description}    ${SpDefaultName}    ${IsActive}    ${IsSpOverride}
    Input From Excel      files/excel/IFINLOS/AmortizationType.xlsx    3                     @{fields}

Handle Amortization Type Process
    Navigate To Amortization Type 
    Add New Amortization Type 
