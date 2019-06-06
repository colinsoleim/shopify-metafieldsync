require "sinatra/base"
require "capybara_discoball"

class FakeShopify < Sinatra::Base
  disable :protection

  post "/teams/:team_id/memberships/:id" do
    content_type :json

    {}.to_json
  end

  delete "/teams/:team_id/members/:id" do
    content_type :json

    {}.to_json
  end

  get "/teams/:team_id/members/:id" do
    content_type :json

    {}.to_json
  end

  get "/users/:username/keys" do
    content_type :json

    [{ "id" => 1, "key" => "ssh-rsa AAA" }].to_json
  end

  get "/users/:username" do
    content_type :json

    { "avatar_url" => "", "name" => "Ralph Robot" }.to_json
  end

  not_found do
    content_type :json

    { "error" => "Edit #{__FILE__} to fake out this request" }.to_json
  end

  def self.api_base
    "https://412-test.myshopify.com/admin/api/2019-04"
  end
end

FakeShopifyRunner = Capybara::Discoball::Runner.new(FakeShopify) do |server|
  # url = "http://#{server.host}:#{server.port}"
end
