Dado('inseri um email para cadastro') do
    @login_page.fazer_cadastro 'teste-cadastro-jessica@teste.com' #esse email precisa ser alterado a cada teste, atualizando no carrinho_compras_step
end

Quando('eu colocar um e-mail {string}') do |email|
    @login_page = LoginPage.new

    case email
    when 'válido'
        @login_page.fazer_cadastro 'teste-email-valido@teste.com'
    when 'inválido'
        @login_page.fazer_cadastro 'teste-email-invalido@email'
    end
    sleep(3)
end

Então('vejo um formulario para completar o cadastro') do
    expect(page).to have_content('CREATE AN ACCOUNT')
end

Quando('eu colocar um e-mail já cadastrado') do
    @login_page = LoginPage.new
    @login_page.fazer_cadastro 'teste-login-jessica@teste.com'
end

Quando('eu enviar o formulário preenchido') do
    @cadastro_page = Cadastro_Usuario_Page.new
    @cadastro_page.preencher_formulario 'Jessica', 'Teste', 'teste', 'Address Test', 'City Test', 'California' ,'00000', '00000000', 'Address Test'
end

Então('vejo uma mensagem de email inválido') do
    expect(page).to have_content('Invalid email address.')
end

Então('vejo uma mensagem de email já cadastrado') do
    expect(page).to have_content('An account using this email address has already been registered. Please enter a valid password or request a new one.')
end
