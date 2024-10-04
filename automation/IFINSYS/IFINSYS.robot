*** Settings ***
Resource    Automation/IFINSYS/TestCases/GeneralCode.robot
Resource    resources/Base/ReadDataExcel.robot


*** Test Cases ***
Login IFINSYS
   [Setup]             Set Selenium Speed    0.2 seconds
   Login To IFINSYS

General Code
    Navigate To General Code
    Add New General Code
    # Add New General Code Detail
    # Edit General Code
    # Edit General Code Detail

Excel
    @{field_ids}=    Create List    username-field    email-field    password-field

    # Call the Read Excel Data and Process keyword
    # Read Excel Data and Process    
    # ...                            file_path=files/excel/GeneralCode.xlsx    
    # ...                            sheet_name=Sheet1                         
    # ...                            start_row=2                               
    # ...                            columns_to_read=B, C, D                   
    # ...                            action_keyword=Input Data To Website
    # ...                            action_args=${field_ids}