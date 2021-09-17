class Authentication < SitePrism::Page
  element :username, 'input[id="username"]'
  element :passowrd, 'input[id="password"]'
  element :login, '.primary'
  element :forgot_password, 'a.FORGOT PASSWORD?'
  element :error_messages, '.help-block'
end
