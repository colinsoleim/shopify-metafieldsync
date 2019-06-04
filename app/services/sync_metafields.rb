class SyncMetafields
  include Service

  def call(options)
    metafields_to_sync = build_metafields_to_sync(options)
    
    shop = pull_metafields_into_shop

    metafields_to_sync.each do |metafield|
      shop.add_metafield(
        name: metafield.name,
        other_variables: metafield.other_variables
      )
    end
  end

  def build_metafields_to_sync(options)
    if options["scope"] == "all"
      metafields_to_sync = shop.get_all_metafields
    elsif options["scope"] == "all-products"
      metafields_to_sync = shop.get_all_product_metafields
    elsif options["scope"] == "all-products-and-variants" 
      metafields_to_sync = shop.get_all_product_metafields + shop.get_all_variant_metafields
    elsif options["scope"].is_a? ShopifyProduct
      metafields_to_sync = shopify_product.get_all_metafields
    end
  end
end
