*** Settings ***
Library    RPA.Excel.Files
Library    OperatingSystem
Library    String
Library    Collections

*** Variables ***
@{EXCEL_FILES}    files/excel/IFINLOS/AmortizationType.xlsx    files/excel/IFINLOS/GeneralCode.xlsx         files/excel/IFINLOS/GLLink.xlsx
${OUTPUT_PATH}    files/excel/scenario_input_form.robot
${OUTPUT_PATH_EXCEL}    files/excel/scenario_input_form.xlsx
${TABS}    ${SPACE}${SPACE}${SPACE}${SPACE}
&{header_counts}




*** Tasks ***
Generate Combined .robot From Multiple Excels
    ${all_headers}=    Create Dictionary
    ${titles} =         Get File Titles 
   

    #Generate excel first
    FOR    ${file}    IN    @{EXCEL_FILES}
        Open Workbook    ${file}
        #get header value and save to list of data
        ${headers}=    Get File Headers    ${file}
        
        
        @{all_headers}=    Create List    @{all_headers}    @{headers} 
        #get header value and save to list of data

        Close Workbook
    END
        
    Create Output File    ${all_headers}        ${titles}
    #Generate excel first

    #Generate Robot File
    Create File    ${OUTPUT_PATH}    content=*** Settings ***\n
    Append To File    ${OUTPUT_PATH}    Library${SPACE}${SPACE}${SPACE}${SPACE}SeleniumLibrary\n\n
    Append To File    ${OUTPUT_PATH}    *** Test Cases ***\n
    Append To File    ${OUTPUT_PATH}    Scenario Input Form\n

    Append To File    ${OUTPUT_PATH}        ${TABS}Open Workbook${TABS}${OUTPUT_PATH_EXCEL}\n 
    Append To File    ${OUTPUT_PATH}            ${TABS}$\{rows\}${TABS}Read Worksheet${TABS}header=True${TABS}start=2\n
    Append To File    ${OUTPUT_PATH}            ${TABS}$\{current_parent\}=${TABS}Set Variable${TABS}$\{EMPTY\}\n

    Append To File    ${OUTPUT_PATH}   ${TABS}FOR${TABS}$\{item\}${TABS}IN${TABS}$\{rows\}\n


    Append To File    ${OUTPUT_PATH}    ${TABS}END\n

    FOR    ${index}    ${header}    IN ENUMERATE    @{all_headers}    start=1
        Append To File      ${OUTPUT_PATH}      ${TABS}$\{${header}${index}\}=${TABS}Set Variable${TABS}$\{item[${header}\]}\n
    END
    
    FOR    ${index}    ${header}    IN ENUMERATE    @{all_headers}    start=1
        IF      ${index} == 1
            Append To File      ${OUTPUT_PATH}      ${TABS}IF${TABS}"$\{${header}1\}" != $\{EMPTY\}\ and ${TABS}"$\{${header}1\}" != $\{current_parent\}\ and "$\{${header}1\}" != "None"\n
            Append To File    ${OUTPUT_PATH}    ${TABS}Run Keyword IF${TABS}$\{current_parent\}\ != $\{EMPTY\}\ ${TABS} Click Back\n
        END
    END
    Append To File    ${OUTPUT_PATH}    ${TABS}Click Add\n
    FOR    ${index}    ${header}    IN ENUMERATE    @{all_headers}    start=1
            Append To File    ${OUTPUT_PATH}    ${TABS}Input Field${TABS}${header}${TABS}$\{${header}${index}\}\n
    END
    Append To File    ${OUTPUT_PATH}    ${TABS}END\n
    Append To File    ${OUTPUT_PATH}    ${TABS}Click Button${TABS}Submit\n
    #Generate Robot File

*** Keywords ***
Get File Headers
    [Arguments]    ${file}
    [Documentation]    Extracts headers from the first row of an Excel file
    Open Workbook    ${file}
    ${worksheet}=    Read Worksheet     start=${2}
    Close Workbook

    
    
    # Get headers from the first row
    ${headers}=    Create List
    ${first_row}=    Set Variable    ${worksheet}[0]    
    FOR    ${key}    IN    @{first_row.keys()}
        ${value}=    Set Variable    ${first_row}[${key}]
        # Only add non-empty headers
        IF    "${value}" != "None" and "${value}" != "${EMPTY}"
            Append To List    ${headers}    ${value}
        END
    END

 


      

    
    [Return]    ${headers}     

Get File Titles

    ${titles}=    Create List
    FOR    ${file}    IN    @{EXCEL_FILES}
        Open Workbook    ${file}
        Set Active Worksheet    Sheet1
        ${cell_value}=    Get Cell Value    1    1
        Append To List    ${titles}    ${cell_value}
        Close Workbook
    END
    
    [Return]    ${titles}      

Create Output File
    [Arguments]    ${headers}       ${titles}
    [Documentation]    Creates and writes the combined headers to the output file

    Log         ${titles}
    # aaa
    # Create new workbook
    Create Workbook    ${OUTPUT_PATH_EXCEL}
    Create Worksheet    headers

    
    # FOR    ${index}    ${title}    IN    @{titles}    start=1
    #     # Assuming your worksheet name is set elsewhere, or set it as 'Sheet1'
    #     Set Cell Value    Sheet1    2    ${index}    ${title}
    # END

    FOR     ${index}       ${file}    IN ENUMERATE    @{titles}   start=1
        Log    Value in A1 for ${file}
        Set Cell Value    1    ${index}    ${file}
       
    END


    FOR    ${index}    ${header}    IN ENUMERATE    @{headers}    start=1
        Set Cell Value    3    ${index}    ${header}
        Log         ${header}
    END
    
    Save Workbook
    Close Workbook