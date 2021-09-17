Before do
  # Initialize Page Objects
  @authentication = Authentication.new
  @forgot_password = ForgotPassword.new
  @terms_of_use = TermsOfUse.new
end

AfterStep do
  sleep 2 if ENV['SLOW'] || ENV['S']
end
After do
  byebug if ENV['EDIT'] || ENV['E']
end
