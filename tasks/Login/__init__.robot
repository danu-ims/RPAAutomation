*** Settings ***
Documentation       Initialization for Login Task

Resource            resources/keyword.robot
Resource            resources/libraries.robot
Resource            resources/variables.robot


*** Variables ***
${taskName}     Login Initialization


*** Keywords ***
Log    Initialization ${taskName}
