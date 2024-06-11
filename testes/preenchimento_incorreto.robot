*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_CARD}             id:form-botao

*** Test Cases ***
Verificar se quando um campo obrigatorio não for preenchido corretamente o sistema exibe uma menssagem de campo obrigatorio
    Dado que eu clique no botao criar card
    Então sistema deve apresentar menssagem de campo obrigatorio

   