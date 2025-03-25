*** Keywords ***
Upload Single File
    [Arguments]                      ${file_path}
    Wait Until Element Is Visible    //button[contains(@title, 'Upload')]    5s
    Choose File                      //input[@type='file']                   ${file_path}

Exit Modal
    # Klik blank space untuk menutup modal
    Click element    //div[@class='rz-stack rz-display-flex rz-flex-column rz-align-items-center rz-justify-content-flex-start']