*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/HomeKW.robot
Test Teardown    close browser

*** Test Cases ***
Login to intersport
    [Documentation]    verify that you can login to system
    [Tags]    login
    Go to intersport    http://165.22.31.162    chrome
    Click 'Мій акаунт'
    Enter login    ${user_login}
    Enter password    ${pwd}
    Click 'Увійти'
    Verify successful login with user    ${user_account}

Logout
    [Documentation]    verify that you can logout from system
    [Tags]    logout
    Login to customer cabinet
    Click 'Вихід'
    Verify successful logout






