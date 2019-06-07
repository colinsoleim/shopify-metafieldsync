require "rails_helper"

describe "dashboard/show.html.erb" do
  context "when there is an active shop" do
    before(:each) do
      # @shop.activate_shopify_session

      # @request.session[:shopify] = @shop.id
      # @request.session[:shopify_domain] = @shop.shopify_domain
    end

    it "renders the shop's products" do
      assign(:shop, build(:shop))
      render
      expect(rendered).to have_content("Shop Info")
    end
  end
end
