*** Settings ***
Resource    ../../support/resources.resource

*** Keywords ***
Create Carts Body
    [Arguments]    ${id_produto_1}    ${quantidade_1}    ${id_produto_2}    ${quantidade_2}
    ${item_produto_1}=    Create Dictionary
    ...    idProduto=${id_produto_1}
    ...    quantidade=${quantidade_1}

    ${item_produto_2}=    Create Dictionary
    ...    idProduto=${id_produto_2}
    ...    quantidade=${quantidade_2}

    ${lista_de_produtos}=    Create List
    ...    ${item_produto_1}
    ...    ${item_produto_2}

    ${body}=      Create Dictionary
    ...  produtos=${lista_de_produtos}
    RETURN      ${body} 