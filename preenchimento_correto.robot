*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${CAMPO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos na lista e se um novo card é criado no time esperado

    Dado que preencha os campos do formulario
    E clique no botão criar card
    Então identificar o card no time esperado
    Então identificar 3 cards no time esperado


Verificar se é possivel criar mais de um card se preenchermos os campos corretamente

    Dado que preencha os campos do formulario
    E clique no botão criar card


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
    Click Element    id:form-botao

Então identificar o card no time esperado
    Element Should Be Visible    class:colaboradores

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulario
        E clique no botão criar card
    END
    Sleep    10
