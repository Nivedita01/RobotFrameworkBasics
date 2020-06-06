*** Settings ***
Library    SeleniumLibrary    

Default Tags    Regression
*** Test Cases ***
TestCase1
    Log    "Hello, I am new"   
    [Tags]    Smoke
    
TestCase2
    Open Browser    http:google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Places near me
    Click Button    name=btnK        
    Sleep    2        
    Close Browser 
    
TestCase3
    Open Browser    http:hotels.com    chrome
    Set Browser Implicit Wait    5
    Click Link    id=header-sign-in    
    Input Text    id=sign-in-email    abc@gmail.com    
    Sleep    2    
    Input Password    id=sign-in-password    something
    Close Browser    
    
TestCase4
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    Click Link    id=header-sign-in
    Input Text    id=sign-in-email    @{Credentials}[0]
    Sleep    2    
    Input Password    id=sign-in-password    @{Credentials}[1]    
    Close Browser
    
TestCase5
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    Click Link    id=header-sign-in
    Input Text    id=sign-in-email    &{LoginData}[username]
    Sleep    2    
    Input Password    id=sign-in-password    &{LoginData}[password]
    Log    This test was executed by %{username} on %{os}    
    Close Browser        
    
TestCase6
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    click&login
    Close Browser
    Log    This test was executed by %{username} on %{os}

*** Variables ***
${URL}    http:hotels.com
@{Credentials}    abc@gmail.com    something
&{LoginData}    username=abc@gmail.com    password=something

*** Keywords ***
click&login
    Click Link    id=header-sign-in
    Input Text    id=sign-in-email    &{LoginData}[username]
    Sleep    2    
    Input Password    id=sign-in-password    &{LoginData}[password]        