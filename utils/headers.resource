*** Settings ***
Resource    ../support/resources.resource

*** Keywords ***
Setup Authenticated Environment

    [Documentation]    Prepara variáveis globais, cria sessão e autentica com token
    ${headers}=    Create Dictionary    Content-Type=application/json     
    Set Global Variable    ${g_HEADERS}    ${headers}
    
    ${env_dict}=    Set Variable    ${environments['serverest']}
    Set Global Variable    ${g_ENV}    ${env_dict}     
    
    Create Session    session    url=${g_ENV['server_back']}

    ${body}=    Create Dictionary    email=${data['mail']}    password=${data['password']}
    ${response}=    POST On Session    session    ${g_ENV['endpoint_login']}    json=${body}

    Set Global Variable    ${g_TOKEN}    ${response.json()['authorization']}
    ${HEADERS_AUTH}=    Create Dictionary    Authorization=${g_TOKEN}
    Set Global Variable    ${g_HEADERS_AUTH}    ${HEADERS_AUTH}
