*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Scenario Input Form
    Open Workbook    files/excel/scenario_input_form.xlsx
    ${rows}    Read Worksheet    header=True    start=2
    ${current_parent}=    Set Variable    ${EMPTY}
    FOR    ${item}    IN    ${rows}
    END
    ${Code1}=    Set Variable    ${item[Code]}
    ${Description2}=    Set Variable    ${item[Description]}
    ${SpDefaultName3}=    Set Variable    ${item[SpDefaultName]}
    ${IsActive4}=    Set Variable    ${item[IsActive]}
    ${IsSpOverride5}=    Set Variable    ${item[IsSpOverride]}
    ${Code6}=    Set Variable    ${item[Code]}
    ${Description7}=    Set Variable    ${item[Description]}
    ${IsEditable8}=    Set Variable    ${item[IsEditable]}
    ${Code9}=    Set Variable    ${item[Code]}
    ${GlLinkName10}=    Set Variable    ${item[GlLinkName]}
    ${IsActive11}=    Set Variable    ${item[IsActive]}
    IF    "${Code1}" != ${EMPTY} and     "${Code1}" != ${current_parent} and "${Code1}" != "None"
    Run Keyword IF    ${current_parent} != ${EMPTY}      Click Back
    Click Add
    Input Field    Code    ${Code1}
    Input Field    Description    ${Description2}
    Input Field    SpDefaultName    ${SpDefaultName3}
    Input Field    IsActive    ${IsActive4}
    Input Field    IsSpOverride    ${IsSpOverride5}
    Input Field    Code    ${Code6}
    Input Field    Description    ${Description7}
    Input Field    IsEditable    ${IsEditable8}
    Input Field    Code    ${Code9}
    Input Field    GlLinkName    ${GlLinkName10}
    Input Field    IsActive    ${IsActive11}
    END
    Click Button    Submit
