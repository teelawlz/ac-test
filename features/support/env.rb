require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'dotenv/load'
require 'pry'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

require_relative '../site/site.rb'

Dotenv.load

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => ENV['BROWSER'].to_sym)
end

# Phantomjs was attempted, but had issues getting it to locate elements
# Capybara.javascript_driver = :poltergeist
# Capybara.default_driver = :poltergeist
# Capybara.register_driver :poltergeist do |app|
#   options = {
#       :js_errors => false,
#       :phantomjs_options => ['--load-images=no', '--disk-cache=false']
#   }
#   Capybara::Poltergeist::Driver.new(app, options)
# end
Capybara.default_max_wait_time = 15
