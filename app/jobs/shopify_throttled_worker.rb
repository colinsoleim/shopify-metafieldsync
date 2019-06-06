# An example of usage
# 1000.times { ShopifyThrottledWorker.perform_async(
#   service: "ServiceClass",
#   args: MultiJson.dump(shop_id: shop.id, some_arg: 0)
# ) }

class ShopifyThrottledWorker
  include Sidekiq::Worker

  EXCEPTIONS = [
    ActiveResource::UnauthorizedAccess,
    ActiveResource::ForbiddenAccess,
  ].freeze

  sidekiq_options queue: "default",
                  rate: {
                    name: "shopify_standard_rate_limit",
                    limit: 2,
                    period: 1,
                  }

  def perform(options)
    options["service"].safe_constantize.call(
      MultiJson.load(options["args"]).deep_symbolize_keys,
    )
  rescue *EXCEPTIONS => e
    Rails.logger.error(e)
  end
end
