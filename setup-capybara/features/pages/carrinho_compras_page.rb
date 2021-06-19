class Carrinho_de_Compras < SitePrism::Page
    set_url '/index.php?controller=order'

    def avancar
        find('span', text: 'Proceed to checkout').click
    end

    def concordar_termos
        find(:css, "#cgv[value='1']", visible: false).set(true)
    end

    def escolher_pagamento
        find('a', text: 'Pay by bank wire').click
        find('span', text: 'I confirm my order').click
    end
end
