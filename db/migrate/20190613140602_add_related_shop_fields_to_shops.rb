class AddRelatedShopFieldsToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :sync_token, :string
    add_column :shops, :master_shop_id, :integer
  end
end
