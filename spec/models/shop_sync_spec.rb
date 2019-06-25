require "rails_helper"

describe ShopSync do
  describe "#start" do
    it "starts the ShopifyThrottledWorker job with ProductSyncer service" do
      @shop_sync = create(:shop_sync)
      product = Product.create(shop_id: @shop_sync.export_from_shop_id)

      allow(ShopifyThrottledWorker).
        to receive(:perform_async).
        with(
          service: "ProductSyncer",
          args: MultiJson.dump(
            shop_id: @shop_sync.import_to_shop_id,
            product_id: product.id,
          ),
        )

      @shop_sync.start
      expect(@shop_sync.status).to eq("In Progress")
      expect(ShopifyThrottledWorker).to have_received(:perform_async)
    end
  end
end
