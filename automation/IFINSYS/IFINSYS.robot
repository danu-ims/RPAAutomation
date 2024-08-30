*** Settings ***
Resource    cases/Authentication/login.robot
Resource    ../../resources/keywords/modules/IFINSYS/SidenavIFINSYSKeyword.robot
Resource    cases/Branch.robot


*** Variables ***
${Code} =           FakerLibrary.Generate Random Number
${BranchName} =     FakerLibrary.Generate Random City
${PhoneNumber} =    FakerLibrary.Generate Random Phone Number
${FaxNumber} =      FakerLibrary.Generate Random Phone Number
${Email} =          FakerLibrary.Generate Random Email
${Address}=         FakerLibrary.Generate Random Address


*** Test Cases ***
Login IFINSYS
    Set Selenium Speed    0.2 seconds
    Valid User Can Login IFINSYS

# Open Card IFINSYS
#    Open Card IFINSYS

automation Branch
    Open Sidebar Menu Company Information
    Open Branch List
    Add Branch
    Insert Branch Info
    ...    0003
    ...    ${BranchName}
    ...    62
    ...    ${PhoneNumber}
    ...    021
    ...    ${FaxNumber}
    ...    ${Email}
    ...    ${Address}

    # Logout
    # BaseKeywords.Close Browser
