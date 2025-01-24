*** Settings ***
Resource    resources/Base/BaseVariables.robot


*** Variables ***
${TABLE_LOCATOR}        //table[contains(@class, 'rz-grid-table')]    # Adjust as needed
${CODE_LINK_LOCATOR}    //td[2]//rz-chkbox-box                        # Assuming the link is in the second column

${TableXpath}                  //table[contains(@class, 'rz-grid-table')]
${FirstRowData}                ${TableXpath}//tr[1]//td[2]//a
${FirstRowDataWithCheckbox}    ${TableXpath}//tr[1]//td[3]//a
${FirstRowDataCheckbox}        ${TableXpath}//tr[1]//td[1]//a
${FirstRowDataEfDate}          ${TableXpath}//tr[1]//td[4]//a

# Element Button Add
${ElementButton1}    xpath=//button[contains(., "Add")]
${ElementButton2}    xpath=//button[.//span[contains(text(), "Add")]]


*** Keywords ***
Click Add
    ${Status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${ElementButton1}    timeout=5s

    IF                               ${Status}
    Click Element                    ${ElementButton1}
    ELSE
    Wait Until Element Is Visible    ${ElementButton2}    timeout=5s
    Click Element                    ${ElementButton2}
    END

# Click Add
#    Wait Until Element Is Visible    //button[.//span[contains(text(), "Add")]]
#    Click Element                    //button[.//span[contains(text(), "Add")]]

Click Submit
    Wait Until Element Is Visible    //button[@type="submit"]
    Click Element                    //button[@type="submit"]

# Click Back
#    Wait Until Element Is Visible    //button[.//span[contains(text(), "Back")]]
#    Click Element                    //button[.//span[contains(text(), "Back")]]

Click Sidebar Toogle
    Wait Until Element Is Visible    //div[@class='sidebar-toggle']
    Click Element                    //div[@class='sidebar-toggle']

Click Back
    Wait Until Element Is Visible    //button[@title='Back']
    Click Element                    //button[@title='Back']

Click Active Status
    Wait Until Element Is Visible    id:ifin-btn-active
    Click Element                    id:ifin-btn-active

Click Editable Status
    Wait Until Element Is Visible    id:ifin-btn-editable
    Click Element                    id:ifin-btn-editable

Click Change Status
    [Arguments]                      ${Status}
    Wait Until Element Is Visible    //button[.//span[contains(text(), "${Status}")]]
    Click Element                    //button[.//span[contains(text(), "${Status}")]]

Click Checkbox
    Execute JavaScript
    ...                   var checkbox = document.querySelector("input[type='checkbox'][aria-label='Select all items']"); if (checkbox) { checkbox.checked = true; checkbox.setAttribute('value', 'true'); checkbox.setAttribute('aria-checked', 'true'); } else { console.log('Checkbox not found'); }
    Click Element         xpath=//div[contains(@class, 'rz-chkbox')]

Click Lookup With Search
    [Arguments]                      ${LookupName}                                                                                                  ${Search}
    Wait Until Element Is Visible
    ...                              xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]
    Click Element                    xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]
    Wait Until Element Is Visible
    ...                              xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//input[@id='ifin-searchbar']
    Input Text
    ...                              xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//input[@id='ifin-searchbar']
    ...                              ${Search}
    Wait Until Element Is Visible
    ...                              xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//tr[1]//button[@title='Select']
    Click Element
    ...                              xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//tr[1]//button[@title='Select']

Click Lookup
    [Arguments]                      ${LookupName}
    Wait Until Element Is Visible
    ...                              xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]
    Click Element                    xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]
    Click Element                    //tr[1]//button[normalize-space()='Select']

# Click DatePicker
#    [Arguments]                      ${LookupName}                   ${Date}
#    Click Element                    id=${LookupName}
#    Wait Until Element Is Visible    class=rz-datepicker-group
#    Click Element                    xpath=//td[text()='${Date}']




Click Date Picker
    [Arguments]                 ${IDDatePicker}                 ${Date}                     ${Index}=1
    ${ReformatEffectiveDate}    Convert Date                    ${Date}
    ${Month}=                   Date Convert To Letter Month    ${ReformatEffectiveDate}
    ${Year}=                    Date Convert To Year            ${ReformatEffectiveDate}
    ${Day}=                     Date Convert To Number Day      ${ReformatEffectiveDate}

    Wait Until Element Is Visible    //input[@id='${IDDatePicker}']/following-sibling::button
    Click Element                    //input[@id='${IDDatePicker}']/following-sibling::button

    Wait Until Element Is Visible    xpath=(//div[@class='rz-dropdown'])[${Index}]
    Click Element                    xpath=(//div[@class='rz-dropdown'])[${Index}]

    ${element}=                 Get WebElement    xpath=//li[@aria-label="${Month}"]
    Scroll Element Into View    ${element}
    Element Should Contain      ${element}        ${Month}
    Click Element               ${element}

    ${NextIndex}=                    Evaluate                                             ${Index} + 1
    Wait Until Element Is Visible    xpath=(//div[@class='rz-dropdown'])[${NextIndex}]
    Click Element                    xpath=(//div[@class='rz-dropdown'])[${NextIndex}]

    ${element}=                 Get WebElement    xpath=//li[@aria-label="${Year}"]
    Scroll Element Into View    ${element}
    Element Should Contain      ${element}        ${Year}
    Click Element               ${element}

    Click Element    //span[text()='${Day}']


Click Switch
    [Arguments]           ${InputName}
    Execute JavaScript    document.querySelector('input[name="${InputName}"]').click();

Click DDL
    [Arguments]                      ${DDLID}           ${OptionValue}
    ${PathDropDown}=                 Set Variable       //*[@id='${DDLID}']
    ${PathOption}=                   Set Variable       //li[@role='option' and @aria-label='${OptionValue}']
    Wait Until Element Is Visible    ${PathDropDown}
    Click Element                    ${PathDropDown}
    Wait Until Element Is Visible    ${PathOption}
    Click Element                    ${PathOption}

# region input fied

Input Field
    [Arguments]    ${Field}    ${Value}
    ${result}=     Run Keyword And Ignore Error    Input First Field    ${Field}    ${Value}
    IF             ${result}[0] == 'FAIL'
        ${result}=     Run Keyword And Ignore Error    Input Second Field    ${Field}    ${Value}
    END
    IF             ${result}[0] == 'FAIL'
        ${result}=     Run Keyword And Ignore Error    Click Date Picker    ${Field}    ${Value}
    END
    

Input First Field
    [Arguments]                      ${Field}                                                                       ${Value}
    Wait Until Element Is Visible    //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')]
    Input Text                       //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')]    ${Value}

Input Second Field
    [Arguments]                      ${Field}                     ${Value}
    Wait Until Element Is Visible    //input[@name="${Field}"]
    Input Text                       //input[@name="${Field}"]    ${Value}

# Input Date
#     [Arguments]                      ${Field}                     ${Value}
#     Click Date Picker               ${Value}


# Input DatePicker
#     [Arguments]                      ${Field}                     ${Value}
#     Wait Until Element Is Visible    //input[@name="${Field}"]
#     Input Text                       //input[@name="${Field}"]    ${Value}

Input From Excel
    [Arguments]    ${file_path}    ${start_row}    @{fields}

    Open Workbook    ${file_path}
    ${rows}=         Read Worksheet    header=False    start=${start_row}

    FOR                  ${item}                            IN          @{rows}
    Click Add
    FOR                  ${field}                           IN          @{fields}
    Log                  Field: ${field}
    ${column_letter}=    Get From Dictionary                ${field}    column
    Log                  Column Letter: ${column_letter}
    ${field_name}=       Get From Dictionary                ${field}    name
    ${value}=            Get From Dictionary                ${item}     ${column_letter}

    Log           Inputting value: ${value} into field: ${field_name}
    IF            "${field_name}" != "IsEditable" and "${field_name}" != "IsActive" and "${field_name}" != "IsSpOverride"
    Input Text    ${field_name}                                                                                              ${value}
    END
    END

        # Run Keyword If    '${field_name}' == 'IsSpOverride' and '${value}' != '1'    Click Element    class=rz-switch-circle

    Click Submit

    IF                       "${field_name}" == "IsEditable" and ${value} != 1
    Click Editable Status
    END
    IF                       "${field_name}" == "IsActive" and ${value} != 1
    Click Active Status
    END

    Click Back
    END

    Close Workbook

    # Handle conditional clicks inside the field loop
    # IF    '${field_name}' == 'IsActive'
    # IF    '${value}' == '1'
    # Click Active Status
    # END
    # END

    # IF    '${field_name}' == 'IsEditable'
    # IF    '${value}' == '1'
    # Click Editable Status
    # END
    # END

    # [Arguments]    ${file_path}    ${start_row}    @{fields}
    # Open Workbook    ${file_path}
    # ${rows}=    Read Worksheet    header=False    start=${start_row}
    # FOR    ${item}    IN    @{rows}
    # Click Add
    # FOR    ${field}    IN    @{fields}
    # ${column_index}=    Get From Dictionary    ${field}    column
    # ${field_name}=    Get From Dictionary    ${field}    name
    # Input Field    ${field_name}    ${item[${column_index}]}
    # END
    # Click Submit
    # Click Back
    # END
    # Close Workbook

# Input Field
#    [Arguments]       ${Field}                         ${Value}
#    ${is_visible}=    Wait Until Element Is Visible    //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')]    timeout=5
#    Run Keyword If    '${is_visible}' == 'False'       Input Text                                                                     //input[@name="${Field}"]    ${Value}    ELSE    Input Text    //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')]    ${Value}
# endregion

Open Browser & Login
    [Arguments]    ${UserName}    ${Password}

    Create Webdriver           Firefox
    Open Browser               ${BASEURL}
    Maximize Browser Window

    Wait Until Element Is Visible    name:UserName
    Wait Until Element Is Visible    name:Password

    Input Text        name:UserName               ${UserName}
    Input Password    name:Password               ${Password}
    Click Button      //button[@type="submit"]

Open Card
    [Arguments]                    ${CardName}
    Wait Until Element Contains    //h4[@title="${CardName}"]                 ${CardName}
    Click Element                  //h4[(contains(text(), "${CardName}"))]

Open Sidebar Menu
    [Arguments]                    ${Sidebar}
    Wait Until Element Contains    //span[(contains(text(), "${Sidebar}"))]    ${Sidebar}
    Click Element                  //span[(contains(text(), "${Sidebar}"))]

Open To Edit Data
    Wait Until Element Is Visible    ${FirstRowData}
    ${link}=                         Get Element Attribute    ${FirstRowData}    href

    IF       '${link}' == ''    Fail    No link found for element.
    Go To    ${link}

Open To Edit Data With Checkbox
    ${link}=    Get Element Attribute    ${FirstRowDataWithCheckbox}    href
    IF          '${link}' == ''          Fail                           No link found for element.
    Go To       ${link}

Open To Edit Data Eff Date
    ${link}=    Get Element Attribute    ${FirstRowDataEfDate}    href
    IF          '${link}' == ''          Fail                     No link found for element.
    Go To       ${link}

Open Wizard
    [Arguments]                    ${WizardName}
    Wait Until Element Contains    //span[(contains(text(), "${WizardName}"))]    ${WizardName}
    Click Element                  //span[(contains(text(), "${WizardName}"))]

# Open Wizard
#    [Arguments]                    ${WizardName}
#    Wait Until Element Contains    xpath=//a[@role='tab'][span[text()="${WizardName}"]]    ${WizardName}
#    Click Element                  xpath=//a[@role='tab'][span[text()="${WizardName}"]]

Logout
    Click Element    id:ifin-header-profile-photo
    Click Element    //span[(contains(text(), "Logout"))]


#region Date Convert
Date Convert To Letter Month
    [Arguments]    ${Date}
    ${Month}=      Get Substring    ${Date}    5    7

    ${MonthNames}=    Create List           January          February        March    April    May    June    July    August    September    October    November    December
    ${index}=         Convert To Integer    ${Month}
    ${MonthName}=     Get From List         ${MonthNames}    ${index - 1}
    [Return]          ${MonthName}

Date Convert To Number Day
    [Arguments]    ${Date}
    ${Day}=        Get Substring    ${Date}    8    10
    [Return]       ${Day}

Date Convert To Year
    [Arguments]    ${Date}
    ${Year}=       Get Substring    ${Date}    0    4
    [Return]       ${Year}
#endregion Date Convert


Import Excel Data
    [Arguments]       ${excel_file}     ${start_row}=2
    Open Workbook     ${excel_file}
    ${rows} =         Read Worksheet    header=True       start=${start_row}
    Close Workbook
    RETURN            ${rows}

Process Main Entries
    [Arguments]            ${rows}         ${main_fields}    ${sub_entries}
    ${current_parent} =    Set Variable    ${EMPTY}

    FOR                   ${item}                IN         @{rows}
    ${is_main_entry} =    Evaluate Main Entry    ${item}    ${main_fields}

    IF                     ${is_main_entry}
    Process Main Entry     ${item}             ${main_fields}     ${current_parent}
    ${current_parent} =    Set Variable        ${item['Code']}
    ELSE
    Process Sub Entries    ${item}             ${sub_entries}
    END
    END

Evaluate Main Entry
    [Arguments]     ${item}         ${main_fields}
    ${code} =       Set Variable    ${item['Code']}
    ${is_main} =    Evaluate        '${code}' != '' and '${code}' != 'None'
    RETURN          ${is_main}

Process Main Entry
    [Arguments]                      ${item}                              ${main_fields}    ${current_parent}
    Run Keyword If                   "${current_parent}" != "${EMPTY}"    Click Back
    Click Add
    Wait Until Element Is Visible    id:ifin-form-txt-code                timeout=2

    FOR               ${field}                               IN                     @{main_fields}
    ${value} =        Get From Dictionary                    ${item}                ${field}
    Run Keyword If    ${value} != '' and ${value} != None    Input Field By Type    ${field}          ${value}
    END

    Click Submit

Process Sub Entries
    [Arguments]              ${item}                ${sub_entries}
    FOR                      ${sub_entry}           IN                            @{sub_entries}
    ${sub_fields} =          Set Variable           ${sub_entry['fields']}
    ${identifier} =          Set Variable           ${sub_entry['identifier']}
    ${identifier_value} =    Get From Dictionary    ${item}                       ${identifier}

    IF                               ${identifier_value} != '' and ${identifier_value} != None
    Open Wizard                      ${sub_entry['name']}
    Click Add
    Wait Until Element Is Visible    id:ifin-form-txt-code                                        timeout=2

    FOR               ${field}                               IN                     @{sub_fields}
    ${value} =        Get From Dictionary                    ${item}                ${field}
    Run Keyword If    ${value} != '' and ${value} != None    Input Field By Type    ${field}         ${value}
    END

    Click Submit
    END
    END

Input Field By Type
    [Arguments]        ${field}          ${value}
    ${field_type} =    Get Field Type    ${field}

    IF                          '${field_type}' == 'input'
    Input Field                 ${field}                          ${value}
    ELSE IF                     '${field_type}' == 'ddl'
    Click DDL                   ifin-form-ddl-${field.lower()}    ${value}
    ELSE IF                     '${field_type}' == 'switch'
    Click Switch                ${field}
    ELSE IF                     '${field_type}' == 'lookup'
    Click Lookup With Search    ${field}                          ${value}
    ELSE IF                     '${field_type}' == 'date'
    Click Date Picker           ${field}                          ${value}    1
    END

Get Field Type
    [Arguments]           ${field}
    ${ddl_fields} =       Create List    Type                 BranchType
    ${switch_fields} =    Create List    IsSyariah            IsActive
    ${lookup_fields} =    Create List    SysRegionBranchID    SysProvinceID    SysCityID    SysZipCodeID    DocTypeID
    ${date_fields} =      Create List    ExpDate              EffDate

    IF         '${field}' in ${ddl_fields}
    RETURN     ddl
    ELSE IF    '${field}' in ${switch_fields}
    RETURN     switch
    ELSE IF    '${field}' in ${lookup_fields}
    RETURN     lookup
    ELSE IF    '${field}' in ${date_fields}
    RETURN     date
    ELSE
    RETURN     input
    END