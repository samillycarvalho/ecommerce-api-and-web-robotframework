*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***

Carts List Success 
    [Documentation]    list a carts success
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
    ${carts_body}=        Create Carts Body
    ...    ${id_product_1}    ${s_QUANTITY}
    ...    ${id_product_2}    ${s_QUANTITY}
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}    json=${carts_body}      headers=${s_HEADERS_AUTH_USER} 
    Status Should Be    201    ${response}
    # List
    ${response}=    Get On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}          headers=${s_HEADERS_AUTH_USER} 
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    carrinhos
    Dictionary Should Contain Key    ${response.json()['carrinhos'][0]}    produtos    
    Dictionary Should Contain Key    ${response.json()['carrinhos'][0]['produtos'][0]}       idProduto    
    Dictionary Should Contain Key    ${response.json()['carrinhos'][0]['produtos'][0]}       quantidade    
    Dictionary Should Contain Key    ${response.json()['carrinhos'][0]['produtos'][0]}       precoUnitario    

    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}${g_ENV['endpoint_conclude']}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_1}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_2}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}   
    [Teardown]        Clear Carts Conclude   
    
Carts Search By Id Success 
    [Documentation]   Search By Id a carts success
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
    ${carts_body}=        Create Carts Body
    ...    ${id_product_1}    ${s_QUANTITY}
    ...    ${id_product_2}    ${s_QUANTITY}
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}    json=${carts_body}      headers=${s_HEADERS_AUTH_USER} 
    Status Should Be    201    ${response}
    Set Suite Variable    ${id_carts}         ${response.json()['_id']}
    # List
    ${response}=    Get On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}/${id_carts}          headers=${s_HEADERS_AUTH_USER} 
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    produtos
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}       idProduto    
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}       quantidade    
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}       precoUnitario    

    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}${g_ENV['endpoint_conclude']}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_1}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product_2}    headers=${g_HEADERS_AUTH}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}   
    [Teardown]        Clear Carts Conclude      