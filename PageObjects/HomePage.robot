*** Settings ***
Documentation    Add product to the Cart
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Add a Product to the Cart
    [Arguments]    ${Product_name}
    [Documentation]    Adding the Product to the Cart and validate it
    [Tags]    Product Page    Cart Page
    ${Product_xpath}=    Set Variable    //div[@class='inventory_item'][.//div[text()='${Product_name}']]//button[contains(@id,'add-to-cart')]
    Wait Until Element Is Visible    xpath=${Product_xpath}
    Click Button    xpath=${Product_xpath}
    Click Element    id=shopping_cart_container
    Set Browser Implicit Wait    10s
    Page Should Contain    Your Cart
    Capture Page Screenshot    ../Screenshots/Product_Cart_Page.png
    Sleep    3s
    
Add Multiple Product and checkout
     [Arguments]    @{Product_name}
     [Documentation]    Adding multiple Product to the Cart and validate it in the checkout page
     [Tags]    Product Page    Cart Page    Checkout Page
     FOR    ${Product}    IN    @{Product_name}
         ${Product_xpath}=    Set Variable    //div[@class='inventory_item'][.//div[text()='${Product}']]//button[contains(@id,'add-to-cart')]
         Wait Until Element Is Visible    xpath=${Product_xpath}    timeout=5s
         Click Element    xpath=${Product_xpath}
     END
     Click Element    id=shopping_cart_container
     Set Browser Implicit Wait    10s
     Page Should Contain    Your Cart
     Capture Page Screenshot    ../Screenshots/Products_Cart_Page.png
     Sleep    3s

