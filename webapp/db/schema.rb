# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140416053929) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.string   "url"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "num"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: true do |t|
    t.string   "contacter"
    t.string   "tel"
    t.string   "address"
    t.string   "other"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "product_catalogs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.decimal  "price"
    t.string   "images"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["store_id"], name: "index_products_on_store_id"

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.string   "address"
    t.string   "tel"
    t.string   "logo"
    t.string   "area"
    t.integer  "user_id"
    t.integer  "locate_id"
    t.integer  "productCatalog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["locate_id"], name: "index_stores_on_locate_id"
  add_index "stores", ["productCatalog_id"], name: "index_stores_on_productCatalog_id"
  add_index "stores", ["user_id"], name: "index_stores_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "openid"
    t.string   "weixin_nickname"
    t.string   "tel"
    t.integer  "locate_id"
    t.integer  "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["locate_id"], name: "index_users_on_locate_id"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
