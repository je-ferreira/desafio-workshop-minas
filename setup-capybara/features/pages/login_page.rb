class LoginPage < SitePrism::Page
    set_url '/index.php?controller=authentication&back=my-account'
    
    element :input_email, '#email'
    element :input_senha, '#passwd'
    element :btn_sign_in, '#SubmitLogin'
    element :input_email_create, '#email_create'
    element :btn_submit_create, '#SubmitCreate'

    def fazer_login(email, senha)
        input_email.set email
        input_senha.set senha
        btn_sign_in.click
    end    

    def fazer_cadastro(email)
        input_email_create.set email
        btn_submit_create.click
    end


end
