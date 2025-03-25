

*** Keywords ***
Input From Excel With Detail
    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

    Open Workbook       ${file_path}
    ${region_list} =    Create List 

    ${sheets}                List Worksheets
    ${sheet_count_total}=    Get Length         ${sheets}

    ${first_sheet_flag} =    Set Variable    ${False}                                  # Flag iterasi untuk sheet pertama
    ${first_sheet_name} =    Set Variable    # untuk mendapatkan nama sheet pertama

    ${sheet_count_current_loop} =    Set Variable    0

    FOR                              ${workSheetDict}       IN                                 @{listMapExcel}
        ${sheet_keys} =                  Get Dictionary Keys    ${workSheetDict}
        ${sheet_name} =                  Set Variable           ${sheet_keys}[0]
        ${fields} =                      Get From Dictionary    ${workSheetDict}                   ${sheet_name}
        ${rows} =                        Read Worksheet         ${sheet_name}                      header=False       start=${start_row}
        ${sheet_count_current_loop} =    Evaluate               ${sheet_count_current_loop} + 1

        IF                       ${first_sheet_flag} == ${False}
            ${first_sheet_name} =    Set Variable                       ${sheet_name}
            ${first_sheet_flag} =    Set Variable                       ${True}
        END

        # -------- Sheet 1: Langsung Input Data -------- #
        IF           ${sheet_count_current_loop} == 1
            FOR          ${item}                             IN    @{rows}
                Click Add

                ${first_sheetcode} =    Set Variable

                FOR                   ${field}               IN          @{fields}
                    ${column_letter} =    Get From Dictionary    ${field}    column
                    ${field_name} =       Get From Dictionary    ${field}    name
                    ${field_type} =       Get From Dictionary    ${field}    field_type
                    ${value} =            Get From Dictionary    ${item}     ${column_letter}

                    Run Keyword If    '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    Continue For Loop

                    Input Field By Type    ${field_type}    ${field_name}    ${value}

                    Run Keyword If    "${field_name}" == "Code"
                    ...               Set Test Variable            ${first_sheetcode}    ${value}

                END

                Run Keyword If    '${first_sheetcode}' != ''
                ...               Append To List                ${region_list}    ${first_sheetcode}

                Capture Page Screenshot     EMBED

                Click Back
            END
        END

        # -------- Sheet 2: Pencarian hanya menggunakan Code Sheet 1 -------- #
        IF    ${sheet_count_current_loop} == 2
            FOR    ${item}    IN    @{rows}
                ${code_sheet1} =    Get From Dictionary    ${item}    A  # Ambil Code Sheet 1

                Search In GridTable    ${code_sheet1}  # Pencarian 1 kali dengan Code Sheet 1

                Click Add

                # Input data seperti ke form
                FOR    ${field}    IN    @{fields}
                    ${column_letter} =    Get From Dictionary    ${field}    column
                    ${field_name} =       Get From Dictionary    ${field}    name
                    ${field_type} =       Get From Dictionary    ${field}    field_type
                    ${value} =            Get From Dictionary    ${item}     ${column_letter}

                    Input Field By Type    ${field_type}    ${field_name}    ${value}
                END

                Run Keyword And Ignore Error        Click Back
                Run Keyword And Ignore Error       Click Back
            END
        END

        # -------- Sheet 3: Pencarian dengan Code Sheet 1 dan Code Sheet 2 -------- #
        IF    ${sheet_count_current_loop} == 3
            FOR    ${item}    IN    @{rows}
                ${code_sheet1} =    Get From Dictionary    ${item}    A  # Ambil Code Sheet 1
                ${code_sheet2} =    Get From Dictionary    ${item}    B  # Ambil Code Sheet 2

                Run Keyword And Ignore Error    Search In GridTable    ${code_sheet1}  # Pencarian pertama dengan Code Sheet 1
                Run Keyword And Ignore Error    Search In GridTable    ${code_sheet2}  # Pencarian kedua dengan Code Sheet 2

                Click Add

                FOR    ${field}    IN    @{fields}
                    ${column_letter} =    Get From Dictionary    ${field}    column
                    ${field_name} =       Get From Dictionary    ${field}    name
                    ${field_type} =       Get From Dictionary    ${field}    field_type
                    ${value} =            Get From Dictionary    ${item}     ${column_letter}

                    Input Field By Type    ${field_type}    ${field_name}    ${value}
                END

                Click Back
                Run Keyword And Ignore Error       Click Back
                Run Keyword And Ignore Error       Click Back
            END
        END
    END

    Close Workbook


Input From Excel With Wizard
    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

    Open Workbook       ${file_path}
    ${region_list} =    Create List 

    ${sheets}                List Worksheets
    ${sheet_count_total}=    Get Length         ${sheets}

    ${first_sheet_flag} =    Set Variable    ${False}                                  # Flag iterasi untuk sheet pertama
    ${first_sheet_name} =    Set Variable    # untuk mendapatkan nama sheet pertama

    ${sheet_count_current_loop} =    Set Variable    0

    FOR                              ${workSheetDict}       IN                                 @{listMapExcel}
    ${sheet_keys} =                  Get Dictionary Keys    ${workSheetDict}
    ${sheet_name} =                  Set Variable           ${sheet_keys}[0]
    ${fields} =                      Get From Dictionary    ${workSheetDict}                   ${sheet_name}
    ${rows} =                        Read Worksheet         ${sheet_name}                      header=False       start=${start_row}
    ${sheet_count_current_loop} =    Evaluate               ${sheet_count_current_loop} + 1

    IF                       ${first_sheet_flag} == ${False}
    ${first_sheet_name} =    Set Variable                       ${sheet_name}
    ${first_sheet_flag} =    Set Variable                       ${True}
    END

        # -------- Sheet 1: Langsung Input Data -------- #
    IF           ${sheet_count_current_loop} == 1
    FOR          ${item}                             IN    @{rows}
    Click Add

    ${first_sheetcode} =    Set Variable

    FOR                   ${field}               IN          @{fields}
    ${column_letter} =    Get From Dictionary    ${field}    column
    ${field_name} =       Get From Dictionary    ${field}    name
    ${field_type} =       Get From Dictionary    ${field}    field_type
    ${value} =            Get From Dictionary    ${item}     ${column_letter}

    Run Keyword If    '${field_type}' == 'NONE' or '${field_name}' == 'NONE' or '${value}' == 'NONE'    Continue For Loop

    Input Field By Type    ${field_type}    ${field_name}    ${value}

    Run Keyword If    "${field_name}" == "Code"
    ...               Set Test Variable            ${first_sheetcode}    ${value}

    END

    Run Keyword If    '${first_sheetcode}' != ''
    ...               Append To List                ${region_list}    ${first_sheetcode}

    Click Back
    END
    END

        # -------- Sheet 2: Pencarian hanya menggunakan Code Sheet 1 -------- #
    IF                  ${sheet_count_current_loop} == 2
    FOR                 ${item}                             IN         @{rows}
    ${code_sheet1} =    Get From Dictionary                 ${item}    A          # Ambil Code Sheet 1

    Search In GridTable    ${code_sheet1}    # Pencarian 1 kali dengan Code Sheet 1


    Open Wizard    ${sheet_name}    
    Click Add 

                # Input data seperti ke form
    FOR                   ${field}               IN          @{fields}
    ${column_letter} =    Get From Dictionary    ${field}    column
    ${field_name} =       Get From Dictionary    ${field}    name
    ${field_type} =       Get From Dictionary    ${field}    field_type
    ${value} =            Get From Dictionary    ${item}     ${column_letter}

    Input Field By Type    ${field_type}    ${field_name}    ${value}
    END

    Click Back
    Click Sidebar Toogle    
    Open Wizard             ${first_sheet_name}

    # Click Back
    END
    END

        # -------- Sheet 3: Pencarian dengan Code Sheet 1 dan Code Sheet 2 -------- #
    IF    ${sheet_count_current_loop} == 3

    FOR                 ${item}                IN         @{rows}
    ${code_sheet1} =    Get From Dictionary    ${item}    A          # Ambil Code Sheet 1

    Search In GridTable    ${code_sheet1}    # Pencarian 1 kali dengan Code Sheet 1

    Open Wizard    ${sheet_name}    
    Click Add 

    FOR                   ${field}               IN          @{fields}
    ${column_letter} =    Get From Dictionary    ${field}    column
    ${field_name} =       Get From Dictionary    ${field}    name
    ${field_type} =       Get From Dictionary    ${field}    field_type
    ${value} =            Get From Dictionary    ${item}     ${column_letter}

    Input Field By Type    ${field_type}    ${field_name}    ${value}
    END

    Click Back
    Click Sidebar Toogle    
    Open Wizard             ${first_sheet_name}

    END
    END
    END

    Close Workbook