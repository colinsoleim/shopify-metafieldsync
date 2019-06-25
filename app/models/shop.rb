class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  belongs_to :master_shop,
             foreign_key: :master_shop_id,
             class_name: "Shop",
             optional: true
  has_many :shops, foreign_key: :master_shop_id, class_name: "Shop"
  has_many :shop_syncs
  has_many :autosync_runners
  has_many :products
  after_create :add_sync_token
  after_create :add_master_shop_id
  # validates_presence_of :email

  def add_sync_token
    return unless sync_token.nil?

    update(sync_token: SyncTokenGenerator.generate_code)
  end

  def add_master_shop_id
    return unless master_shop_id.nil?

    update(master_shop_id: id)
  end

  def related_shops
    master_shop&.shops
  end

  def shop_syncs
    ShopSync.where(master_shop_id: id)
  end

  def autosync_runners
    AutosyncRunner.where(master_shop_id: id)
  end

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

  def import_products
    activate_shopify_session
    product_count = ShopifyAPI::Product.count
    page_count = (product_count / 250.0).ceil

    (1..page_count).each do |index|
      ShopifyThrottledWorker.perform_async(
        service: "ProductImporter",
        args: MultiJson.dump(shop_id: id, page_count: index),
      )
    end
  end
end
