FactoryBot.define do
  factory :metafield do
    sequence(:key) { |n| "Metafield #{n}" }
    value { "value" }
    value_type { "value_type" }
    namespace { "namespace" }
    description { "description" }
    owner_id { "owner_id" }
    owner_resource { "owner_resource" }
    shopify_id { "7133116498002" }
  end
end
