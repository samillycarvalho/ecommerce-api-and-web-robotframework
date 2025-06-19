*** Settings ***
Resource    ../../support/resources.resource

*** Keywords ***
Body Product
    Serverest Values
    ${body}=      Create Dictionary  
    ...  nome=${g_PRODUCT} 
    ...  preco=${g_PRICE}
    ...  descricao=${g_DESCRIPTION}
    ...  quantidade=${g_QUANTITY}
    RETURN      ${body}

Body Product Update
    Serverest Values
    ${body_update}=      Create Dictionary  
    ...  nome=${g_PRODUCT}Up 
    ...  preco=${g_PRICE}
    ...  descricao=${g_DESCRIPTION}Up
    ...  quantidade=${g_QUANTITY}
    RETURN      ${body_update}    

Body Product Carts
    Serverest Values
    ${body}=      Create Dictionary  
    ...  nome=${g_PRODUCT} 
    ...  preco=${g_PRICE}
    ...  descricao=${g_DESCRIPTION}
    ...  quantidade=${s_QUANTITY}
    RETURN      ${body}
