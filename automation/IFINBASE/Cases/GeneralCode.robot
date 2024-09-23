*** Settings ***
Resource    Resources/Base/BaseKeywords.robot


*** Keywords ***
Login To IFINBASE
    Open Browser & Login    Danu    Danu
    Open Card    Base

Navigate To General Code
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General Code

Add New General Code
    Click Add
    Input Text    Code    AUTCODE016
    Input Text    Description    AUTDESC016
    Click Submit

Add New General Code Detail
    Click Add
    Input Text    Code    AUTCODEDESC016
    Input Text    Description    AUTDESDESCC016
    Input Text    OrderKey    1
    Click Submit
    Click Back

Edit General Code
    #Open To Edit Data
    Input Text    Description    AUTDESDESCC016EDITED
    Click Submit
    Click Change Status     Non Editable

Edit General Code Detail
    Open To Edit Data
    Input Text    Description    AUTDESDESCC016EDITED
    Click Submit
    Click Change Status      Non Active
    Click Back

