require 'rspec/autorun'
require 'capybara/rspec'

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  Capybara.run_server = false
  Capybara.current_driver = :selenium_chrome
  Capybara.javascript_driver = :selenium_chrome
  Capybara.current_driver = :selenium_chrome
  Capybara.default_wait_time = 5
  Capybara.app_host = 'https://roc-dev.9dev.net'
  config.include Capybara::DSL
end

def wait_until
  require 'timeout'
  Timeout::timeout Capybara.default_wait_time do
    sleep(0.1) until value = yield
    value
  end
end

def wait_for(selector)
  wait_until do
    page.evaluate_script("$('#{selector}').length > 0")
  end
end