FactoryBot.define do
  factory :shop do
    shopify_domain { "412-test.myshopify.com" }
    shopify_token { "56c0055a3a84063b626e55a19173ee29" }
    email { "test@test.com" }
  end

  factory :second_shop, class: Shop do
    shopify_domain { "412-test-2.myshopify.com" }
    shopify_token { "56c0055a3a84063b626e55a19173ee29" }
    email { "test@test.com" }
  end

  factory :random_shop, class: Shop do
    shopify_domain { "#{SecureRandom.hex}.myshopify.com" }
    shopify_token { "56c0055a3a84063b626e55a19173ee29" }
    email { "test@test.com" }
  end
end
