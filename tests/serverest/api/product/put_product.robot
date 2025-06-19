*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
Product Update Success 
    [Documentation]    Edit a product success
    ${body}=        Body Product
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body}      headers=${g_HEADERS_AUTH} 
    Set Suite Variable      ${id_product}      ${response.json()['_id']}      
    ${body_update}=        Body Product Update
    ${response}=     PUT On Session    session     url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product}    json=${body_update}      headers=${g_HEADERS_AUTH}
    Status Should Be    200    ${response}
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['update_sucess']}
    
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product}    headers=${g_HEADERS_AUTH}