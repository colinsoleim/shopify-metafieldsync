class CreateMetafieldSyncs < ActiveRecord::Migration[5.2]
  def change
    create_table :metafield_syncs do |t|
      t.integer :export_from_shop_id
      t.integer :import_to_shop_id
      t.datetime :started_at
      t.datetime :ended_at
      t.string :status
      t.integer :master_shop_id

      t.timestamps
    end
  end
end
