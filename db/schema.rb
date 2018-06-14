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

ActiveRecord::Schema.define(version: 20180510004318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.float "longitude"
    t.float "latitude"
    t.string "street_address"
    t.string "city"
    t.string "postcode"
    t.string "state"
    t.string "country_code"
    t.integer "address_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "order_id"
    t.integer "buyer_id"
    t.integer "product_id"
    t.string "product"
    t.integer "seller_id"
    t.decimal "unit_weight"
    t.string "unit"
    t.decimal "unit_price"
    t.decimal "qty"
    t.decimal "amount"
    t.decimal "total_weight"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.integer "buyer_id"
    t.integer "product_id"
    t.string "product"
    t.integer "seller_id"
    t.decimal "unit_weight"
    t.string "unit"
    t.decimal "unit_price"
    t.decimal "qty"
    t.decimal "amount"
    t.decimal "total_weight"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "seller_id"
    t.string "seller"
    t.date "order_date"
    t.decimal "amount"
    t.string "pickup_address"
    t.float "latitude_pickup"
    t.float "longitude_pickup"
    t.string "delivery_address"
    t.float "latitude_delivery"
    t.float "longitude_delivery"
    t.text "notes"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id"
    t.string "product_type"
    t.string "description"
    t.decimal "unit_weight"
    t.string "unit"
    t.decimal "unit_price"
    t.decimal "qty_stock"
    t.decimal "qty_available"
    t.text "image_data"
    t.integer "product_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "fullname_company"
    t.text "image_data"
    t.text "short_bio"
    t.string "mobile"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "users"
end
