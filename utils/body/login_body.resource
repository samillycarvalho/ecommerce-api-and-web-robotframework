*** Settings ***
Resource    ../../support/resources.resource

*** Keywords ***
Body Login
    [Arguments]    ${mail}    ${password}
    ${body}=      Create Dictionary  
    ...  email=${mail}
    ...  password=${password}
    RETURN      ${body}