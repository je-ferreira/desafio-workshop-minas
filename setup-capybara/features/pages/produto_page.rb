class Produto_Page < SitePrism::Page
    set_url '/index.php?id_product=1&controller=product'

    element :input_quantity, '#quantity_wanted'
    element :select_size, 'group_1'
    element :btn_add, '#add_to_cart'

    def adicionar_ao_carrinho(quantidade, tamanho)
        input_quantity.set quantidade
        select(tamanho, from: 'group_1', visible: false)
        btn_add.click
        sleep(1)
    end
end
