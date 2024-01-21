*** Settings ***
Documentation    Elementos e ações da tela minhas tarefas

Library    AppiumLibrary

*** Variables ***
${new_task_input}    xpath=//*[contains(@text, "nova tarefa")]
${create_button}    xpath=//*[@resource-id="createTask"]
${confirm_button}    xpath=//android.widget.Button[@text="SIM"]

*** Keywords ***
Create a new task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible        ${new_task_input}

    Input Text    ${new_task_input}    ${task_name}
    Click Element    ${create_button}

Should have task
    [Arguments]    ${task_name}

       
    Wait Until Element Is Visible    xpath=//*[@resource-id="taskText"][@text="${task_name}"]    5 


Remove task by name
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    Wait Until Element Is Visible    ${confirm_button}    5
    Click Element    ${confirm_button}

Finish task
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/..

Task should be done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView