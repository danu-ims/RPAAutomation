*** Settings ***
Documentation       Initialization for Login Task

Resource            resources/keyword.robot
Resource            resources/libraries.robot
Resource            resources/variables.robot


*** Variables ***
${TASK_NAME}    Login


*** Tasks ***
Run Login
    Log    Running ${TASK_NAME}
