*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
User Get Success 
    [Documentation]    list all user success
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body}    
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
    ${response}=    GET On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()['usuarios'][0]}     nome
    Dictionary Should Contain Key    ${response.json()['usuarios'][0]}     email
    Dictionary Should Contain Key    ${response.json()['usuarios'][0]}     password
    Dictionary Should Contain Key    ${response.json()['usuarios'][0]}     administrador
    Dictionary Should Contain Key    ${response.json()['usuarios'][0]}     _id
    DELETE On Session   session   url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}

User Get By id    
    [Documentation]    search a user by id success
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body}    
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
    ${response}=    GET On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}     nome
    Dictionary Should Contain Key    ${response.json()}     email
    Dictionary Should Contain Key    ${response.json()}     password
    Dictionary Should Contain Key    ${response.json()}     administrador
    Dictionary Should Contain Key    ${response.json()}     _id
    DELETE On Session   session   url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}