# A service to sync some or all metafields between two different shops
# MetafieldSyncer.new(
#  foo: bar
# )

class MetafieldSyncer
  include Service

  def call
    metafield = Metafield.find options[:metafield_id]

    metafield.parent.add_metafield(
      ShopifyAPI::Metafield.new(
        "key": metafield.key,
        "value": metafield.value,
        "value_type": metafield.value_type,
        "namespace": metafield.namespace,
        "description": metafield.description,
      ),
    )
  end
end
