require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.inline!

describe ShopifyThrottledWorker, type: :job do
  context "for a valid service class" do
    before(:each) do
      @shop = FactoryBot.create(:shop)
      @shop.activate_shopify_session
    end

    skip "should call the service object" do
      response = ShopifyThrottledWorker.perform_async(
        service: "SyncMetafields",
        args: MultiJson.dump(shop_id: @shop.id)
      )

      expect(response).to be Integer
    end

    skip "should rate limit the service object" do
      response = ShopifyThrottledWorker.perform_async(
        service: "SyncMetafields",
        args: MultiJson.dump(shop_id: @shop.id)
      )

      expect(response).to be Integer
    end
  end

  context "for an invalid service class" do
    it "should return a NoMethodError" do
      expected = expect do
        ShopifyThrottledWorker.perform_async(
          service: "InvalidService",
          args: MultiJson.dump(shop_id: 0)
        )
      end

      expected.to raise_error NoMethodError
    end
  end
end
