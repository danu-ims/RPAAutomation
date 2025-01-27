*** Settings ***
Resource    resources/Base/BaseKeywords.robot

*** Keywords ***
Navigate To Chart Of Account
    Open Sidebar Menu    Setting
    Open Sidebar Menu    Chart Of Account

Add New Chart Of Account
    ${AccountNo} =          Create Dictionary    name=AccountNo          column=A    field_type=text
    ${AccountName} =        Create Dictionary    name=AccountName        column=B    field_type=text
    ${IsActive} =           Create Dictionary    name=IsActive           column=C    field_type=switch
    ${AccountBankType} =    Create Dictionary    name=AccountBankType    column=D    field_type=ddl
    ${AccountLevel} =       Create Dictionary    name=AccountLevel       column=E    field_type=text
    ${IsHeaderAccount} =    Create Dictionary    name=IsHeaderAccount    column=F    field_type=switch
    ${AccountType} =        Create Dictionary    name=AccountType        column=G    field_type=radio
    ${IsJm} =               Create Dictionary    name=IsJm               column=H    field_type=switch
    ${ParentAccountNO} =    Create Dictionary    name=ParentAccountNO    column=I    field_type=lookup

    ${fields}=          Create List                                  ${AccountNo}    ${AccountName}    ${IsActive}    ${AccountBankType}    ${AccountLevel}    ${IsHeaderAccount}    ${AccountType}   ${IsJm}    ${ParentAccountNO}     
    Input From Excel    files/excel/IFINACC/Chart Of Account.xlsx    2               @{fields}


Handle Chart Of Account Process
    Navigate To Chart Of Account
    Add New Chart Of Account
