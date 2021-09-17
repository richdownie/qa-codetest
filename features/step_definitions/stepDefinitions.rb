require 'yaml'
# require 'os'
$cfg = YAML.load_file("#{$filePath}objectRepository.yaml")

# Example of accessing object repository:
# find(:xpath, $cfg['key'], wait:30).click
#
# Example of visiting the url
# visit 'https://americas.datasite.com'

Given(/^Open the app url$/) do
  visit 'https://americas.datasite.com'
end

Then 'Enter some {string} credentials' do |input_value|
  @authentication.wait_until_username_visible
  @authentication.username.set 'bot@datasite.com'
  @authentication.passowrd.set input_value
  @authentication.login.click
end

When('Enter an invalid email address') do
  @forgot_password.email.set 'invalid'
end

Given(/^Click on "(.*)" (link|button)$/) do |element_text, element_type|
  click_link element_text if element_type == "link"
  click_button element_text if element_type == "button"
end

Then('Verify the Effective as of Date is equal to today') do
  expect(@terms_of_use.effective_as_of_date).to eq Time.now.strftime("%B " + "%d, " + "%Y")
end

Given('Click open the language picker') do
  @terms_of_use.language_select.click
end

Then /^Should (NOT )?see (error message )?"(.*)" on the page$/i do |visibility, error_message, text_value|
  if (visibility.to_s.strip == 'NOT')
    page.assert_no_text(text_value, normalize_ws: true)
  else
    @authentication.wait_until_error_messages_visible if error_message
    page.assert_text(text_value, normalize_ws: true)
  end
end

Then /Should (NOT )?be on the "(.*)" page/ do |visibility, path_value|
  if (visibility.to_s.strip == 'NOT')
    !expect(page.current_path).to include path_value
  else
    expect(page.current_path).to include path_value
  end
end
