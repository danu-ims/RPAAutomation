*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
# region Open AnalysOCR
Open Browser To AnalysOCR Page
    Create Webdriver           Firefox
    Open Browser               http://localhost:5050/
    Maximize Browser Window
# endregion Open AnalysOCR
