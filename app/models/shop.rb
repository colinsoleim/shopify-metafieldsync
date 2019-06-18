class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  belongs_to :master_shop, foreign_key: :master_shop_id, class_name: "Shop", optional: true
  has_many :shops, foreign_key: :master_shop_id, class_name: "Shop"
  has_many :shop_syncs
  has_many :autosync_runners
  
  after_create :add_sync_token
  after_create :add_master_shop_id

  validates_presence_of :email
  
  def add_sync_token
    if self.sync_token.nil?
      update(sync_token: SyncTokenGenerator.generate_code)
    end
  end

  def add_master_shop_id
    if master_shop_id.nil?
      update(master_shop_id: self.id)
    end
  end

  def related_shops
    if master_shop
      master_shop.shops
    end
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
