*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
User Create Success 
    [Documentation]    creste a user success
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body}    
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['create_sucess']}
    Status Should Be    201    ${response}
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
   
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}
User Create and login Success 
    [Documentation]    creste a user success
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body}    
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['create_sucess']}
    Status Should Be    201    ${response}
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
    ${body}=        Body Login User    ${g_EMAIL}    ${g_PASSWORD}
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_login']}   
    ...    json=${body}
    
    DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}    