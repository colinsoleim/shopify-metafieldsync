class RelatedShopsController < AuthenticatedController
  def index
    @related_shops = @shop.related_shops
  end

  def new; end

  def create
    if @shop && params[:sync_token] && Shop.exists?(sync_token: params[:sync_token])
      # find out which shop should be the master from some paid variable
      @shop.master_shop = Shop.find_by(sync_token: params[:sync_token])
      @shop.save

      redirect_to related_shops_path
    else
      redirect_to new_related_shop_path
    end
  end
end
