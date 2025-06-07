*** Settings ***
Documentation    Test Suit for SauceLab Demo Login

Resource    ../PageObjects/LoginPage.robot

*** Test Cases ***
TestCase-1
    Open SauceLab Demo Page
    Login With Valid Credential
    Shutdown Automation

TestCase-2
    Open SauceLab Demo Page
    Login With Invalid Credential
    Shutdown Automation
