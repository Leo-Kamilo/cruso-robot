*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir navegador e acessar o site do organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Preencher os campos do formulario
    Input Text    id:form-nome     Leozin
    Input Text    id:form-cargo    Analista de Q.A
    Input Text    id:form-imagem   https://picsum.photos/200/300
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Sleep    10s
    Click Element    id:form-botao
    Element Should Be Visible    class:colaboradores
    Sleep    5s