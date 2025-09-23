*** Settings ***
Resource    ../../../../support/resources.resource

*** Keywords ***
Delete Front User
    Setup Authenticated Environment  
    [Arguments]     ${g_FULLNAME}
    ${headers}=    Create Dictionary    Content-Type=application/json 
    Create Session    session   url=${g_ENV['server_back']}  
    ${response}=    GET On Session    session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/?nome=${g_FULLNAME}      headers=${headers}
    Dictionary Should Contain Key    ${response.json()}    usuarios
    ${user_id}=    Set Variable    ${response.json()['usuarios']}
    ${user_id}=    Evaluate    $user_id[0]['_id'] if $user_id else None
    Log      ${user_id}
    DELETE On Session    session    url=${g_ENV['server_back']}${g_ENV['endpoint_user']}/${user_id}
    
    