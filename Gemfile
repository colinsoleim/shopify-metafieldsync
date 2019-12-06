source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.3"
gem "rails", "5.2.3"

# Backend
gem "active_link_to"
gem "bootsnap", ">= 1.1.0", require: false  # Reduces boot times through caching; required in config/boot.rb
gem "jbuilder", "~> 2.5"                    # JSON support
gem "jquery-rails"                          # Jquery support
gem "kaminari"                              # Pagination
gem "mini_magick", "~> 4.8"                 # Use ActiveStorage variant
gem "mixpanel-ruby"                         # Monitoring
gem "newrelic_rpm"                          # Performance Monitoring
gem "puma", "~> 3.12"
gem "redis", "~> 4.0"
gem "rest-client"
gem "sassc-rails"                           # Frontend
gem "sentry-raven"                          # Error Monitoring
gem "shopify_app", "9.0.1"                  # Shopify
gem "sidekiq"                               # Backround processing
gem "sidekiq-rate-limiter"                  # Backround processing
gem "uglifier", ">= 1.3.0"                  # Frontend

group :development, :test do
  gem "bullet"
  gem "byebug", platform: :mri                # Error Logging
  gem "dotenv-rails"
  gem "pry"                                   # Console Improvements
  gem "rb-readline"                           # Error Logging
  gem "rubocop"                               # Style Monitoring
  gem "rubocop-performance"                   # Performance Monitoring
  # gem "shopify-mock", git: "https://github.com/colinsoleim/shopify-mock.git" # Shopify Test Doubles
end

group :development do
  gem "awesome_print"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0", require: false
  gem "capybara_discoball"                                # Creates a fake Shopify for testing
  gem "chromedriver-helper", require: false
  gem "database_cleaner"                                  # DB resets between tests
  gem "factory_bot_rails"
  gem "faker"
  gem "launchy"                                           # Easier launch commands
  gem "parallel_tests"
  gem "rails-controller-testing"                          # Rails controller testing
  gem "rspec-rails", "~> 3.6"
  gem "rspec-sidekiq"
  gem "selenium-webdriver", require: false
  gem "simplecov", require: false                         # Test coverage
  gem "sinatra"                                           # Creates a fake Shopify for testing
  gem "timecop"                                           # Improve control of time in tests
  gem "vcr"
  gem "webmock"                                           # Mock HTTP requests
end

group :production, :development do
  gem "pg"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
