*** Settings ***
Documentation    Enter the Checkout Your Information and confirm the added products
Library    SeleniumLibrary

*** Variables ***
${FirstName}    VidhyaPrakash
${LastName}    B
${ZipCode}    641004

*** Keywords ***
Add checkout information
    [Documentation]    Enter the Checkout information
    [Tags]    Checkout page
    Input Text    id=first-name    ${FirstName}
    Input Text    id=last-name    ${LastName}
    Input Text    id=postal-code    ${ZipCode}
    Click Element    id=continue
    Sleep    2s
    Wait Until Page Contains    Checkout: Overview    timeout=3s
    Page Should Contain    Checkout: Overview
    

Validate the Products on Checkout
    [Arguments]    @{Products_name}
    [Documentation]    Validate the Products in the Checkout Page
    [Tags]    Checkout page
    FOR    ${Product}    IN    @{Products_name}
        Wait Until Page Contains    ${Product}
        Page Should Contain    ${Product}
    END
    Capture Page Screenshot    ../Screenshots/Checkout_Page.png
    

