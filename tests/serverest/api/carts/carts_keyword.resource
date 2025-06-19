*** Settings ***

Resource    ../../../../support/resources.resource


*** Keywords ***
Clear Carts Cancel
    [Documentation]    Cancela o carrinho do usuário autenticado para limpar o ambiente de teste.
    ${response}=     DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}${g_ENV['endpoint_cancel']}    headers=${g_HEADERS_AUTH}
Clear Carts Conclude
   [Documentation]    Conclui o carrinho do usuário autenticado para limpar o ambiente de teste.
    ${response}=     DELETE On Session   session  url=${g_ENV['server_back']}${g_ENV['endpoint_carts']}${g_ENV['endpoint_conclude']}    headers=${g_HEADERS_AUTH}