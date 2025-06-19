*** Settings ***
Resource    ../../../../support/resources.resource

*** Test Cases ***
User Delete Success
    [Documentation]    Delete a user success
    Create Session    session    url=${g_ENV['server_back']}
    ${body}=        Body User 
    ${response}=    POST On Session  session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}   
    ...    json=${body}    
    Set Suite Variable      ${id_user}      ${response.json()['_id']} 
    ${response}=     DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${id_user}
    Status Should Be    200  ${response}
    Dictionary Should Contain Item    ${response.json()}    message    ${msg['delete_sucess']}