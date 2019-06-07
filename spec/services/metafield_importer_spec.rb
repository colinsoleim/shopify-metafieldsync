require "rails_helper"

describe MetafieldSyncer do
  describe "#call" do
    context "with a shop and metafield" do
      it "creates a duplicate of the specified metafield" do
        shop = create(:shop)
        metafield = build(:metafield)
        shop.activate_shopify_session

        expect do
          MetafieldImporter.new(
            shop_id: shop.id,
            shopify_metafield_id: metafield.shopify_id,
          ).call
        end.to change { Metafield.count }.by(1)
      end

      it "creates a duplicate of the specified metafield" do
        shop = create(:shop)
        metafield = build(:metafield)
        shop.activate_shopify_session
        
        expect do
          MetafieldImporter.call(
            shop_id: shop.id,
            shopify_metafield_id: metafield.shopify_id,
          )
        end.to change { Metafield.count }.by(1)
      end
    end
  end
end
