*** Settings ***
Resource    Resources/Base/BaseKeywords.robot


*** Keywords ***
Login To IFINSYS
    Open Browser & Login    Danu    Danu
    Open Card               Config

Navigate To General Code
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General Code

Add New General Code

    Open Workbook    files/excel/GeneralCode.xlsx
    ${rows} =        Read Worksheet                  header=False    start=${3}
    FOR              ${item}                         IN              @{rows}
    Click Add
    Input Field     Code           ${item['B']}
    Input Field      Description    ${item['C']}
    Click Submit
    Open Sidebar Menu    General Code

    # Log              ${item['B'][1]}
    # Log              ${item['C']}
    # Log              ${item['D']}

    END
    Close Workbook
    