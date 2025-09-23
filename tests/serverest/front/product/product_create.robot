*** Settings ***
Resource    ../../../../support/resources.resource
Test Teardown    Close Browser

*** Test Cases ***
Create Product Success
    [Documentation]     create a product 
    Serverest Values Front
    Setup Authenticated Environment  
    Open Browser    ${g_ENV['server_front']}${g_ENV['endpoint_login']}    chrome
    Set Window Size    1920    1080
    Wait Until Element Is Visible   ${elements_login['link_register']} 
    Click Link    ${elements_login['link_register']}
    Wait Until Element Is Visible   ${elements_user['input_name_register']}
    Input Text    ${elements_user['input_name_register']}    ${g_FULLNAME}
    Wait Until Element Is Visible   ${elements_user['input_mail_register']}
    Input Text    ${elements_user['input_mail_register']}     ${g_EMAIL} 
    Wait Until Element Is Visible   ${elements_user['input_password_register']}
    Input Password    ${elements_user['input_password_register']}    ${g_PASSWORD}
    Wait Until Element Is Visible    ${elements_user['check_admin']}
    Click Element    ${elements_user['check_admin']}
    Wait Until Element Is Visible   ${elements_user['btn_register']}
    Click Button    ${elements_user['btn_register']}
    Wait Until Element Is Visible    ${elements_user['msg_success']}
    Element Should Be Visible    ${elements_user['msg_success']}
    Wait Until Element Is Visible    ${elements_user['home']}    timeout=10
    Element Should Be Visible    ${elements_user['home']}
    Wait Until Element Is Visible    ${elements_user['home']}
    Element Should Be Visible    ${elements_user['home']}
    Wait Until Element Is Visible    ${elements_product['new_product']}
    Click Element    ${elements_product['new_product']}
    Wait Until Element Is Visible     ${elements_product['titler_product']}
    Wait Until Element Is Visible   ${elements_product['name_product']}
    Input Text     ${elements_product['name_product']}     ${g_PRODUCT}
    Wait Until Element Is Visible   ${elements_product['price_product']}
    Input Text    ${elements_product['price_product']}    ${g_PRICE}  
    Wait Until Element Is Visible     ${elements_product['description_product']}
    Input Text    ${elements_product['description_product']}    ${g_DESCRIPTION} 
    Wait Until Element Is Visible     ${elements_product['quantity_product']}
    Input Text    ${elements_product['quantity_product']}    ${g_QUANTITY}
    Wait Until Element Is Visible    ${elements_product['file_img']} 
    Path Image 
    Choose File    ${elements_product['file_img']}     ${s_IMAGE_PATH} 
    Wait Until Element Is Visible    ${elements_product['btn_new_product']} 
    Click Element    ${elements_product['btn_new_product']}
    Capture Page Screenshot
    Delete Front Product    ${g_PRODUCT}