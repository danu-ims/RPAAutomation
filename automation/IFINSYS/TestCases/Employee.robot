*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate To Employee
    Open Sidebar Menu    Parent    System Setting    Child    Report    

Add New Employee
    ${Name} =    Create Dictionary    name=Name    column=A    field_type=radio
    # ${Description} =    Create Dictionary    name=DateOfBirth    column=B    field_type=date
    # ${Colour} =         Create Dictionary    name=Colour         column=C    field_type=colour


    ${fields}=          Create List                          ${Name}    ${Description}    ${Colour}    
    Input From Excel    files/excel/IFINSYS/Employee.xlsx    2          @{fields}


Handle Employee Process
    Navigate To Employee
    Add New Employee
