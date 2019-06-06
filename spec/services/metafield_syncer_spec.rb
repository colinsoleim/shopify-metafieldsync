require "rails_helper"

describe MetafieldSyncer do
  describe "#call" do
    context "with a shop and metafield" do
      it "creates a duplicate of the specified metafield" do
        shop = create(:shop)
        metafield = create(:metafield)
        shop.activate_shopify_session

        MetafieldSyncer.new(metafield_id: metafield.id).call
        expect(WebMock).to have_requested(
          :post,
          "#{FakeShopify.api_base}/products/2549162803282/metafields.json",
        ).once
      end
    end
  end
end
