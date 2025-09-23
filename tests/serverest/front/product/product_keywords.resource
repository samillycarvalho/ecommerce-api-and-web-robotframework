*** Settings ***
Resource    ../../../../support/resources.resource

*** Keywords ***
Path Image  
    ${relative_path}=    Set Variable    fixtures/serverest/files/img.png
    ${s_IMAGE_PATH}=     OperatingSystem.Normalize Path    ${EXECDIR}/${relative_path}
    OperatingSystem.File Should Exist    ${s_IMAGE_PATH}
    Set Suite Variable            ${s_IMAGE_PATH}

Delete Front Product
    Setup Authenticated Environment  
    [Arguments]     ${g_PRODUCT}
    Create Session    session   url=${g_ENV['server_back']}  
    ${response}=    GET On Session    session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/?nome=${g_PRODUCT}     headers=${g_HEADERS_AUTH}
    Dictionary Should Contain Key    ${response.json()}    produtos
    ${product_id}=    Set Variable    ${response.json()['produtos']}
    ${product_id}=    Evaluate    $product_id[0]['_id'] if $product_id else None
    Log      ${product_id}
    DELETE On Session    session    url=${g_ENV['server_back']}${g_ENV['endpoint_product']}/${product_id}    headers=${g_HEADERS_AUTH}
    
      