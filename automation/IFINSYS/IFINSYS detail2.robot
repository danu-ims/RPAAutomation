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


# Input From Excel RN
#    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

#    Open Workbook    ${file_path}

#    ${workSheet1} =       Get From List          ${listMapExcel}     0
#    ${region_sheet} =     Get Dictionary Keys    ${workSheet1}[0]
#    ${region_fields} =    Get From Dictionary    ${workSheet1}       ${region_sheet}

#    ${workSheet2} =       Get From List          ${listMapExcel}     1
#    ${detail_sheet} =     Get Dictionary Keys    ${workSheet2}[0]
#    ${detail_fields} =    Get From Dictionary    ${workSheet2}       ${detail_sheet}

#    # Process Region Sheet First
#    ${rows_region} =                Read Worksheet    ${region_sheet}             header=False    start=${start_row}
#    ${added_regions} =              Create List       # To store added regions

#    FOR                 ${item}         IN      @{rows_region}
#    Click Add
#    ${last_region} =    Set Variable    None    # Store last inserted region

#    FOR                   ${field}               IN          @{region_fields}
#    ${column_letter} =    Get From Dictionary    ${field}    column
#    ${field_name} =       Get From Dictionary    ${field}    name
#    ${field_type} =       Get From Dictionary    ${field}    field_type
#    ${value} =            Get From Dictionary    ${item}     ${column_letter}

#    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE
#    Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}

#    ${last_region} =    Set Variable    ${value}    # Store last inserted region
#    END

#    Click Submit
#    Click Back
#    Append To List    ${added_regions}    ${last_region}    # Store for later use
#    END

#    # Process Detail Sheet - Find Region and Add Details
#    ${rows_detail} =                                        Read Worksheet    ${detail_sheet}    header=False    start=${start_row}

#    FOR                    ${region}    IN                                @{added_regions}
#    Search In GridTable    ${region}    # Find the region in the table
#    Click Found Region     ${region}    # Click to open region details

#    FOR                 ${item}                IN         @{rows_detail}
#    ${region_code} =    Get From Dictionary    ${item}    A                 # First column in Detail Sheet

#    Run Keyword If    '${region_code}' != '${region}'    CONTINUE    # Skip details not belonging to this region

#    Click Add

#    FOR                   ${field}               IN          @{detail_fields}
#    ${column_letter} =    Get From Dictionary    ${field}    column
#    ${field_name} =       Get From Dictionary    ${field}    name
#    ${field_type} =       Get From Dictionary    ${field}    field_type
#    ${value} =            Get From Dictionary    ${item}     ${column_letter}

#    Run Keyword If         '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    CONTINUE
#    Input Field By Type    ${field_type}                                                                     ${field_name}    ${value}
#    END

#    Click Submit
#    END
#    Click Back      # Return to search for the next region
#    END

#    Close Workbook




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
#     [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

#     Open Workbook       ${file_path}
#     ${region_list} =    Create List 

#     ${sheets}                List Worksheets
#     ${sheet_count_total}=    Get Length         ${sheets}

#     ${first_sheet_flag} =    Set Variable    ${False}                                  # Flag iterasi untuk sheet pertama
#     ${first_sheet_name} =    Set Variable    # untuk mendapatkan nama sheet pertama

#     ${sheet_count_current_loop} =    Set Variable    0

#     FOR                              ${workSheetDict}       IN                                 @{listMapExcel}
#         ${sheet_keys} =                  Get Dictionary Keys    ${workSheetDict}
#         ${sheet_name} =                  Set Variable           ${sheet_keys}[0]
#         ${fields} =                      Get From Dictionary    ${workSheetDict}                   ${sheet_name}
#         ${rows} =                        Read Worksheet         ${sheet_name}                      header=False       start=${start_row}
#         ${sheet_count_current_loop} =    Evaluate               ${sheet_count_current_loop} + 1

#         IF                       ${first_sheet_flag} == ${False}
#             ${first_sheet_name} =    Set Variable                       ${sheet_name}
#             ${first_sheet_flag} =    Set Variable                       ${True}
#         END

#         # -------- Sheet 1: Langsung Input Data -------- #
#         IF           ${sheet_count_current_loop} == 1
#             FOR          ${item}                             IN    @{rows}
#                 Click Add

#                 ${first_sheetcode} =    Set Variable

#                 FOR                   ${field}               IN          @{fields}
#                     ${column_letter} =    Get From Dictionary    ${field}    column
#                     ${field_name} =       Get From Dictionary    ${field}    name
#                     ${field_type} =       Get From Dictionary    ${field}    field_type
#                     ${value} =            Get From Dictionary    ${item}     ${column_letter}

#                     Run Keyword If    '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    Continue For Loop

#                     Input Field By Type    ${field_type}    ${field_name}    ${value}

#                     Run Keyword If    "${field_name}" == "Code"
#                     ...               Set Test Variable            ${first_sheetcode}    ${value}

#                 END

#                 Run Keyword If    '${first_sheetcode}' != ''
#                 ...               Append To List                ${region_list}    ${first_sheetcode}

#                 Click Back
#             END
#         END

#         # -------- Sheet 2: Pencarian hanya menggunakan Code Sheet 1 -------- #
#         IF    ${sheet_count_current_loop} == 2
#             FOR    ${item}    IN    @{rows}
#                 ${code_sheet1} =    Get From Dictionary    ${item}    A  # Ambil Code Sheet 1

#                 Search In GridTable    ${code_sheet1}  # Pencarian 1 kali dengan Code Sheet 1

#                 Click Add

#                 # Input data seperti biasa
#                 FOR    ${field}    IN    @{fields}
#                     ${column_letter} =    Get From Dictionary    ${field}    column
#                     ${field_name} =       Get From Dictionary    ${field}    name
#                     ${field_type} =       Get From Dictionary    ${field}    field_type
#                     ${value} =            Get From Dictionary    ${item}     ${column_letter}

#                     Input Field By Type    ${field_type}    ${field_name}    ${value}
#                 END

#                 Click Back
#                 Click Back
#             END
#         END

#         # -------- Sheet 3: Pencarian dengan Code Sheet 1 dan Code Sheet 2 -------- #
#         IF    ${sheet_count_current_loop} == 3
#             FOR    ${item}    IN    @{rows}
#                 ${code_sheet1} =    Get From Dictionary    ${item}    A  # Ambil Code Sheet 1
#                 ${code_sheet2} =    Get From Dictionary    ${item}    B  # Ambil Code Sheet 2

#                 Search In GridTable    ${code_sheet1}  # Pencarian pertama dengan Code Sheet 1
#                 Search In GridTable    ${code_sheet2}  # Pencarian kedua dengan Code Sheet 2

#                 Click Add

#                 FOR    ${field}    IN    @{fields}
#                     ${column_letter} =    Get From Dictionary    ${field}    column
#                     ${field_name} =       Get From Dictionary    ${field}    name
#                     ${field_type} =       Get From Dictionary    ${field}    field_type
#                     ${value} =            Get From Dictionary    ${item}     ${column_letter}

#                     Input Field By Type    ${field_type}    ${field_name}    ${value}
#                 END

#                 Click Back
#                 Click Back
#                 Click Back
#             END
#         END
#     END

#     Close Workbook










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





*** Test Cases ***
IFINSYS
    [Setup]                 Set Selenium Speed    0.2s
    Open Browser & Login    Danu                  Danu@2
    Open Modul              Config
    Open Sidebar Menu       Parent                System Setting    Child    General Code
    ${Sheet1}               Set Variable          Sheet1


    ${Code} =           Create Dictionary    name=Code           column=A    field_type=text
    ${Description} =    Create Dictionary    name=Description    column=B    field_type=text
    ${IsEditable} =     Create Dictionary    name=IsEditable     column=C    field_type=switch

    ${fieldMap} =      Create List          ${Code}                     ${Description}    ${IsEditable}
    ${workSheet1} =    Create Dictionary    General Code=${fieldMap}


    ${GeneralCode} =    Create Dictionary    name=GeneralCode    column=A    field_type=text

    ${Code} =              Create Dictionary    name=Code              column=B    field_type=text
    ${Description} =       Create Dictionary    name=Description       column=C    field_type=text
    ${IsActiveDetail} =    Create Dictionary    name=IsActive          column=D    field_type=switch
    ${SLIKOJKCode} =       Create Dictionary    name=SLIKOJKCode       column=E    field_type=text
    ${SILARASOJKCode} =    Create Dictionary    name=SILARASOJKCode    column=F    field_type=text
    ${OrderKey} =          Create Dictionary    name=OrderKey          column=G    field_type=text

    ${fieldMap2} =     Create List          ${GeneralCode}                   ${Code}    ${Description}    ${IsActiveDetail}    ${SLIKOJKCode}    ${SLIKOJKCode}    ${SILARASOJKCode}    ${OrderKey}
    ${workSheet2} =    Create Dictionary    Sub General Code=${fieldMap2}



    ${GenealCode} =        Create Dictionary    name=GenealCode        column=A    field_type=text
    ${SubGeneralCode} =    Create Dictionary    name=SubGeneralCode    column=B    field_type=text

    ${Code} =              Create Dictionary    name=Code              column=C    field_type=text
    ${Description} =       Create Dictionary    name=Description       column=D    field_type=text
    ${IsActiveDetail} =    Create Dictionary    name=IsActive          column=E    field_type=switch
    ${SLIKOJKCode} =       Create Dictionary    name=SLIKOJKCode       column=F    field_type=text
    ${SILARASOJKCode} =    Create Dictionary    name=SILARASOJKCode    column=G    field_type=text
    ${OrderKey} =          Create Dictionary    name=OrderKey          column=H    field_type=text

    ${fieldMap3} =     Create List          ${SubGeneralCode}                       ${Code}    ${Description}    ${IsActiveDetail}    ${SLIKOJKCode}    ${SLIKOJKCode}    ${SILARASOJKCode}    ${OrderKey}
    ${workSheet3} =    Create Dictionary    Sub General Code Detail=${fieldMap2}


    ${listMapExcel} =    Create List    ${workSheet1}    ${workSheet2}    ${workSheet3}



    Input From Excel RN    files/excel/IFINSYS/General Code.xlsx    2    ${listMapExcel}


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