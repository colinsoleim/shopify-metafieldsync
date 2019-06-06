class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.all
  end
end
