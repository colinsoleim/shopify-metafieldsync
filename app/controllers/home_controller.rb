class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.last
  end
end
