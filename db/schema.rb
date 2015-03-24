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

ActiveRecord::Schema.define(version: 20150323210340) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string "name"
    t.text   "text"
    t.string "asset"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"

  create_table "models", force: true do |t|
    t.string   "name"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
    t.string   "asset"
    t.text     "text"
    t.integer  "valuta_id"
    t.integer  "percent"
  end

  add_index "models", ["subcategory_id"], name: "index_models_on_subcategory_id"
  add_index "models", ["valuta_id"], name: "index_models_on_valuta_id"
  add_index "models", ["vendor_id"], name: "index_models_on_vendor_id"

  create_table "option_types", force: true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "option_types", ["type_id"], name: "index_option_types_on_type_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",          precision: 8, scale: 2
    t.string   "marking"
    t.integer  "subcategory_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset"
  end

  add_index "products", ["model_id"], name: "index_products_on_model_id"
  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id"

  create_table "prototype_option_types", force: true do |t|
    t.integer  "prototype_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prototype_option_types", ["option_type_id"], name: "index_prototype_option_types_on_option_type_id"
  add_index "prototype_option_types", ["prototype_id"], name: "index_prototype_option_types_on_prototype_id"

  create_table "prototypes", force: true do |t|
    t.string  "name"
    t.integer "subcategory_id"
  end

  add_index "prototypes", ["subcategory_id"], name: "index_prototypes_on_subcategory_id"

  create_table "subcategories", force: true do |t|
    t.string  "name"
    t.integer "category_id"
    t.text    "text"
    t.string  "asset"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "types", force: true do |t|
    t.string "name"
  end

  add_index "types", ["name"], name: "index_types_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "valuta", force: true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variant_ints", force: true do |t|
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variant_strs", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variants", force: true do |t|
    t.integer "product_id"
    t.integer "option_type_id"
    t.string  "value"
  end

  add_index "variants", ["option_type_id"], name: "index_variants_on_option_type_id"
  add_index "variants", ["product_id"], name: "index_variants_on_product_id"

  create_table "vendors", force: true do |t|
    t.string  "name"
    t.integer "country_id"
  end

  add_index "vendors", ["country_id"], name: "index_vendors_on_country_id"

end
