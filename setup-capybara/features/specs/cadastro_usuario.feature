# language: pt

@cadastro_usuario
Funcionalidade: Cadastro de usuário
  Eu como cliente
  Quero poder fazer cadastro
  Para ter acesso ao sistema

  @cadastro_valido
  Cenário: Cadastro com e-mail válido
    Dado que estou na tela de login
    Quando eu colocar um e-mail "válido"
    Então vejo um formulario para completar o cadastro

  @cadastro_invalido
  Cenário: Cadastro com e-mail inválido
    Dado que estou na tela de login
    Quando eu colocar um e-mail "inválido"
    Então vejo uma mensagem de email inválido

  @cadastro_repetido
  Cenário: Cadastro com e-mail já cadastrado
    Dado que estou na tela de login
    Quando eu colocar um e-mail já cadastrado
    Então vejo uma mensagem de email já cadastrado

  @cadastro
  Cenário: Cadastro de usuário 
    Dado que estou na tela de login
    E inseri um email para cadastro
    Quando eu enviar o formulário preenchido
    Então vejo as informações da minha conta

 