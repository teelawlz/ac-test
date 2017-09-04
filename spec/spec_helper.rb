require 'faraday'
require 'json'
require 'pry'
require 'test_helper_module'

## Setup declarations ##
CONN = Faraday.new(:url => "https://api.edmunds.com/api/vehicle/v2")
API_KEY = 'bucp3bkpzv85eg9k2kmbkt8p'

RSpec.configure do |config|
  config.include EdmundsTestHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
