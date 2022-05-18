require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'dotenv'
require 'screen-recorder'

Dotenv.load

Capybara.register_driver :driver do |app|
  browser = ENV.fetch('BROWSER', 'chrome')

  case browser
  when 'chrome'
    options = ::Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--start-maximized')

    Capybara::Selenium::Driver.new(app, browser: :chrome, url: ENV['HUB_URL'], capabilities: options)
  when 'firefox'
    options = ::Selenium::WebDriver::Firefox::Options.new
    Capybara::Selenium::Driver.new(app, browser: :firefox, url: ENV['HUB_URL'], capabilities: options)
  when 'edge'
    options = ::Selenium::WebDriver::Edge::Options.new
    Capybara::Selenium::Driver.new(app, browser: :edge, url: ENV['HUB_URL'], capabilities: options)
  else # when 'without_browser'
    Capybara.default_driver = :mechanize
  end
end

Capybara.default_driver = :driver
Capybara.default_selector = :css
Capybara.default_max_wait_time = 30
Capybara.run_server = false
