class CreateAutosyncRunners < ActiveRecord::Migration[5.2]
  def change
    create_table :autosync_runners do |t|
      t.integer :export_from_shop_id
      t.integer :import_to_shop_id
      t.datetime :last_started_at
      t.datetime :last_ended_at
      t.integer :master_shop_id
      t.datetime :next_start_at
      t.string :frequency

      t.timestamps
    end
  end
end
