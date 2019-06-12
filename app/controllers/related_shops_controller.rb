class RelatedShopsController < AuthenticatedController
  def index
    @related_shops = @shop.related_shops
  end
end
