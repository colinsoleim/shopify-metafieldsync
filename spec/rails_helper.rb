require "simplecov"
SimpleCov.start do
  add_filter "/config/initializers/"
  add_filter "/db/"
  add_filter "/spec/"
end

require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)

# Prevent database truncation if the environment is production
if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

require "rspec/rails"
require "webmock/rspec"
Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }

FakeShopifyRunner.boot

Capybara.app = HostMap.new(
  "www.example.com" => Capybara.app,
  "127.0.0.1" => Capybara.app,
  "github.com" => FakeShopify,
)

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
