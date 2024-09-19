*** Settings ***
Library    RPA.Excel.Files
Library    OperatingSystem

*** Keywords ***
Insert Data Into Excel
    [Arguments]    ${original_file}    ${working_file}    ${start_row}    @{data}
    Copy File    ${original_file}    ${working_file}
    Open Workbook    ${working_file}
    ${row}=    Set Variable    ${start_row}
    FOR    ${i}    IN RANGE    0    ${data.__len__()}    5
        @{row_data}    Create List    ${data}[${i}]    ${data}[${i+1}]    ${data}[${i+2}]    ${data}[${i+3}]    ${data}[${i+4}]
        Set Row Values    ${row}    @{row_data}
        ${row}=    Evaluate    ${row} + 1
    END
    Save Workbook
    Close Workbook
    Remove File    ${original_file}
    Move File    ${working_file}    ${original_file}

Set Row Values
    [Arguments]    ${row}    @{values}
    Set Cell Value    ${row}    1    ${values}[0]
    Set Cell Value    ${row}    2    ${values}[1]
    Set Cell Value    ${row}    3    ${values}[2]
    Set Cell Value    ${row}    4    ${values}[3]
    Set Cell Value    ${row}    5    ${values}[4]