*** Settings ***
Documentation     A test suite with a single test for Punpun Signup.

Suite Setup          Open Browser To Home Page
Suite Teardown       Goto Homepage
Resource            resource.robot

*** Test Cases ***
Signup Cases
    Sign up with Punpun
