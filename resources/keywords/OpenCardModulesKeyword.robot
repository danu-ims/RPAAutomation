*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
# region Open Card IFINCMS
Open Card IFINCMS
    Wait Until Element Contains    //h4[@title="Client Management"]    Client Management
    Click Element    //h4[(contains(text(), "Client Management"))]
# endregion Open Card IFINCMS

# region Open Card IFINSYS

Open Card IFINSYS
    # Wait Until Element Contains    //h4[@title="Client Management"]    Client Management
    # Click Element    //h4[(contains(text(), "Client Management"))]
    Wait Until Element Contains    //h4[@title="Config"]    Config
    Click Element    //h4[(contains(text(), "Config"))]
# endregion Open Card IFINSYS
