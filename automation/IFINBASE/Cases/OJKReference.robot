*** Settings ***
Resource    Resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate To OJK Reference
    Open Sidebar Menu    Setting
    Open Sidebar Menu    Ojk Reference
    Wait Until Element Is Visible    //button[.//i[contains(text(), "feature_search")]]
    Click Element    //button[.//i[contains(text(), "feature_search")]]
    Click Element    //tr[1]//button[normalize-space()='Select']

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











