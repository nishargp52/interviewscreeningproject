*** Settings ***
Documentation    Common Keywords 
Library    SeleniumLibrary 


Variables    ../Config/WebConfig.py



*** Keywords ***

Open application
    [Documentation]    keyword to open the application
        Open browser    ${ENV_URL}    ${ENV_BROWSER}
        Maximize Browser Window
        Sleep    5s
        # ${data_dict}=    Load Test Data
        
    # [Return]    ${data_dict}
        
        
Close application
    [Documentation]    Keyword to close application
    Capture Page Screenshot    
    Close All Browsers
    
