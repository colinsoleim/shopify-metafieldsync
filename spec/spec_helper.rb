RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  # config.profile_examples = 10

  config.before(:each) do
    WebMock.stub_request(:get, "#{FakeShopify.api_base}/shop.json").
      with(
        headers: {
          'Accept'=>'application/json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'ShopifyAPI/7.0.1 ActiveResource/5.1.0 Ruby/2.6.3',
          'X-Shopify-Access-Token'=>'56c0055a3a84063b626e55a19173ee29'
        }
      ).to_return(status: 200, body: "{\"id\":7580287058,\"name\":\"412 Test\",\"email\":\"soleimc@gmail.com\",\"domain\":\"412-test.myshopify.com\",\"province\":\"Pennsylvania\",\"country\":\"US\",\"address1\":\"216 Swope St\",\"zip\":\"15206\",\"city\":\"Pittsburgh\",\"source\":null,\"phone\":\"5857508920\",\"latitude\":40.4589407,\"longitude\":-79.92284210000001,\"primary_locale\":\"en\",\"address2\":\"\",\"created_at\":\"2019-05-26T12:18:37-04:00\",\"updated_at\":\"2019-05-26T12:25:20-04:00\",\"country_code\":\"US\",\"country_name\":\"United States\",\"currency\":\"USD\",\"customer_email\":\"soleimc@gmail.com\",\"timezone\":\"(GMT-05:00) Eastern Time (US \\u0026 Canada)\",\"iana_timezone\":\"America/New_York\",\"shop_owner\":\"Colin Soleim\",\"money_format\":\"${{amount}}\",\"money_with_currency_format\":\"${{amount}} USD\",\"weight_unit\":\"lb\",\"province_code\":\"PA\",\"taxes_included\":false,\"tax_shipping\":null,\"county_taxes\":true,\"plan_display_name\":\"affiliate\",\"plan_name\":\"affiliate\",\"has_discounts\":false,\"has_gift_cards\":false,\"myshopify_domain\":\"412-test.myshopify.com\",\"google_apps_domain\":null,\"google_apps_login_enabled\":null,\"money_in_emails_format\":\"${{amount}}\",\"money_with_currency_in_emails_format\":\"${{amount}} USD\",\"eligible_for_payments\":true,\"requires_extra_payments_agreement\":false,\"password_enabled\":true,\"has_storefront\":true,\"eligible_for_card_reader_giveaway\":false,\"finances\":true,\"primary_location_id\":17063280722,\"checkout_api_supported\":false,\"multi_location_enabled\":true,\"setup_required\":false,\"force_ssl\":true,\"pre_launch_enabled\":false,\"enabled_presentment_currencies\":[\"USD\"]}", headers: {})

    WebMock.stub_request(:get, "#{FakeShopify.api_base}/products.json").
      with(
        headers: {
          'Accept'=>'application/json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'ShopifyAPI/7.0.1 ActiveResource/5.1.0 Ruby/2.6.3',
          'X-Shopify-Access-Token'=>'56c0055a3a84063b626e55a19173ee29'
        }
      ).to_return(status: 200, body: "[{\"id\":2549162803282,\"title\":\"Test Product\",\"body_html\":\"\",\"vendor\":\"412 Test\",\"product_type\":\"\",\"created_at\":\"2019-06-05T17:39:41-04:00\",\"handle\":\"test-product\",\"updated_at\":\"2019-06-05T17:39:41-04:00\",\"published_at\":\"2019-06-05T17:39:36-04:00\",\"template_suffix\":null,\"tags\":\"\",\"published_scope\":\"web\",\"admin_graphql_api_id\":\"gid://shopify/Product/2549162803282\",\"variants\":[{\"id\":22655646072914,\"title\":\"Default Title\",\"price\":\"0.00\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2019-06-05T17:39:41-04:00\",\"updated_at\":\"2019-06-05T17:39:41-04:00\",\"taxable\":true,\"barcode\":\"\",\"grams\":0,\"image_id\":null,\"weight\":0.0,\"weight_unit\":\"lb\",\"inventory_item_id\":23916875022418,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid://shopify/ProductVariant/22655646072914\"}],\"options\":[{\"id\":3569591976018,\"product_id\":2549162803282,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}],\"images\":[],\"image\":null}]", headers: {})
  
    WebMock.stub_request(:post, "#{FakeShopify.api_base}/products/2549162803282/metafields.json").
      with(
        #body: "{\"metafield\":{\"key\":\"key\",\"value\":\"value\",\"value_type\":\"string\",\"namespace\":\"namespace\",\"description\":\"description\"}}",
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'ShopifyAPI/7.0.1 ActiveResource/5.1.0 Ruby/2.6.3',
          'X-Shopify-Access-Token'=>'56c0055a3a84063b626e55a19173ee29'
        }
      ).to_return(status: 200, body: "{}", headers: {})

    WebMock.stub_request(:get, "#{FakeShopify.api_base}/metafields/7133116498002.json").
         with(
           headers: {
          'Accept'=>'application/json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'ShopifyAPI/7.0.1 ActiveResource/5.1.0 Ruby/2.6.3',
          'X-Shopify-Access-Token'=>'56c0055a3a84063b626e55a19173ee29'
           }).
         to_return(status: 200, body: "{\"id\":7133116498002,\"namespace\":\"namespace\",\"key\":\"key\",\"value\":\"value\",\"value_type\":\"string\",\"description\":\"description\",\"owner_id\":2549162803282,\"created_at\":\"2019-06-05T17:58:32-04:00\",\"updated_at\":\"2019-06-05T17:58:32-04:00\",\"owner_resource\":\"product\",\"admin_graphql_api_id\":\"gid://shopify/Metafield/7133116498002\"}", headers: {})
  end
end