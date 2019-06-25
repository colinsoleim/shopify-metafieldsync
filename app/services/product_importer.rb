# A service to sync some or all metafields between two different shops
# MetafieldImporter.new(
#  foo: bar
# )

class ProductImporter
  include Service

  def call
    shop = Shop.find(options[:shop_id])
    shop.activate_shopify_session
    products = ShopifyAPI::Product.where(limit: 250, page: options[:page_count])

    products.each do |product|
      Product.find_or_create_by(
        title: product.title,
        shop_id: shop.id,
      )
    end
  end
end
