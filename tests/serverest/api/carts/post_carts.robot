*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
Carts Cancel Create Success 
    [Documentation]    Create a carts success and Cancel
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body} 
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
    ${body}=        Body Login User    ${g_EMAIL}    ${g_PASSWORD}
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_login']}   
    ...    json=${body}
    Set Suite Variable    ${s_TOKEN_USER}    ${response.json()['authorization']}
    ${HEADERS_AUTH_USER}=    Create Dictionary    Authorization=${g_TOKEN}
    Set Global Variable    ${s_HEADERS_AUTH_USER}    ${HEADERS_AUTH_USER}
    ${body_1}=        Body Product Carts
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body_1}      headers=${s_HEADERS_AUTH_USER} 
    Set Suite Variable      ${id_product_1}      ${response.json()['_id']}
    ${body_2}=        Body Product Carts      
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body_2}      headers=${s_HEADERS_AUTH_USER} 
    Set Suite Variable      ${id_product_2}      ${response.json()['_id']}      
    # Cria um carrinho
    ${carts_body}=        Create Carts Body
    ...    ${id_product_1}    ${s_QUANTITY}
    ...    ${id_product_2}    ${s_QUANTITY}
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}    json=${carts_body}      headers=${s_HEADERS_AUTH_USER} 
    Status Should Be    201    ${response}
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['create_sucess']}
    [Teardown]     Clear Carts Cancel
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}${g_ENV['endpoint_cancel']}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_1}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_2}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}   




Carts Conclude Create Success 
    [Documentation]    Create a carts success and Conclude
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body} 
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
    ${body}=        Body Login User    ${g_EMAIL}    ${g_PASSWORD}
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_login']}   
    ...    json=${body}
    Set Suite Variable    ${s_TOKEN_USER}    ${response.json()['authorization']}
    ${HEADERS_AUTH_USER}=    Create Dictionary    Authorization=${g_TOKEN}
    Set Global Variable    ${s_HEADERS_AUTH_USER}    ${HEADERS_AUTH_USER}
    ${body_1}=        Body Product Carts
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body_1}      headers=${s_HEADERS_AUTH_USER} 
    Set Suite Variable      ${id_product_1}      ${response.json()['_id']}
    ${body_2}=        Body Product Carts      
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body_2}      headers=${s_HEADERS_AUTH_USER} 
    Set Suite Variable      ${id_product_2}      ${response.json()['_id']}      
    # Cria um carrinho
    ${carts_body}=        Create Carts Body
    ...    ${id_product_1}    ${s_QUANTITY}
    ...    ${id_product_2}    ${s_QUANTITY}
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}    json=${carts_body}      headers=${s_HEADERS_AUTH_USER} 
    Status Should Be    201    ${response}
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['create_sucess']}
    [Teardown]     Clear Carts Conclude
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}${g_ENV['endpoint_conclude']}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_1}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_2}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}   