*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
Product Create Success 
    [Documentation]    Create a product success
    ${body}=        Body Product
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body}      headers=${g_HEADERS_AUTH} 
    Set Suite Variable      ${id_product}      ${response.json()['_id']}      
    Status Should Be    201    ${response}
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['create_sucess']}

    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product}    headers=${g_HEADERS_AUTH}