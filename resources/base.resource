*** Settings ***
Documentation    Tudo deve começar nesse arquivo

Library    AppiumLibrary
Library    libs/mongo.py

Resource    ../resources/screens/login.resource
Resource    ../resources/screens/tasks.resource

*** Keywords ***
Start session

    Open Application    http://localhost:4723
    ...                 automationName=uiautomator2
    ...                 platformName=Android
    ...                 deviceName=Emulator
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true
    ...                 app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    Endereço IP da Api    10

Finish session
    Capture Page Screenshot
    Close Application