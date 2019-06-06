require "rails_helper"
require "sidekiq/testing"
Sidekiq::Testing.fake!

describe ShopifyThrottledWorker, type: :job do
  describe "#throttled?" do
    context "when limit exceeded" do
      it "should be throttled" do
        Sidekiq::Testing.disable! do
          shop = FactoryBot.create(:shop)
          shop.activate_shopify_session
          metafield = FactoryBot.create(:metafield)

          10.times do
            ShopifyThrottledWorker.perform_async(
              service: "MetafieldImporter",
              args: MultiJson.dump(
                shop_id: shop.id,
                shopify_metafield_id: metafield.shopify_id,
              ),
            )
          end
          # TODO: Clean this up somehow to check it runs at exactly 2 per second
          expect(Sidekiq::Queue.new.size).to be > 5
        end
      end
    end
  end

  describe "#perform_async" do
    context "for a valid service class and shop" do
      before(:each) do
        @shop = create(:shop)
        @shop.activate_shopify_session
        @metafield = create(:metafield)
      end

      it "should call the service object" do
        Sidekiq::Testing.inline! do
          allow(MetafieldImporter).
            to receive(:call).
            with(shop_id: @shop.id, shopify_metafield_id: @metafield.shopify_id)

          ShopifyThrottledWorker.perform_async(
            service: "MetafieldImporter",
            args: MultiJson.dump(
              shop_id: @shop.id,
              shopify_metafield_id: @metafield.shopify_id,
            ),
          )

          expect(MetafieldImporter).to have_received(:call)
        end
      end
    end

    context "for an invalid service class" do
      it "should return a NoMethodError" do
        Sidekiq::Testing.inline! do
          expected = expect do
            ShopifyThrottledWorker.perform_async(
              service: "InvalidService",
              args: MultiJson.dump(shop_id: 0),
            )
          end

          expected.to raise_error NoMethodError
        end
      end
    end
  end
end
