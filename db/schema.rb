# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_18_143238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autosync_runners", force: :cascade do |t|
    t.integer "export_from_shop_id"
    t.integer "import_to_shop_id"
    t.datetime "last_started_at"
    t.datetime "last_ended_at"
    t.integer "master_shop_id"
    t.datetime "next_start_at"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metafields", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "value_type"
    t.string "namespace"
    t.string "description"
    t.string "owner_id"
    t.string "owner_resource"
    t.string "shopify_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_syncs", force: :cascade do |t|
    t.integer "export_from_shop_id"
    t.integer "import_to_shop_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "status"
    t.integer "master_shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sync_token"
    t.integer "master_shop_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

end
