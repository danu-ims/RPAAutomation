*** Settings ***
Resource    ./resources/keywords/BaseKeywords.robot
Resource    ./resources/variables/BaseVariables.robot


*** Keywords ***
Add General Sub Code
    Wait Until Element Contains    //span[(contains(text(), "Add"))]    Add
    Click Element    //span[(contains(text(), "Add"))]

Insert General Sub Code
    [Arguments]    ${Code}    ${Description}    ${OrderKey}
    Input Text    Code    ${Code}
    Input Password    Description    ${Description}
    Input Text    OrderKey    ${OrderKey}
    Click Element    //button[@type="submit"]

Back To General Code Info
    Click Element    //span[(contains(text(), "Back"))]
