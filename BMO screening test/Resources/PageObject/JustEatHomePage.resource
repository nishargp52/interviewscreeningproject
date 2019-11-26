*** Settings ***
Library    SeleniumLibrary 
Library    String
Library    Collections
Resource    ../Common/WebCommon.resource

*** Keywords ***

Verify HomePage is displayed
    [Documentation]    To verify user is on the homepage
    Wait Until Element Is Visible    //*[contains(text(),'Log in')]    3s    Homepage is not displayed  
    
Enter Text in the postal code Search Field 
     [Documentation]    enter value into the postal code search field
     [Arguments]    ${param_postalCode}
     Wait Until Element Is Visible    //input[@name="postcode"]    3s    Search field not visible
     Input Text    //input[@name="postcode"]    ${param_postalCode}
     Press Keys    none    RETURN
     
Click on search Button
    [Documentation]    Click on search icon
    Wait Until Element Is Visible    //button[@data-test-id="find-restaurants-button"]    3s    Button not visible
    Click Element    //button[@type="submit"]        

Select a Cuisine category
    [Documentation]    Selecting a cuisine category from the list based on iput
    # Scroll Element Into View    //ul[@id="footer-top-cuisines"]//a[contains(text(),'${param_cuisineType}')]
    # Sleep    3s
    Execute JavaScript    window.scrollTo(0,1500)
    Sleep    3s
    # Wait Until Element Is Visible    //ul[@id="footer-top-cuisines"]//a[contains(text(),'Chinese')]    3s    Cuisine category was nto visible 
    # Set Focus To Element    //ul[@id="footer-top-cuisines"]//a[contains(text(),'Chinese')]
    # Sleep    5s
    Click Element    //ul[@id="footer-top-cuisines"]//li[1]/a     
    Sleep    5s
    
Select a Brand category
    [Documentation]    Selecting a category from the List of brand based on input
    [Arguments]    ${param_brandcategory}
    Wait Until Element Is Visible    //ul[@id="footer-brands"]//a[contains(text(),'${param_brandcategory}')]    3s    Brand category was not visible
    Click Element    //ul[@id="footer-brands"]//a[contains(text(),'${param_brandcategory}')]   
    
Verify Results page is displayed with search results
    [Documentation]    verify results page is displayed 
    Wait Until Element Is Visible    //span[@data-search-count="openrestaurants"]    1m    Search results page is not displayed
    ${openrestaurents}=    Get Text    //span[@data-search-count="openrestaurants"]
    Log To Console    ${openrestaurents}   
    ${Splitstring}=    Split String    ${openrestaurents}   
    ${numberOfRestaurents} =    Get From List    ${Splitstring}    0 
    Should Be True    ${numberOfRestaurents} != "0"            