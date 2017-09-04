require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'pry'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

require_relative '../site/site.rb'

ENV['BROWSER'] ||= 'chrome'

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => ENV['BROWSER'].to_sym)
end

Capybara.default_max_wait_time = 15
