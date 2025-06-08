*** Settings ***
Documentation    Checking the production in Cart Page
Library    SeleniumLibrary

*** Keywords ***
Validate a Product in the Cart
    [Arguments]    ${Product_name}
    Set Browser Implicit Wait    5s
    Page Should Contain    ${Product_name}
    Capture Page Screenshot    ../Screenshots/Cart_Page.png
    Sleep    3s
    
Validate multiple Products the in Cart    
    [Arguments]    @{Products_name}
    FOR    ${Product}    IN    @{Products_name}
        Wait Until Page Contains    ${Product}
        Page Should Contain    ${Product}
    END
    Capture Page Screenshot    ../Screenshots/Cart_Page.png
    Sleep    3s
    Click Element    id=checkout
    Sleep    3s