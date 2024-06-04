*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${CAMPO_CARD}             id:form-botao
@{selecionar_times}
...  //option[contains(.,'Programação')]
...  //option[contains(.,'Front-End')]
...  //option[contains(.,'Data Science')]
...  //option[contains(.,'Devops')] 
...  //option[contains(.,'UX e Design')]
...  //option[contains(.,'Mobile')]
...  //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado

    Dado que preencha os campos do formulario
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possivel criar mais de um card se preenchermos os campos corretamente

    Dado que preencha os campos do formulario
    E clique no botão criar card
    Então identificar 3 cards no time esperado

 Verificar se é possivel criar um card para cada time disponivel se preenchermos os campos corretamente
     
    Dado que preencha os campos do formulario
    Então criar e identificar 1 card em cada time disponivel

*** Keywords ***  

Dado que preencha os campos do formulario
    ${Nome}        FakerLibrary.First Name
    Input Text     ${CAMPO_NOME}     ${Nome}
    ${Cargo}        FakerLibrary.Job
    Input Text     ${CAMPO_CARGO}    ${Cargo}
    ${Imagem}       FakerLibrary.Image Url
    Input Text     ${CAMPO_IMAGEM}   ${Imagem} 
    Click Element  ${CAMPO_TIME}
    Click Element  ${OPCAO_PROGRAMACAO}

E clique no botão criar card
    Click Element    ${CAMPO_CARD}

Então identificar o card no time esperado
    Element Should Be Visible    class:colaboradores

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulario
        E clique no botão criar card
    END
    Sleep    10s

Então criar e identificar 1 card em cada time disponivel
    