*** Settings ***
Documentation     A test suite with a single test for Punpun Donation.

Suite Setup         Open Browser To Home Page
Test Teardown       Goto Homepage
Resource            resource.robot

*** Test Cases ***
Browsing
    Go To                   ${DONATE URL}
