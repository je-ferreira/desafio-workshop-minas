Dado('que estou logada com credenciais {string}') do |credenciais|
    @login_page = LoginPage.new
    @login_page.load

    case credenciais
    when 'válidas'
        @login_page.fazer_login 'teste-cadastro-jessica@teste.com', 'teste' #esse email precisa estar igual o definido em cadastro_usuario_steps, para usar a conta criada, conforme determinado no desafio
    end
end

Dado('que estou na tela de um produto') do
    @produto_page = Produto_Page.new
    @produto_page.load
end

Quando('adiciono o produto no carrinho') do
    @produto_page.adicionar_ao_carrinho '2', 'M'
    sleep(3)
end

Então('vejo uma mensagem de confirmação') do
    expect(page).to have_content('Product successfully added to your shopping cart')
end

Dado('estou na tela de resumo da compra') do
    @produto_page = Produto_Page.new
    @produto_page.load
    @produto_page.adicionar_ao_carrinho '2', 'M'
    @carrinho_de_compras = Carrinho_de_Compras.new
    @carrinho_de_compras.load
end

Quando('avançar para a tela de endereço') do
    @carrinho_de_compras.avancar
end

Então('vejo endereços de entrega disponíveis') do
    expect(page).to have_content('Choose a delivery address:')
end

Dado('que estou na tela de envio do produto') do
    @produto_page = Produto_Page.new
    @produto_page.load
    @produto_page.adicionar_ao_carrinho '2', 'M'
    @carrinho_de_compras = Carrinho_de_Compras.new
    @carrinho_de_compras.load
    @carrinho_de_compras.avancar
end

Quando('avançar para a tela de pagamento') do
    @carrinho_de_compras.avancar
    @carrinho_de_compras.concordar_termos
    @carrinho_de_compras.avancar
end

Então('vejo as opções de pagamento disponíveis') do
    expect(page).to have_content('PLEASE CHOOSE YOUR PAYMENT METHOD')
end

Dado('que tenha escolhido um produto') do
    @produto_page = Produto_Page.new
    @produto_page.load
end

Quando('fizer a compra') do
    @produto_page.adicionar_ao_carrinho '2', 'M'
    @carrinho_de_compras = Carrinho_de_Compras.new
    @carrinho_de_compras.load
    @carrinho_de_compras.avancar
    @carrinho_de_compras.avancar
    @carrinho_de_compras.concordar_termos
    @carrinho_de_compras.avancar
    @carrinho_de_compras.escolher_pagamento
end

Então('vejo mensagem de confirmação da compra') do
    expect(page).to have_content('Your order on My Store is complete.')
end