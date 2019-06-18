FactoryBot.define do
  factory :shop_sync do
    association :import_to_shop, factory: :random_shop
    association :export_from_shop, factory: :random_shop
    association :master_shop, factory: :random_shop

    started_at { Time.now - 1.hour }
    ended_at { Time.now - 1.minute }
  end
end
