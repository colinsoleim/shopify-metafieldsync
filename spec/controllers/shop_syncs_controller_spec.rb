require "rails_helper"

describe ShopSyncsController do
  render_views

  context "the user is logged in" do
    before(:each) do
      @shop = create(:shop)
      @shop.activate_shopify_session

      @request.session[:shopify] = @shop.id
      @request.session[:shopify_domain] = @shop.shopify_domain
    end

    it "renders the content of shop_syncs/index template" do
      get :index

      expect(response).to render_template("shop_syncs/index")
    end

    it "renders the content of shop_syncs/show template" do
      sync = create(:shop_sync)

      get :show, params: { id: sync.id }

      expect(response).to render_template("shop_syncs/show")
    end

    it "redirects to new_shop_sync_path" do
      post :create, params: { shop_sync: { import_to_shop_id: nil } }

      expect(controller).to redirect_to(new_shop_sync_path)
    end

    it "redirects to new_shop_sync_path" do
      import_shop = create(:random_shop)
      export_shop = create(:random_shop)

      post :create, params: {
        shop_sync: {
          import_to_shop_id: import_shop.id,
          export_from_shop_id: export_shop.id,
        },
      }

      expect(controller).to redirect_to(shop_sync_path(assigns[:shop_sync]))
    end
  end
end
