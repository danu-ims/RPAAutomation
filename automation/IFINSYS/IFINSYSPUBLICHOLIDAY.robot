*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Keywords ***
Input From Excel RN
    [Arguments]    ${file_path}    ${start_row}    ${listMapExcel}

    Open Workbook     ${file_path}
    ${list_data} =    Create List 

    ${sheets} =               List Worksheets
    ${sheet_count_total} =    Get Length         ${sheets}

    ${first_sheet_flag} =            Set Variable    False                                     # Flag iterasi untuk sheet pertama
    ${first_sheet_name} =            Set Variable    # Untuk mendapatkan nama sheet pertama
    ${sheet_count_current_loop} =    Set Variable    0

    FOR                              ${workSheetDict}       IN                                 @{listMapExcel}
    ${sheet_keys} =                  Get Dictionary Keys    ${workSheetDict}
    ${sheet_name} =                  Set Variable           ${sheet_keys}[0]
    ${fields} =                      Get From Dictionary    ${workSheetDict}                   ${sheet_name}
    ${rows} =                        Read Worksheet         ${sheet_name}                      header=False       start=${start_row}
    ${sheet_count_current_loop} =    Evaluate               ${sheet_count_current_loop} + 1

    IF                       $first_sheet_flag == False
    ${first_sheet_name} =    Set Variable                  ${sheet_name}
    ${first_sheet_flag} =    Set Variable                  True
    END

        # -------- Sheet 1: Langsung Input Data -------- #
    IF                      ${sheet_count_current_loop} == 1
    FOR                     ${item}                             IN    @{rows}
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
    ...               Append To List                ${list_data}    ${first_sheetcode}

    Click Back
    END
    END

        # -------- Sheet 2: Pencarian hanya menggunakan Code Sheet 1 -------- #
        # Mendapatkan code pertama dari sheet 2.
        # Jika baris excel kedua memiliki kode sama dengan kode sebelumnya, maka lanjut select data
    IF    ${sheet_count_current_loop} == 2

    ${flag_firstcode2} =    Set Variable    False
            # ${firstcode2} =         Set Variable    ${None}

    FOR                ${item}                IN         @{rows}
    ${code_sheet} =    Get From Dictionary    ${item}    A          # Ambil Code Sheet 1
                # IF    $flag_firstcode2 == False
                #     ${flag_firstcode2} =    Set Variable    True
                #     ${firstcode2} =       Get From Dictionary    ${item}    A
                # END

                # Click Add

    Search In GridTable    ${code_sheet}    # Pencarian 1 kali dengan Code Sheet 1

    FOR                   ${field}               IN          @{fields}
    ${column_letter} =    Get From Dictionary    ${field}    column
    ${field_name} =       Get From Dictionary    ${field}    name
    ${field_type} =       Get From Dictionary    ${field}    field_type
    ${value} =            Get From Dictionary    ${item}     ${column_letter}

    Input Field By Type    ${field_type}    ${field_name}    ${value}
    END

                # Click Back
                # Click Back
    END
    END
    END

    Close Workbook
    Close Workbook



Input From Excel RNN
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
    Click Back
    END
    END

        # -------- Sheet 3: Pencarian dengan Code Sheet 1 dan Code Sheet 2 -------- #
    IF                  ${sheet_count_current_loop} == 3
    FOR                 ${item}                             IN         @{rows}
    ${code_sheet1} =    Get From Dictionary                 ${item}    A          # Ambil Code Sheet 1
    ${code_sheet2} =    Get From Dictionary                 ${item}    B          # Ambil Code Sheet 2

    Search In GridTable    ${code_sheet1}    # Pencarian pertama dengan Code Sheet 1
    Search In GridTable    ${code_sheet2}    # Pencarian kedua dengan Code Sheet 2

    Click Add

    FOR                   ${field}               IN          @{fields}
    ${column_letter} =    Get From Dictionary    ${field}    column
    ${field_name} =       Get From Dictionary    ${field}    name
    ${field_type} =       Get From Dictionary    ${field}    field_type
    ${value} =            Get From Dictionary    ${item}     ${column_letter}

    Input Field By Type    ${field_type}    ${field_name}    ${value}
    END

    Click Back
    Click Back
    Click Back
    END
    END
    END

    Close Workbook



*** Test Cases ***
IFINSYS
    [Setup]                 Set Selenium Speed    0.2s
    Open Browser & Login    Danu                  Danu@1
    Open Modul              Config
    Open Sidebar Menu       Parent                Common Master File    Child    Public Holiday

    ${Description} =    Create Dictionary    name=Description    column=A    field_type=text
    ${IsActive} =       Create Dictionary    name=IsActive       column=B    field_type=switch
    ${HolidayDate} =    Create Dictionary    name=HolidayDate    column=C    field_type=date

    ${fieldMap} =      Create List          ${Description}                ${IsActive}    ${HolidayDate}
    ${workSheet1} =    Create Dictionary    Public Holiday=${fieldMap}


    ${PublicHolidayCode} =    Create Dictionary    name=PublicHolidayCode    column=A    field_type=text
    ${Code} =                 Create Dictionary    name=Description          column=B    field_type=multilookup

    ${fieldMap2} =     Create List          ${PublicHolidayCode}        ${Code}
    ${workSheet2} =    Create Dictionary    Branch List=${fieldMap2}


    ${listMapExcel} =    Create List    ${workSheet1}    ${workSheet2}    



    Input From Excel With Detail    files/excel/IFINSYS/Public Holiday.xlsx    2    ${listMapExcel}













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