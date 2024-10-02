*** Settings ***
Library    SeleniumLibrary
Library    RPA.Excel.Files
Library    SeleniumLibrary
Library    OperatingSystem
Library    RPA.Tables
Library    String

*** Keywords ***
Read Excel Data and Process

    Create Webdriver                 Firefox
    Open Browser                     ${BASEURL}
    Maximize Browser Window
    Wait Until Element Is Visible    id:UserName


    Open Workbook    files/excel/GeneralCode.xlsx
    ${rows} =        Read Worksheet                  header=False    start=${3}
    FOR              ${item}                         IN              @{rows}
    Input Text       id:UserName                     ${item['B']}
    Log              ${item['B'][1]}
    Log              ${item['C']}
    Log              ${item['D']}

    END
    Close Workbook

    # Open Workbook     files/excel/GeneralCode.xlsx
    # ${data}           Read Worksheet    Sheet1    range=B3:D9
    # ${cell_value}     Set Variable                    ${data}[A1]
    # Log               ${cell_value}
    # Close Workbook


    # Open Workbook    files/excel/GeneralCode.xlsx
    # ${sheet_data} =    Read Worksheet    Sheet1    range=B3:D9
    # ${row_count} =    Get Length    ${sheet_data}
    # Log    Read ${row_count} rows from range B3:D9 on Sheet1
    # FOR    ${row}    IN    @{sheet_data}
    #     Log    Full row data: ${row}
    #     FOR    ${key}    ${value}    IN    &{row}
    #         Log    Column: ${key}, Value: ${value}
    #     END
    # END
    # Close Workbook