class ShopsController < AuthenticatedController
  def edit; end

  def update
    if @shop.update_attributes(shop_params)
      redirect_to edit_shop_path
    else
      redirect_to edit_shop_path
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:first_name, :last_name, :email)
  end
end
