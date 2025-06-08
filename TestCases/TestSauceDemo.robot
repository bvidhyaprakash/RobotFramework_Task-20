*** Settings ***
Documentation    Test Suit for SauceLab Demo Login

Resource    ../PageObjects/LoginPage.robot
Resource    ../PageObjects/HomePage.robot
Resource    ../PageObjects/CartPage.robot
Resource    ../PageObjects/CheckoutPage.robot


*** Variables ***
${Product}=    Sauce Labs Backpack
@{Products}=    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Fleece Jacket


*** Test Cases ***
TestCase-1
    Open SauceLab Demo Page
    Login With Valid Credential
    Shutdown Automation

TestCase-2
    Open SauceLab Demo Page
    Login With Invalid Credential
    Shutdown Automation

TestCase-3
    Open SauceLab Demo Page
    Login With Valid Credential
    Add A Product To The Cart    ${Product}
    Validate A Product In The Cart    ${Product}
    Shutdown Automation
    
TestCase-4
    Open SauceLab Demo Page
    Login With Valid Credential
#    @{Products}=    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Fleece Jacket
    Add Multiple Product And Checkout    @{Products}
    Validate Multiple Products The In Cart    @{Products}
    Add Checkout Information
    Validate The Products On Checkout    @{Products}
    Shutdown Automation
