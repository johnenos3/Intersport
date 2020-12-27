*** Settings ***
Library      SeleniumLibrary
Variables    ../POM/home_locators.py

*** Variables ***
${url}          http://165.22.31.162
${browser}      chrome
${user_login}   kristinasyvak159@gmail.com
${pwd}          callcentre
${user_account}   Крістіна тест

*** Keywords ***
Go to intersport
    [Arguments]    ${siteUrl}   ${Browser}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    call method    ${chrome_options}    add_argument    --disable-notifications
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    open browser    ${siteUrl}  ${Browser}      desired_capabilities=${options}
    set window size    1450    850

################### login ######################
Click 'Мій акаунт'
    wait until element is visible    ${my_account}
    click element    ${my_account}

Enter login
    [Arguments]     ${userlogin}
    wait until page contains element    ${login_field}      timeout=10s
    input text    ${login_field}    ${userlogin}

Enter password
    [Arguments]     ${user_password}
    wait until page contains element    ${password_field}      timeout=10s
    input text    ${password_field}    ${user_password}

Click 'Увійти'
    wait until element is visible    ${sign_in}
    click element    ${sign_in}

Verify succesfull login with user
    [Arguments]    ${user_name}
    wait until page contains element    ${general_info_after_login}     timeout=30s
    wait until page contains element    //span[@title='${user_name}']