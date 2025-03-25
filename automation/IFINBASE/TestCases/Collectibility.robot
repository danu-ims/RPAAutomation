*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate To Collectibility
    # Open Sidebar Menu    Setting
    # Open Sidebar Menu    Collectibility
    Open Sidebar Menu    Parent    Setting    Child    Collectibility

Add New Collectibility
    ${DateTime} =    Create Dictionary    name=Date Time    column=A    field_type=date

    ${fields}=          Create List                                 ${DateTime}
    Input From Excel    files/excel/IFINBASE/Collectibility.xlsx    2              @{fields}


Handle Collectibility Process
    Navigate To Collectibility
    Add New Collectibility
