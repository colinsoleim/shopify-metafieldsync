ShopifyApp.configure do |config|
  config.application_name = "MetafieldMatch"
  config.api_key = ENV["SHOPIFY_API_KEY"]
  config.secret = ENV["SHOPIFY_SECRET"]
  config.scope = "read_products,write_products"

  config.session_repository = Shop
  config.embedded_app = true
  config.after_authenticate_job = false

  config.api_version = "2019-04"

  # topics = Rails.application.credentials.shopify_app[:webhook_topics]
  # config.webhooks = topics.each_with_object([]) do |topic, acc|
  #   acc << {
  #     topic: topic,
  #     format: "json",
  #     address: "#{ENV["HOST"]}/webhooks/#{topic.parameterize(separator: "_")}"
  #   }
  # end
end
