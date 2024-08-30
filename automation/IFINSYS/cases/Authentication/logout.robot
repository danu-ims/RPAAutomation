*** Settings ***
Resource    resources/keywords/BaseKeywords.robot
Resource    resources/variables/BaseVariables.robot


*** Keywords ***
Logout
    # Click Element    id=logout

    Execute Javascript    document.getElementById('logout').click()
    # Click Element
    # ...    xpath= //html/body/div[2]/main/div/div/ul/li/div/div/div/div/div/i/html/body/div[2]/main/div/div/ul/li/div/div/div/div/div/i[(contains(text(), 'account_circle'))]

    # Click Element    //i[(contains(text(), 'account_circle'))]
