require "rails_helper"

describe Shop do
  describe "#activate_shopify_session" do
    it "activates a shopify session" do
      @shop = create(:shop)
      @shop.activate_shopify_session
      expect(ShopifyAPI::Shop.current).to be_a(ShopifyAPI::Shop)
    end
  end

  describe "#pull_metafields_from" do
    it "should call to SyncMetafields service object" do
      shop = create(:shop)
      second_shop = create(:second_shop)
      metafield = create(:metafield)

      allow(ShopifyThrottledWorker).
        to receive(:perform_async).
        with(
          service: "MetafieldSyncer",
          args: MultiJson.dump(
            shop_id: shop.id,
            shopify_metafield_id: metafield.shopify_id,
          ),
        )
      shop.pull_metafields_from(second_shop)
      expect(ShopifyThrottledWorker).to have_received(:perform_async)
    end
  end
end
