*** Settings ***
Library     RPA.Browser.Selenium
Library     Screenshot
Library     OperatingSystem
Library     Process
# Library    ${CURDIR}/BrowserAlert.py


*** Variables ***
${PYAUTOGUI}    import pyautogui

${BASE_URL}     http://147.139.191.88:9003/login
${USERNAME}     Danu
${PASSWORD}     Danu


*** Test Cases ***
Open IFINCMS
    Create Webdriver    Firefox

    Open website
    [Teardown]    Close Browser


*** Keywords ***
Open website
    Open Browser    ${BASE_URL}

    Set Selenium Speed    1 seconds
    Input Text    id:UserName    ${USERNAME}
    Input Password    id:Password    ${PASSWORD}

    Click Button When Visible
    ...    //button[@type="submit"]
    ...

    # Run Keyword And Return    ${PYAUTOGUI}.find_and_click_image    ('images/chromealert/ChromeLoginAlert.PNG')

    Wait Until Element Contains    //h4[@title="CLIENT MANAGEMENT"]    CLIENT MANAGEMENT
    Click Element    //h4[(contains(text(), "CLIENT MANAGEMENT"))]

    Start Process    python    D:\\RPA\\project3\\BrowserAlert.py

    Wait Until Element Contains    //span[(contains(text(), "Setting"))]    Setting
    Click Element    //span[(contains(text(), "Setting"))]

    Wait Until Element Contains    //span[(contains(text(), "General Code"))]    General Code
    Click Element    //span[(contains(text(), "General Code"))]

    Wait Until Element Contains    //span[(contains(text(), "General Code"))]    General Code
    Click Element    //span[(contains(text(), "General Code"))]

    Wait Until Element Contains    //span[(contains(text(), "Add"))]    Add
    Click Element    //span[(contains(text(), "Add"))]

    # Buka Navigasi Setting
    Input Text    Code    AUTOMATION3
    Input Password    Description    "AUTOMATION3 GENERATED"
    Click Button When Visible    //button[@type="submit"]
