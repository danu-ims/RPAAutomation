*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary    locale=id_ID
Resource    resources/variables/BaseVariables.robot
Resource    resources/keywords/AuthenticationKeyword.robot
Resource    resources/keywords/OpenCardModulesKeyword.robot


*** Keywords ***
# region close browser
Close Browser
    Close Browser
# endregion

# region Input Phone Number

Input Phone Number
    [Arguments]    ${AreaPhoneNo}    ${PhoneNo}
    ${AreaPhoneNo}=    Convert To Integer    ${AreaPhoneNo}
    ${PhoneNo}=    Convert To Integer    ${PhoneNo}
    ${AreaPhoneNo Length}=    Evaluate    len(str(${AreaPhoneNo}))
    ${PhoneNo Length}=    Evaluate    len(str(${PhoneNo}))

    IF    ${AreaPhoneNo Length} > 4
        Fail    Area Phone Number exceeds maximum length of 4
    END
    IF    ${PhoneNo Length} > 10
        Fail    Phone Number exceeds maximum length of 10
    END

    Input Text    id=AreaPhoneNo    ${AreaPhoneNo}
    Input Text    id=PhoneNo    ${PhoneNo}
# endregion Input Phone Number

# region Input FAX Number

Input Fax Number
    [Arguments]    ${AreaFaxNo}    ${FaxNo}
    ${AreaFaxNo}=    Convert To Integer    ${AreaFaxNo}
    ${FaxNo}=    Convert To Integer    ${FaxNo}
    ${AreaFaxNo Length}=    Evaluate    len(str(${AreaFaxNo}))
    ${FaxNo Length}=    Evaluate    len(str(${FaxNo}))

    IF    ${AreaFaxNo Length} > 4
        Fail    Area Phone Number exceeds maximum length of 4
    END
    IF    ${FaxNo Length} > 10
        Fail    Phone Number exceeds maximum length of 10
    END

    Input Text    id=AreaFaxNo    ${AreaFaxNo}
    Input Text    id=FaxNo    ${FaxNo}
# endregion Input FAX Number

Input Select Lookup
    [Arguments]    ${ButtonLookupLocation}    ${SelectLookupLocation}
    Wait Until Element Is Visible    ${ButtonLookupLocation}
    Click Element    ${ButtonLookupLocation}

    # Now, interact with the Province modal
    Wait Until Element Is Visible    ${SelectLookupLocation}
    Click Element    ${SelectLookupLocation}
