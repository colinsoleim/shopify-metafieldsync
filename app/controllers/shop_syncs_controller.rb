class ShopSyncsController < AuthenticatedController
  def index
    @shop_syncs = @shop.shop_syncs
  end

  def show
    @shop_sync = ShopSync.find(params[:id])
  end
end
