*** Settings ***
Resource    ./resources/keywords/BaseKeywords.robot
Resource    ./resources/variables/BaseVariables.robot


*** Variables ***
${File}  D:\RPA\project3\files\fileocr\bankmutation\bcacorporate\BCA_CORPORATE.pdf


*** Test Cases ***
Open AnalysOCR
    Set Selenium Speed                0.2 seconds
    Open Browser To AnalysOCR Page
    Click Button Near Span

Choose File


*** Keywords ***
Click Button Near Span
  Click Element    xpath=//span[@class='upload1']/preceding::button[contains(@class,'rz-button') and .//span[contains(@class,'rz-button-text') and text()='Upload']]

