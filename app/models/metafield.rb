class Metafield < ApplicationRecord
  def parent
    # find match by handle for now
    ShopifyAPI::Product.last
  end
end
