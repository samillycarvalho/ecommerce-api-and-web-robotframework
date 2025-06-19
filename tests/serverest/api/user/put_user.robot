*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
User Update Success 
    [Documentation]    Edit a user success
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body}    
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
    ${body_update}=      Body Update User
    ${response}=     PUT On Session    session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}    json=${body_update} 
    Status Should Be    200    ${response}
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['update_sucess']}
   
    DELETE On Session   session   url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}