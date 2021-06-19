# language: pt

@login
Funcionalidade: Login
  Eu como cliente 
  Quero poder fazer login
  Para conseguir ter acesso a meu histórico e fazer compras

  @login_valido 
  Cenário: Login válido
    Dado que estou na tela de login
    Quando colocar credenciais "válidas"
    Então vejo as informações da minha conta

  @login_invalido
  Cenário: Login inválido
    Dado que estou na tela de login
    Quando colocar credenciais "inválidas"
    Então vejo uma mensagem de erro
