require "capybara/cucumber"
require "selenium/webdriver"
require 'yaml'
require 'json'
require 'os'
require 'report_builder'
require 'byebug'
require 'webdrivers'
require 'site_prism'

ENV['run'] ||= 'local'
ENV['browser'] ||= 'chrome'
ENV['sys'] ||= 'windows'

$filePath = Dir.pwd.gsub('/', '/') + "/features/support/"

@lang = ENV['app_lang']

if ENV['run'] == 'local'
  capabilities = {
    commandTimeout: 600
  }

  if ENV['HEADLESS'] || ENV['H']
    default_driver = :selenium_chrome_headless
  else
    default_driver = :selenium
  end

  if ENV['browser'] == 'chrome'
    Capybara.default_driver = default_driver
    browserName = :chrome
  end
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
                                   browser: browserName,
                                   desired_capabilities: capabilities
    )
  end

  Capybara.default_max_wait_time = 10
  window = Capybara.current_session.driver.browser.manage.window
  window.resize_to(1600, 900)
  window.move_to(700, 0)
end
