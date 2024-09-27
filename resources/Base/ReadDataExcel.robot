*** Settings ***
Library    RPA.Excel.Files

***Variables***
${data}
@{rows}    Code    Description    IsEditable

*** Keywords ***
Read Excel Data
    # Open Workbook     files/excel/GeneralCode.xlsx
    # ${data}           Read Worksheet    Sheet1    range=B3:D9
    # ${cell_value}     Set Variable                    ${data}[A1]
    # Log               ${cell_value}
    # Close Workbook


    Open Workbook    files/excel/GeneralCode.xlsx
    ${sheet_data} =    Read Worksheet    Sheet1    range=B3:D9
    ${row_count} =    Get Length    ${sheet_data}
    Log    Read ${row_count} rows from range B3:D9 on Sheet1
    FOR    ${row}    IN    @{sheet_data}
        Log    Full row data: ${row}
        FOR    ${key}    ${value}    IN    &{row}
            Log    Column: ${key}, Value: ${value}
        END
    END
    Close Workbook