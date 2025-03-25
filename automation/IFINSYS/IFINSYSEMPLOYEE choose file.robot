*** Settings ***
Resource    resources/Base/BaseKeywords.robot



***Keywords***

Upload File
    [Arguments]                      ${file_path}
    Wait Until Element Is Visible    //button[contains(@title, 'Upload')]    5s
    Choose File                      //input[@type='file']                   ${file_path}




*** Test Cases ***
IFINSYS
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Danu                  Danu@2
    Open Modul              Config
    Open Sidebar Menu       Parent                Company Information    Child    Employee

    Click Add
    # region process

    Upload File    C:\\Users\\Danu\\Documents\\RPAAutomation\\files\\photo\\IFINSYS\\profile.jpg
    # Upload File    C:\\Users\\Danu\\Documents\\RPAAutomation\\files\\photo\\IFINSYS\\profile.jpg

    #endregion process

    # Logout