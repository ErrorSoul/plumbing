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

ActiveRecord::Schema.define(version: 20150116063419) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["subcategory_id"], name: "index_models_on_subcategory_id"

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
    t.string   "name"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prototypes", ["subcategory_id"], name: "index_prototypes_on_subcategory_id"

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "types", ["name"], name: "index_types_on_name", unique: true

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
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.integer  "value_id"
    t.string   "value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variants", ["option_type_id"], name: "index_variants_on_option_type_id"
  add_index "variants", ["product_id"], name: "index_variants_on_product_id"
  add_index "variants", ["value_id", "value_type"], name: "index_variants_on_value_id_and_value_type"

end
