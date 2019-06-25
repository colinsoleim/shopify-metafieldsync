require "rails_helper"

describe Shop do
  describe "#activate_shopify_session" do
    it "activates a shopify session" do
      @shop = create(:shop)
      @shop.activate_shopify_session
      expect(ShopifyAPI::Shop.current).to be_a(ShopifyAPI::Shop)
    end
  end

  describe "#import_products" do
    it "starts the ShopifyThrottledWorker job with ProductImporter service" do
      @shop = create(:shop)

      allow(ShopifyThrottledWorker).
        to receive(:perform_async).
        with(
          service: "ProductImporter",
          args: MultiJson.dump(
            shop_id: @shop.id,
            page_count: 1,
          ),
        )

      @shop.import_products
      expect(ShopifyThrottledWorker).to have_received(:perform_async)
    end
  end
end
