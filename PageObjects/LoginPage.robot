*** Settings ***
Documentation    Validate the Login Page
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${INVALID_USERNAME}    standard_user_1
${INVALID_PASSWORD}    secret_sauce_1

*** Keywords ***
Open SauceLab Demo Page
    [Documentation]    Open browser and navigate to Login page
    [Tags]    Start    LoginPage
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10s
    Capture Page Screenshot    ../Screenshots/Login_page.png

Login with Valid credential
    [Documentation]    Login with Valid credentials
    [Tags]    Login Page
    Input Text    id=user-name    ${USERNAME}
    Input Password    id=password    ${PASSWORD}
    Click Button    id=login-button
    Page Should Contain    Products
    Capture Page Screenshot    ../Screenshots/SuccessLogin_page.png
    Sleep    3s

Login with Invalid credential
    [Documentation]    Login with Valid credentials
    [Tags]    Login Page
    Input Text    id=user-name    ${INVALID_USERNAME}
    Input Password    id=password    ${INVALID_PASSWORD}
    Click Button    id=login-button
    Page Should Not Contain    Products
    Capture Page Screenshot    ../Screenshots/UnSuccessLogin_page.png
    Sleep    3s
    
Shutdown Automation
    [Documentation]    Shutdown all browser
    [Tags]    Stop
    Close All Browsers