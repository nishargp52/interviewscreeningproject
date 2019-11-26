*** Settings ***
Documentation    This contains my sample test case
Library    SeleniumLibrary 
Resource    ../Resources/Common/WebCommon.resource
Resource    ../Resources/PageObject/JustEatHomePage.resource


*** Test Cases ***

Search For any restaurent in the area based on PostalCode
    [Documentation]    Test case to search a list of restaurents based on postal code
    [Setup]    Run Keywords    Open application
    
    # Steps
    JustEatHomePage.Verify HomePage is displayed
    JustEatHomePage.Enter Text in the postal code Search Field    AR51 1AA
    JustEatHomePage.Verify Results page is displayed with search results
    [Teardown]    Close application
    
Search For restaurents in the area based on Cuisine category 
    [Documentation]    Test case to search a list of restaurents in an area based on cuisine
    [Setup]    Run Keywords    Open application
    
    # Steps
    JustEatHomePage.Verify HomePage is displayed
    JustEatHomePage.Select a Cuisine category
    JustEatHomePage.Enter Text in the postal code Search Field    AR51 1AA
    JustEatHomePage.Verify Results page is displayed with search results
    [Teardown]    Close application
    
Search For restaurents in the area based on brand category 
    [Documentation]    Test case to search a list of restaurents in an area based on brand
    [Setup]    Run Keywords    Open application
    
    # Steps
    JustEatHomePage.Verify HomePage is displayed
    JustEatHomePage.Select a Brand category    Burger King
    JustEatHomePage.Enter Text in the postal code Search Field    AR51 1AA
    JustEatHomePage.Verify Results page is displayed with search results
    [Teardown]    Close application