*** Settings ***
Resource    ../support/resources.resource

*** Keywords ***
Serverest Values
#  USER
    ${name}=  Evaluate    random.choice(["Lara", "Lana", "Kaira", "Karol", "Juliana", "Vircine", "Viviene", "Vivian", "Sami", "Samilly", "Samara", "Samira", "Luiza", "Luzia"])    modules=random
    ${surname}=    Evaluate    random.choice(["Santos", "Silva", "Stiti", "Lucena", "Silveira", "Oliveira", "Laradina", "Winked", "Sousa", "Souza", "Alves", "Gomes", "Carneiro", "Santana"])    modules=random
  
    ${s_FULLNAME}=    Catenate    ${name} ${surname}
    Set Suite Variable    ${s_FULLNAME}
    ${number}    Generate Random String      3        [NUMBERS]
    ${email}=  Set Variable      ${name}_${surname}_${number}@hotmail.com  
    Set Global Variable     ${g_FULLNAME}    ${s_FULLNAME}      
    Set Global Variable      ${g_EMAIL}             ${email} 
    Set Suite Variable  ${administrador}    true
    Set Global Variable    ${g_ADMIN}    ${administrador}
    ${number}    Generate Random String       3        [NUMBERS]
    ${letters}    Generate Random String      3        [LETTERS]
    ${password_admin}    Set Variable    ${number}#${letters}
    Set Global Variable    ${g_PASSWORD}     ${password_admin} 
# Product

    ${name_product}=     Evaluate    random.choice(["Camisa Tech", "Fone Gamer", "Notebook X1", "Cadeira Ergonômica", "Mouse RGB", "Teclado Mecânico", "Monitor UltraWide", "Hub USB-C", "Smartwatch Fit", "Echo Bass", "Carregador Turbo", "Luminária LED", "HD Externo", "Webcam Full HD"])    modules=random
    ${number}    Generate Random String      3        [NUMBERS]
    ${s_NAME_PRODUCT}    Set Variable    ${name_product}${number}
    ${description}=    Evaluate    random.choice(["Tecido respirável com proteção UV, ideal para treinos","16GB RAM, SSD 512GB e tela Full HD"," Apoio lombar ajustável e reclinação 135","Mouse RGB DPI com software de personalização de macros"])     modules=random
    ${price}    Generate Random String      3    [NUMBERS]
    ${quantity}    Generate Random String      4    [NUMBERS]

    Set Global Variable    ${g_PRODUCT}        ${s_NAME_PRODUCT}
    Set Global Variable    ${g_DESCRIPTION}    ${description}
    Set Global Variable    ${g_PRICE}         ${price}
    Set Global Variable    ${g_QUANTITY}      ${quantity}