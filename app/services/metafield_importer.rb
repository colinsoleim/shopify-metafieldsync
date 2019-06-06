# A service to sync some or all metafields between two different shops
# MetafieldImporter.new(
#  foo: bar
# )

class MetafieldImporter
  include Service

  def call
    shopify_metafield = get_shopify_metafield(options[:shopify_metafield_id])

    Metafield.find_or_create_by(
      key: shopify_metafield.key,
      owner_id: shopify_metafield.owner_id,
      owner_resource: shopify_metafield.owner_resource,
      value: shopify_metafield.value,
      value_type: shopify_metafield.value_type,
      namespace: shopify_metafield.namespace,
      description: shopify_metafield.description,
    )
  end

  private

  def get_shopify_metafield(id)
    ShopifyAPI::Metafield.find(id)
  end
end
