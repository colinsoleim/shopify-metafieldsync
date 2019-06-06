# A service to sync some or all metafields between two different shops
# MetafieldSyncer.new(
#  foo: bar
# )

class MetafieldSyncer
  include Service

  def call
    metafield = Metafield.find options[:metafield_id]
    owner = metafield.get_owner

    owner.add_metafield(
      ShopifyAPI::Metafield.new(
        "key": metafield.key,
        "value": metafield.value,
        "value_type": metafield.value_type,
        "namespace": metafield.namespace,
        "description": metafield.description,
      ),
    )
  end

  private

  def metafield
    # Metafield.find options()
    Metafield.find_or_create_by(
      key: "key",
      value: "value",
      value_type: "string",
      namespace: "namespace",
      description: "description",
      owner_id: "owner_id",
      owner_resource: "owner_resource",
    )
  end
end
