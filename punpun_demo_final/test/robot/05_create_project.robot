*** Settings ***
Documentation     A test suite with a single test for Punpun Donation.

Suite Setup          Open Browser To Home Page
Suite Teardown       Goto Homepage
Resource             resource.robot

*** Test Cases ***
Login with Valid User
    Login
    Goto Homepage

Create New Crowdfunding Project
    Create New Project
    Create New Project : Info
    Create New Project : Team
    Create New Project : Detail
    Create New Project : Image
    Create New Project : Wishlist
    Create New Project : Submit