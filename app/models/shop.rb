class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  def api_version
    ShopifyApp.configuration.api_version
  end

  def activate_shopify_session
    session = ShopifyAPI::Session.new(
      domain: shopify_domain,
      token: shopify_token,
      api_version: api_version,
    )
    ShopifyAPI::Base.activate_session(session)
  end

  def metafields
    Metafield.all
  end

  def pull_metafields_from(metafield_parent)
    metafields = MetafieldFinder.new(metafield_parent).metafields
    metafields.each do |metafield|
      ShopifyThrottledWorker.perform_async(
        service: "MetafieldSyncer",
        args: MultiJson.dump(
          shop_id: id,
          shopify_metafield_id: metafield.shopify_id,
        ),
      )
    end
  end
end
