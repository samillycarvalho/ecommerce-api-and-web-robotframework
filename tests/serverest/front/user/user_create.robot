*** Settings ***
Resource    ../../../../support/resources.resource
Test Teardown    Close Browser

*** Test Cases ***
Create User And Login
    [Documentation]     create a user and login.
    Setup Authenticated Environment  
    Serverest Values Front
    Open Browser    ${g_ENV['server_front']}${g_ENV['endpoint_login']}    chrome
    Set Window Size    1920    1080
    Wait Until Element Is Visible   ${elements_login['link_register']} 
    Click Link    ${elements_login['link_register']}
    Wait Until Element Is Visible   ${elements_user['input_name_register']}
    Input Text    ${elements_user['input_name_register']}    ${g_FULLNAME}
    Wait Until Element Is Visible   ${elements_user['input_mail_register']}
    Input Text    ${elements_user['input_mail_register']}     ${g_EMAIL} 
    Wait Until Element Is Visible   ${elements_user['input_password_register']}
    Input Text    ${elements_user['input_password_register']}    ${g_PASSWORD}
    Wait Until Element Is Visible   ${elements_user['btn_register']}
    Click Button    ${elements_user['btn_register']}
    Wait Until Element Is Visible    ${elements_user['msg_success']}
    Element Should Be Visible    ${elements_user['msg_success']}
    Wait Until Element Is Visible    ${elements_user['home']}    timeout=10
    Element Should Be Visible    ${elements_user['home']}
    Wait Until Element Is Visible    ${elements_user['logout']}    timeout=10
    Element Should Be Visible    ${elements_user['logout']}
    Click Button    ${elements_user['logout']}
    Wait Until Element Is Visible     ${elements_user['form_login']}
    Wait Until Element Is Visible    ${elements_login['input_mail']}
    Input Text    ${elements_login['input_mail']}     ${g_EMAIL}
    Wait Until Element Is Visible    ${elements_login['input_password']}
    Input Text    ${elements_login['input_password']}   ${g_PASSWORD}
    Wait Until Element Is Visible    ${elements_login['btn_enter']}
    Click Button    ${elements_login['btn_enter']}
    Wait Until Element Is Visible    ${elements_user['home']}
    Element Should Be Visible    ${elements_user['home']}
    Wait Until Element Is Visible     ${elements_user['list_shopping']}
    Element Should Be Visible    ${elements_user['list_shopping']}
    Capture Page Screenshot
    Delete Front User    ${g_FULLNAME}
   