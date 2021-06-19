class Cadastro_Usuario_Page < SitePrism::Page
    set_url '/index.php?controller=authentication#account-creation'
    
    element :input_first_name, '#customer_firstname'
    element :input_last_name, '#customer_lastname'
    element :input_passwd, '#passwd'
    element :input_address, '#address1'
    element :input_city, '#city'
    element :select_state, 'id_state'
    element :input_zip, '#postcode'
    element :input_mobile_phone, '#phone_mobile'
    element :input_address_reference, '#alias'
    element :btn_register, '#submitAccount'

    def preencher_formulario(first_name, last_name, passwd, address, city, state, zip, mobile_phone, address_reference)
        input_first_name.set first_name
        input_last_name.set last_name
        input_passwd.set passwd
        input_address.set address
        input_city.set city
        select(state, from: 'id_state', visible: false)
        input_zip.set zip
        input_mobile_phone.set mobile_phone
        input_address_reference.set address_reference
        btn_register.click
    end    

end


