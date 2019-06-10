require "rails_helper"

describe ShopsController do
  render_views

  context "the user is logged in" do
    before(:each) do
      @shop = create(:shop)
      @shop.activate_shopify_session

      @request.session[:shopify] = @shop.id
      @request.session[:shopify_domain] = @shop.shopify_domain
    end

    it "renders the shops/edit template" do
      get :edit, params: { id: @shop.id }

      expect(response).to render_template("shops/edit")
    end
  end
end
