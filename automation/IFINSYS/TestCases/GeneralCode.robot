*** Settings ***
Resource    Resources/Base/BaseKeywords.robot


*** Keywords ***
Login To IFINSYS
    Open Browser & Login    Danu      Danu
    Open Card               Config

Navigate To General Code
    Open Sidebar Menu    Setting
    Open Sidebar Menu    Menu
    
    # Click Element        xpath=//label[@for='ModuleID' and contains(@class, 'rz-label')]/following::button[1]
    # Click Element        //tr[1]//button[normalize-space()='Select']

    # Click Add
    # Click Lookup

# Add New General Code

#    Open Workbook    files/excel/GeneralCode.xlsx
#    ${rows} =        Read Worksheet                  header=False    start=${3}
#    FOR              ${item}                         IN              @{rows}
#    Click Add
#    Input Field      Code                            ${item['B']}
#    Input Field      Description                     ${item['C']}
#    Click Submit
#    Click Back


#    END
#    Close Workbook
