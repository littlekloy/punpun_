*** Settings ***
Documentation     A test suite with a single test for Punpun Login Function.

Suite Setup          Open Browser To Home Page
Suite Teardown       Goto Homepage
Resource            resource.robot

*** Test Cases ***
Login Function
    Login
