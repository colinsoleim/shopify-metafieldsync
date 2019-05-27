source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.3"

# Backend
gem 'rails', '5.2.3'
gem 'puma', '~> 3.0'
gem 'redis', '~> 4.0'
gem 'rest-client'
gem 'mini_magick', '~> 4.8'                 # Use ActiveStorage variant
gem 'bootsnap', '>= 1.1.0', require: false  # Reduces boot times through caching; required in config/boot.rb
gem 'shopify_app', '9.0.1'                  # Shopify
gem 'sidekiq'                               # Backround processing
gem 'sidekiq-throttled'                     # Backround processing
gem 'sassc-rails'                           # Frontend
gem 'uglifier', '>= 1.3.0'                  # Frontend
gem 'jquery-rails'                          # Jquery support
gem 'jbuilder', '~> 2.5'                    # JSON support
gem 'active_link_to'
gem 'kaminari'                              # Pagination
gem 'newrelic_rpm'                          # Performance Monitoring
gem 'mixpanel-ruby'                         # Monitoring
gem 'sentry-raven'                          # Error Monitoring

group :development, :test do
  gem 'byebug', platform: :mri                # Error Logging
  gem 'rb-readline'                           # Error Logging
  gem 'pry'                                   # Console Improvements
  gem 'rubocop', require: false               # Style Monitoring
  gem 'rubocop-performance', require: false   # Performance Monitoring
  gem 'bullet'
  # gem 'shopify-mock', git: 'https://github.com/colinsoleim/shopify-mock.git' # Shopify Test Doubles
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print'
end

group :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'rspec-sidekiq'
  gem 'factory_bot_rails'
  gem 'parallel_tests'
  gem 'faker'
  gem 'vcr'
  gem 'webmock'
  gem 'capybara', '>= 2.15', '< 4.0', require: false
  gem 'selenium-webdriver', require: false
  gem 'chromedriver-helper', require: false
  gem 'database_cleaner'
  gem 'launchy'
end

group :production, :development do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
