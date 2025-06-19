*** Settings ***
Resource    ../../support/resources.resource

*** Keywords ***
Body User  
    Serverest Values
    ${body}=      Create Dictionary  
    ...  nome=${g_FULLNAME}
    ...  email=${g_EMAIL}
    ...  password=${g_PASSWORD}
    ...  administrador=${g_ADMIN}
    RETURN      ${body}

Body Update User  
    Serverest Values
    ${body_update}=      Create Dictionary  
    ...  nome=${g_FULLNAME}
    ...  email=${g_EMAIL}
    ...  password=${g_PASSWORD}
    ...  administrador=${g_ADMIN}
    RETURN      ${body_update}
Body Login User
    [Arguments]    ${mail}    ${password}
    ${body}=      Create Dictionary  
    ...  email=${g_EMAIL}
    ...  password=${g_PASSWORD}
    RETURN      ${body}