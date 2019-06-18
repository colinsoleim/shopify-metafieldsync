require "rails_helper"

describe RelatedShopsController do
  render_views

  context "the user is logged in" do
    before(:each) do
      @shop = create(:shop)
      @shop.activate_shopify_session

      @request.session[:shopify] = @shop.id
      @request.session[:shopify_domain] = @shop.shopify_domain
    end

    it "renders the content of related_shops/index template" do
      get :index

      expect(response).to render_template("related_shops/index")
    end

    it "redirects to related_shops_path" do
      post :create, params: { sync_token: @shop.sync_token }

      expect(controller).to redirect_to(related_shops_path)
    end

    it "redirects to new_related_shop_path" do
      post :create, params: { sync_token: nil }

      expect(controller).to redirect_to(new_related_shop_path)
    end
  end
end
