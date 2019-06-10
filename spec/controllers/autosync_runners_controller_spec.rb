require "rails_helper"

describe AutosyncRunnersController do
  render_views

  context "the user is logged in" do
    before(:each) do
      @shop = create(:shop)
      @shop.activate_shopify_session

      @request.session[:shopify] = @shop.id
      @request.session[:shopify_domain] = @shop.shopify_domain
    end

    it "renders the content of autosync_runners/index template" do
      get :index

      expect(response).to render_template("autosync_runners/index")
    end
  end
end
