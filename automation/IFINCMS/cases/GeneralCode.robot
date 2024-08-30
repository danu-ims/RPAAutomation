*** Settings ***
Resource    ./resources/keywords/BaseKeywords.robot
Resource    ./resources/variables/BaseVariables.robot


*** Keywords ***
Open General Code
    Wait Until Element Contains    //span[(contains(text(), "General Code"))]    General Code
    Click Element    //span[(contains(text(), "General Code"))]

Add General Code
    Wait Until Element Contains    //span[(contains(text(), "Add"))]    Add
    Click Element    //span[(contains(text(), "Add"))]

Insert General Code
    [Arguments]    ${Code}    ${Description}
    Input Text    Code    ${Code}
    Input Password    Description    ${Description}
    Click Element    //button[@type="submit"]

Back To General Code List
    Click Element    //span[(contains(text(), "Back"))]
