*** Settings ***
Documentation     A test suite with a single test for Punpun Donation.

Suite Setup          Open Browser To Home Page
Suite Teardown       Goto Homepage
Resource            resource.robot

*** Test Cases ***
Donation
    Browse and View Project
    Donate

Payment Form
    Payment : Bank Tranfer
