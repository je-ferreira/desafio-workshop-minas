Dado('que estou na tela de login') do
    @login_page = LoginPage.new
    @login_page.load
    sleep(5)
end
  
Quando('colocar credenciais {string}') do |credenciais|
    @login_page = LoginPage.new

    case credenciais
    when 'válidas'
        @login_page.fazer_login 'teste-login-jessica@teste.com', 'teste@valida'
    when 'inválidas'
        @login_page.fazer_login 'teste-login-jessica@teste.com', 'teste@invalida'
    end
    sleep(3)
end
  
Então('vejo as informações da minha conta') do
    expect(page).to have_content('Welcome to your account. Here you can manage all of your personal information and orders.')
end
  
Então('vejo uma mensagem de erro') do
    expect(page).to have_content('Authentication failed.')
end
