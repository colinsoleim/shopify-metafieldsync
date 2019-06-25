require "sidekiq"
require "sidekiq/web"
require "sidekiq-rate-limiter/server"

unless Rails.env.development?
  require "sidekiq/testing"
  Sidekiq::Testing.inline!

  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    user == ENV["SIDEKIQ_USER"] &&
      password == ENV["SIDEKIQ_PASSWORD"]
  end
end

Sidekiq.configure_server do |config|
  config.logger = nil
  config.redis = { url: ENV["REDIS_QUEUE_URI"] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_QUEUE_URI"] }
end

Sidekiq::Logging.logger.level = Logger::WARN
