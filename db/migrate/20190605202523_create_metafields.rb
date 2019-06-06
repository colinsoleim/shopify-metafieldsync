class CreateMetafields < ActiveRecord::Migration[5.2]
  def change
    create_table :metafields do |t|
      t.string :key
      t.string :value
      t.string :value_type
      t.string :namespace
      t.string :description
      t.string :owner_id
      t.string :owner_resource
      t.string :shopify_id

      t.timestamps
    end
  end
end
