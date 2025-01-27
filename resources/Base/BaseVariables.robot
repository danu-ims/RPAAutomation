*** Settings ***
Library      SeleniumLibrary
Library      RPA.Excel.Files
Library      OperatingSystem
Library      RPA.Excel
Library      RPA.Tables
Library      DateTime
Library      BuiltIn
# Library    String
Library      Collections        # Needed for dictionary operations


*** Variables ***
${BASEURL}      http://8.215.19.169:9100/
#${BASEURL}     http://localhost:5045/
# ${IFINCMS}    http://localhost:5050/login

