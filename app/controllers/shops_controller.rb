class ShopsController < AuthenticatedController
  def edit; end

  def update
    @shop.update_attributes(shop_params)
    redirect_to edit_shop_path
  end

  private

  def shop_params
    params.require(:shop).permit(:first_name, :last_name, :email)
  end
end
