*** Settings ***
Resource    Resources/Base/BaseKeywords.robot



*** Keywords ***
Edit Table Entry
    [Arguments]    ${row_number}
    ${row}    Get WebElement    ${TABLE_LOCATOR}//tr[${row_number}]
    ${code_link}    Get WebElement    ${row}${CODE_LINK_LOCATOR}
    Log     ${code_link}
    Select Checkbox         ${code_link}


*** Keywords ***
Navigate To Benchmark
    Open Sidebar Menu    Setting
    Open Sidebar Menu    Benchmark

Add New Benchmark
    Click Add
    Input Text    Code    AUTCODE016
    Input Text    Description    AUTDESC016
    Click Submit

Add New Benchmark Detail
    Click Add
    Input Text    EffectiveDate    02/02/2024
    Input Text    Rate    1
    Click Submit
    Click Back

Edit Benchmark
    #Open To Edit Data
    Input Text    Description    AUTDESDESCC016EDITED
    Click Submit
    Click Change Status     Non Active

Edit Benchmark Detail
    Open To Edit Data Eff Date
    Input Text    EffectiveDate    02/12/2024
    Click Submit
    Click Back

#Click Check
    #Open To Edit Data
    #Click Checkbox











