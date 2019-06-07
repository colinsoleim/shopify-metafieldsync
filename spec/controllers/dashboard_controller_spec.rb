require "rails_helper"

describe DashboardController do
  render_views

  context "the user is logged in" do
    before(:each) do
      @shop = create(:shop)
      @shop.activate_shopify_session

      @request.session[:shopify] = @shop.id
      @request.session[:shopify_domain] = @shop.shopify_domain
    end

    it "renders the content of dashboard/show template" do
      get :show

      expect(response).to render_template("dashboard/show")
    end
  end
end
