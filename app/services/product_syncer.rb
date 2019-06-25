# A service to sync some or all Products between two different shops
# ProductImporter.new(
#  foo: bar
# )

class ProductSyncer
  include Service

  def call
    shop = Shop.find(options[:shop_id])
    shop.activate_shopify_session
    product = Product.find(options[:product_id])

    ShopifyAPI::Product.create(
      title: product.title,
    )
  end
end
