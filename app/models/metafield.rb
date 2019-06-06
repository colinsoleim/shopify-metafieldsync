class Metafield < ApplicationRecord
  def get_owner
    # find match by handle for now
    ShopifyAPI::Product.last
  end
end
