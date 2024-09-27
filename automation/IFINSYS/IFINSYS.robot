*** Settings ***
Resource    Automation/IFINSYS/TestCases/GeneralCode.robot
Resource    resources/Base/ReadDataExcel.robot


*** Test Cases ***
# Login IFINSYS
#    [Setup]             Set Selenium Speed    0.2 seconds
#    Login To IFINSYS

# General Code
#    Navigate To General Code
#    Add New General Code

Excel
    Read Excel Data