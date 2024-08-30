*** Settings ***
Resource    ./resources/keywords/BaseKeywords.robot
Resource    ./resources/variables/BaseVariables.robot
Resource    Authentication/logout.robot


*** Variables ***
# ${REGION_BUTTON_XPATH}    //label[text()='Region']/following::button[1]
# ${PROVINCE_BUTTON_XPATH}    //label[text()='Province']/following::button[1]
# ${CITY_BUTTON_XPATH}    //label[text()='City']/following::button[1]
# ${REGION_SELECT_XPATH}    (//span[text()='Select'])[1]    # Adjust based on the correct order
# ${PROVINCE_SELECT_XPATH}    (//span[text()='Select'])[1]    # Adjust based on the correct order
# ${CITY_SELECT_XPATH}    (//span[text()='Select'])[1]    # Adjust based on the correct order
# # ${SELECT}    //label[text()='Select']
# ${VALUE_XPATH}    //div[contains(@class, 'rz-stack')]//input[@type='text']


*** Keywords ***
Open Branch List
    Wait Until Element Contains    //span[text()="Branch"]    Branch
    Click Element    //span[text()="Branch"]

Add Branch
    Wait Until Element Contains    //span[(contains(text(), "Add"))]    Add
    Click Element    //span[(contains(text(), "Add"))]    Add

Insert Branch Info
    [Arguments]
    ...    ${Code}
    ...    ${Name}
    ...    ${AreaPhoneNumber}
    ...    ${PhoneNumber}
    ...    ${AreaFaxNumber}
    ...    ${FaxNumber}
    ...    ${Email}
    ...    ${Address}

    Input Text    Code    ${Code}
    Input Text    Name    ${Name}
    Input Phone Number    ${AreaPhoneNumber}    ${PhoneNumber}
    Input Fax Number    ${AreaFaxNumber}    ${FaxNumber}
    Input Text    Email    ${Email}
    Input Select Lookup    //label[text()='Region']/following::button[1]    (//span[text()='Select'])[1]
    Input Select Lookup    //label[text()='Province']/following::button[1]    (//span[text()='Select'])[1]
    Input Select Lookup    //label[text()='City']/following::button[1]    (//span[text()='Select'])[1]
    Input Select Lookup    //label[text()='Zip Code']/following::button[1]    (//span[text()='Select'])[1]
    Input Text    Address    ${Address}
    Click Element    //button[@type="submit"]
