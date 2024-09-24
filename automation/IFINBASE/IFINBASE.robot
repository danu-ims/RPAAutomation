*** Settings ***
Resource   Automation/IFINBASE/Cases/GeneralCode.robot
Resource   Automation/IFINBASE/Cases/Benchmark.robot
Resource   Automation/IFINBASE/Cases/OJKReference.robot


*** Test Cases ***
#General Code
    #[Setup]    Set Selenium Speed    0.2 seconds
    #Login To IFINBASE
    #Navigate To General Code
    #Add New General Code
    #Add New General Code Detail
    #Edit General Code
    #Edit General Code Detail

#Benchmark
    #[Setup]    Set Selenium Speed    0.2 seconds
    #Login To IFINBASE
    #Navigate To Benchmark
    #Click Check
    #Add New Benchmark
    #Add New Benchmark Detail
    #Edit Benchmark
    #Edit Benchmark Detail

OJK Reference
    [Setup]    Set Selenium Speed    0.2 seconds
    Login To IFINBASE
    Navigate To OJK Reference

