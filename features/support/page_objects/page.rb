require 'pry'

# This is more like base Page and Home Page combined, but gets the idea across I hope
class Page
  include Capybara::DSL
  attr_reader :url

  USERNAME = "tltest100@mailinator.com"
  PASSWORD = "Ohlookanacorn@123"

  def initialize()
    @base_url = "https://www.redfin.com"
    @suffix = "/"
  end

  def url
    @base_url + @suffix
  end

  ### LOCATORS ###
  def sign_in_link; "a[data-rf-test-name='SignInLink']" end
  def email_sign_in_button; ".emailSignInButtonWrapper .signInText" end
  def email_input_field; "input.email" end
  def password_field; "input.password" end
  def submit_button; "button.submitButton" end


  ### Page methods ###
  def login_main_user
    find(sign_in_link).click
  	find(email_sign_in_button).click
  	fill_in(email_input_field, :with => 'tltest100@mailinator.com')
  	fill_in(password_field, :with => 'Ohlookanacorn@123')
  	find(submit_button).click
  end
end

class SearchResultsPage < Page
  # initialize with @suffix (May take some doing given url pattern for searches)
  # locators
  # methods
end
