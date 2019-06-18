class AddPersonalInformationFieldsToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :first_name, :string
    add_column :shops, :last_name, :string
    add_column :shops, :email, :string
  end
end
