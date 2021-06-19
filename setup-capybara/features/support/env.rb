require 'cucumber'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'http://automationpractice.com' 
    config.default_max_wait_time = 20
end

Capybara.page.driver.browser.manage.window.maximize

