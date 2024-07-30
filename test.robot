*** Settings ***
Library     RPA.Browser.Selenium
Library     Screenshot
Library     OperatingSystem
Library     Process
# Library    ${CURDIR}/BrowserAlert.py


*** Variables ***
${PYAUTOGUI}    import pyautogui

${BASE_URL}     http://localhost:5050/login
${USERNAME}     Danu
${PASSWORD}     Danu


*** Test Cases ***
Open
    Create Webdriver    Firefox
    Open website
    [Teardown]    Close Browser


*** Keywords ***
Open website
    Open Browser    ${BASE_URL}
