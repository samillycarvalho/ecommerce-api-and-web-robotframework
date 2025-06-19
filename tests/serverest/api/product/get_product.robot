*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
Product Get All List Success 
    [Documentation]    Product Get All List Success  
    ${body}=        Body Product
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body}      headers=${g_HEADERS_AUTH} 
    Set Suite Variable      ${id_product}      ${response.json()['_id']}      
    ${response}=    GET On Session    session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    headers=${g_HEADERS_AUTH}
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}      nome
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}      preco
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}      descricao
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}      quantidade
    Dictionary Should Contain Key    ${response.json()['produtos'][0]}      _id
    Status Should Be    200    ${response}
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product}    headers=${g_HEADERS_AUTH}

Product Get Search By ID  
    [Documentation]    Product Get Search By ID  
    ${body}=        Body Product
    ${response}=    POST On Session   session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}    
    ...    json=${body}      headers=${g_HEADERS_AUTH} 
    Set Suite Variable      ${id_product}      ${response.json()['_id']}      
    ${response}=    GET On Session    session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product}    headers=${g_HEADERS_AUTH}
    Dictionary Should Contain Key    ${response.json()}      nome
    Dictionary Should Contain Key    ${response.json()}      preco
    Dictionary Should Contain Key    ${response.json()}      descricao
    Dictionary Should Contain Key    ${response.json()}      quantidade
    Dictionary Should Contain Key    ${response.json()}      _id
    Status Should Be    200    ${response}

    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${id_product}    headers=${g_HEADERS_AUTH}