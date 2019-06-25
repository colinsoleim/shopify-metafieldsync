class ShopSyncsController < AuthenticatedController
  def index
    @shop_syncs = @shop.shop_syncs
  end

  def show
    @shop_sync = ShopSync.find(params[:id])
  end

  def new; end

  def create
    @shop_sync = ShopSync.new(shop_sync_params)
    @shop_sync.master_shop = @shop

    if @shop_sync.save
      @shop_sync.start
      redirect_to shop_sync_path(@shop_sync)
    else
      redirect_to new_shop_sync_path
    end
  end

  private

  def shop_sync_params
    params.require(:shop_sync).permit(:export_from_shop_id, :import_to_shop_id)
  end
end
