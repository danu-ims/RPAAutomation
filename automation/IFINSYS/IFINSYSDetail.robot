*** Settings ***
Resource    automation/IFINSYS/TestCases/Employee.robot
Resource    resources/Base/BaseKeywords.robot


# *** Keywords ***
# Input From Excel RN
#    [Arguments]    ${file_path}    ${start_row}    @{fields}

#    Open Workbook    ${file_path}
#    ${rows}=         Read Worksheet    header=False    start=${start_row}

#    FOR                    ${item}                IN               @{rows}
#    Click Add
#    FOR                    ${field}               IN               @{fields}
#    ${column_letter}=      Get From Dictionary    ${field}         column
#    ${field_name}=         Get From Dictionary    ${field}         name
#    ${field_type}=         Get From Dictionary    ${field}         field_type
#    ${value}=              Get From Dictionary    ${item}          ${column_letter}
#    Input Field By Type    ${field_type}          ${field_name}    ${value}

#    END
#    Click Submit
#    Click Back
#    END
#    Close Workbook

*** Keywords ***
# Input From Excel RN
#    [Arguments]    ${file_path}    ${start_row}    @{fields}

#    Open Workbook    ${file_path}


#    ${sheet_names}    List Worksheets
#    FOR               ${worksheet}       IN    @{sheet_names}

#    ${rows}=    Read Worksheet    ${worksheet}    header=false    start=${start_row}

#    FOR                    ${item}                                                                           IN               @{rows}
#    Click Add
#    FOR                    ${field}                                                                          IN               @{fields}
#    ${column_letter}=      Get From Dictionary                                                               ${field}         column
#    ${field_name}=         Get From Dictionary                                                               ${field}         name
#    ${field_type}=         Get From Dictionary                                                               ${field}         field_type
#    ${value}=              Get From Dictionary                                                               ${item}          ${column_letter}
#    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE         
#    Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}

#    END
#    # Click Submit
#    Click Back
#    END



#    END

#    Close Workbook


# Input From Excel RN
#    [Arguments]    ${file_path}    ${start_row}

#    Open Workbook     ${file_path}
#    ${sheet_names}    List Worksheets

#    FOR           ${worksheet}         IN              @{sheet_names}
#    ${fields}=    Get Field Mapping    ${worksheet}
#    ${rows}=      Read Worksheet       ${worksheet}    header=false      start=${start_row}

#    FOR                    ${item}                                                                           IN               @{rows}
#    Click Add
#    FOR                    ${field}                                                                          IN               @{fields}
#    ${column_letter}=      Get From Dictionary                                                               ${field}         column
#    ${field_name}=         Get From Dictionary                                                               ${field}         name
#    ${field_type}=         Get From Dictionary                                                               ${field}         field_type
#    ${value}=              Get From Dictionary                                                               ${item}          ${column_letter}
#    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE
#    Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}
#    END
#    Click Back
#    END
#    END
#    Close Workbook



# Get Field Mapping
#    [Arguments]    ${worksheet}
#    ${mapping}=    Create List

#    IF                   '${worksheet}' == 'Region'
#    ${Code} =            Create Dictionary              name=Code           column=A           field_type=text
#    ${Description} =     Create Dictionary              name=Description    column=B           field_type=text
#    ${IsActive} =        Create Dictionary              name=IsActive       column=C           field_type=switch
#    ${mapping}=          Create List                    ${Code}             ${Description}     ${IsActive}
#    ELSE IF              '${worksheet}' == 'Detail'
#    ${Code2} =           Create Dictionary              name=Code           column=A           field_type=text
#    ${Description2} =    Create Dictionary              name=Description    column=B           field_type=text
#    ${mapping}=          Create List                    ${Code2}            ${Description2}    
#    ELSE
#    Log                  Unknown sheet: ${worksheet}    WARN
#    END
#    RETURN               ${mapping}


Input From Excel RN
    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

    Open Workbook    ${file_path}

    ${workSheet1} =       Get From List          ${listMapExcel}     0
    ${region_sheet} =     Get Dictionary Keys    ${workSheet1}[0]
    ${region_fields} =    Get From Dictionary    ${workSheet1}       ${region_sheet}

    ${workSheet2} =       Get From List          ${listMapExcel}     1
    ${detail_sheet} =     Get Dictionary Keys    ${workSheet2}[0]
    ${detail_fields} =    Get From Dictionary    ${workSheet2}       ${detail_sheet}


    ${rows_region} =      Read Worksheet    ${region_sheet}             header=False    start=${start_row}
    ${added_regions} =    Create List       # To store added regions

     FOR                 ${item}         IN      @{rows_region}
#    Click Add
     ${last_region} =    Set Variable    None    # Store last inserted region

    FOR                   ${field}               IN          @{region_fields}
    ${column_letter} =    Get From Dictionary    ${field}    column
    ${field_name} =       Get From Dictionary    ${field}    name
    ${field_type} =       Get From Dictionary    ${field}    field_type
    ${value} =            Get From Dictionary    ${item}     ${column_letter}

    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE
    Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}

    ${last_region} =    Set Variable    ${value} 
    END

#    Click Submit
#    Click Back
     Append To List    ${added_regions}    ${last_region}    # Store for later use
     END

   # Process Detail Sheet - Find Region and Add Details
    ${rows_detail} =    Read Worksheet    ${detail_sheet}    header=False    start=${start_row}

    FOR                    ${region}    IN                                @{added_regions}
    Search In GridTable    ${region}    # Find the region in the table

    FOR                 ${item}                IN         @{rows_detail}
    ${region_code} =    Get From Dictionary    ${item}    A                 # First column in Detail Sheet

    Run Keyword If    '${region_code}' != '${region}'    CONTINUE    # Skip details not belonging to this region

    # Click Add

    FOR                   ${field}               IN          @{detail_fields}
    ${column_letter} =    Get From Dictionary    ${field}    column
    ${field_name} =       Get From Dictionary    ${field}    name
    ${field_type} =       Get From Dictionary    ${field}    field_type
    ${value} =            Get From Dictionary    ${item}     ${column_letter}

    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE
    Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}
    END

    # Click Submit
    END
    # Click Back 
    END

    Close Workbook




# Input From Excel RN
#    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

#    Open Workbook    ${file_path}

#    FOR    ${workSheetDict}    IN    @{listMapExcel}

#    ${sheet_keys} =    Get Dictionary Keys    ${workSheetDict}
#    ${sheet_name} =    Set Variable           ${sheet_keys}
#    ${fields} =        Get From Dictionary    ${workSheetDict}    ${sheet_name}

#    ${rows} =    Read Worksheet    ${sheet_name}    header=False    start=${start_row}

#    FOR                   ${item}                IN          @{rows}
#    # Click Add
#    FOR                   ${field}               IN          @{fields}
#    ${column_letter} =    Get From Dictionary    ${field}    column
#    ${field_name} =       Get From Dictionary    ${field}    name
#    ${field_type} =       Get From Dictionary    ${field}    field_type
#    ${value} =            Get From Dictionary    ${item}     ${column_letter}

#    Run Keyword If           '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE
#    # Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}
#    END
#    # Click Submit
#    # Click Back
#    END
#    # Search In GridTable    ${value}
#    # Click Back
#    END

#    Close Workbook



# Input From Excel RN
#    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

#    Open Workbook    ${file_path}

#    FOR                ${workSheetDict}       IN                  @{listMapExcel}
#    ${sheet_keys} =    Get Dictionary Keys    ${workSheetDict}

#    FOR            ${sheet_name}          IN                  @{sheet_keys}    # ✅ Loop through all sheet names
#    ${fields} =    Get From Dictionary    ${workSheetDict}    ${sheet_name}
#    ${rows} =      Read Worksheet         ${sheet_name}       header=False     start=${start_row}

#    FOR                   ${item}                IN          @{rows}
#    Click Add
#    FOR                   ${field}               IN          @{fields}
#    ${column_letter} =    Get From Dictionary    ${field}    column
#    ${field_name} =       Get From Dictionary    ${field}    name
#    ${field_type} =       Get From Dictionary    ${field}    field_type
#    ${value} =            Get From Dictionary    ${item}     ${column_letter}

#    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE
#    Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}
#    END
#    # Click Submit
#    Click Back
#    END

#    END                    # ✅ End loop for sheet names
#    Search In GridTable    ${value}                           
#    END                    # ✅ End loop for `listMapExcel`

#    Close Workbook



# Input From Excel RN
#    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

#    Open Workbook    ${file_path}

#    ${region_list} =    Create List 

#    FOR                ${workSheetDict}       IN                  @{listMapExcel}
#    ${sheet_keys} =    Get Dictionary Keys    ${workSheetDict}
#    ${sheet_name} =    Set Variable           ${sheet_keys}[0]
#    ${fields} =        Get From Dictionary    ${workSheetDict}    ${sheet_name}
#    ${rows} =          Read Worksheet         ${sheet_name}       header=False       start=${start_row}


#    IF           '${sheet_name}' == 'Region'
#    FOR          ${item}                        IN    @{rows}
#    Click Add


#    FOR                   ${field}               IN          @{fields}
#    ${column_letter} =    Get From Dictionary    ${field}    column
#    ${field_name} =       Get From Dictionary    ${field}    name
#    ${field_type} =       Get From Dictionary    ${field}    field_type
#    ${value} =            Get From Dictionary    ${item}     ${column_letter}

#    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    Continue For Loop
#    Input Field By Type    ${field_type}                                                                     ${field_name}        ${value}


#    Run Keyword If    '${field_name}' == 'Code'    Append To List    ${region_list}    ${value}
#    END
#    # Click Submit
#    Click Back
#    END

#    END

#    IF                     '${sheet_name}' == 'Detail'
#    FOR                    ${region_code}                 IN    @{region_list}
#    Search In GridTable    ${region_code}

#    FOR                 ${item}                           IN                   @{rows}
#    ${code_region} =    Get From Dictionary               ${item}              A          # Region Code
#    # Run Keyword If    '${code_region}' != '${value}'    Continue For Loop


#    Click Add
#    FOR                   ${field}               IN          @{fields}
#    ${column_letter} =    Get From Dictionary    ${field}    column
#    ${field_name} =       Get From Dictionary    ${field}    name
#    ${field_type} =       Get From Dictionary    ${field}    field_type
#    ${value} =            Get From Dictionary    ${item}     ${column_letter}

#    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    Continue For Loop
#    Input Field By Type    ${field_type}                                                                     ${field_name}        ${value}
#    END
#    # Click Submit
#    Click Back
#    END
#    Click Back
#    END
#    END
#    END

#    Close Workbook





*** Test Cases ***
IFINSYS
    # [Setup]                 Set Selenium Speed    0.2s
    # Open Browser & Login    Danu                  Danu@2
    # Open Modul              Config
    # Open Sidebar Menu       Parent                Common Master File    Child    Province
    ${Sheet1}               Set Variable          Sheet1



    ${Code} =           Create Dictionary    name=Code             column=A          field_type=text
    ${Description} =    Create Dictionary    name=Description      column=B          field_type=text
    ${IsActive} =       Create Dictionary    name=IsActive         column=C          field_type=switch
    ${fieldMap} =       Create List          ${Code}               ${Description}    ${IsActive}
    ${workSheet1} =     Create Dictionary    Region=${fieldMap}


    ${RegionCode} =        Create Dictionary    name=RegionCode        column=A    field_type=text
    ${Code} =              Create Dictionary    name=Code              column=B    field_type=text
    ${Description} =       Create Dictionary    name=Description       column=C    field_type=text
    ${IsActiveDetail} =    Create Dictionary    name=IsActive          column=D    field_type=switch
    ${SILARASOJKCode} =    Create Dictionary    name=SILARASOJKCode    column=E    field_type=text
    ${SLIKOJKCode} =       Create Dictionary    name=SLIKOJKCode       column=F    field_type=text
    ${fieldMap2} =         Create List          ${RegionCode}          ${Code}     ${Description}       ${IsActiveDetail}    ${SILARASOJKCode}    ${SLIKOJKCode}
    ${workSheet2} =        Create Dictionary    Detail=${fieldMap2}


    ${listMapExcel} =    Create List    ${workSheet1}    ${workSheet2}



    Input From Excel RN    files/excel/IFINSYS/Employee.xlsx    2    ${listMapExcel}


    # Input From Excel RN    files/excel/IFINSYS/Employee.xlsx    2












    # [Setup]                 Set Selenium Speed    0.2s
    # Open Browser & Login    Danu                  Danu@2
    # Open Modul              Config
    # Open Sidebar Menu       Parent                Common Master File    Child    Province

    # ${Code} =            Create Dictionary    name=Code           column=A    field_type=text
    # ${Description} =     Create Dictionary    name=Description    column=B    field_type=text
    # ${IsActive} =        Create Dictionary    name=IsActive       column=C    field_type=switch
    # ${Code2} =           Create Dictionary    name=Code           column=C    field_type=switch
    # ${Description2} =    Create Dictionary    name=Description    column=C    field_type=switch

    # ${fields}=             Create List                          ${Code}    ${Description}    ${IsActive}    ${Code2}    ${Description2}
    # Input From Excel RN    files/excel/IFINSYS/Employee.xlsx    2          @{fields}


    # Open Workbook    files/excel/IFINSYS/Employee.xlsx

    # ${sheet_names}    List Worksheets

    # FOR    ${worksheet}    IN    @{sheet_names}
    #     ${worksheet_data}    Read Worksheet    ${worksheet}    header=${TRUE}

    #     # Log the data rows with headers
    #     FOR    ${row}    IN    @{worksheet_data}
    #         ${row_data}    Create Dictionary
    #         FOR    ${key}    ${value}    IN    &{row}
    #             Set To Dictionary    ${row_data}    ${key}=${value}
    #             Input Field By Type     text        ${key}          ${value}
    #         END
    #         Log    ${row_data}
    #     END


    #     Run Keyword If    'Detail' in '${worksheet}'    Log    Worksheet "${worksheet}" contains "Detail"
    # END

    # Close Workbook





    # Open Workbook    files/excel/IFINSYS/Employee.xlsx

    # ${sheet_names}    List Worksheets

    # FOR                  ${worksheet}      IN              @{sheet_names}
    # ${worksheet_data}    Read Worksheet    ${worksheet}

    # Run Keyword If    '${worksheet}' in 'Detail'    Log    Worksheet "${worksheet}" contains "Detail"

    # Log Many    ${worksheet_data}
    # END

    # Close Workbook


    #     ${sheet_names}    List Worksheets
    # Log Many          ${sheet_names}

    # FOR        ${sheet}          IN          @{sheet_names}
    # ${name}    Read Worksheet    ${sheet}

    # FOR    ${item_data}    IN    ${name}

    # FOR    ${data}         IN    ${item_data}
    # Log    ${item_data}
    # END
    # END

    # END

    # Input From Excel Develop


    # [Setup]                 Set Selenium Speed    0.1 seconds
    # Open Browser & Login    Danu                  Danu@1
    # Open Modul              Config

    # # region process
    # Handle Employee Process


    #endregion process

    # Logout