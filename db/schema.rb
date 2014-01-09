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

ActiveRecord::Schema.define(version: 20140109172826) do

  create_table "items", force: true do |t|
    t.string   "part_number"
    t.string   "name"
    t.integer  "on_order_qty"
    t.integer  "in_inspection_qty"
    t.integer  "stock_qty"
    t.integer  "ncmr_qty"
    t.string   "name_and_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "revision"
    t.string   "number_and_rev"
    t.string   "number_rev_name"
    t.boolean  "current_rev"
  end

  create_table "lots", force: true do |t|
    t.integer  "number"
    t.integer  "initial_qty"
    t.integer  "current_qty"
    t.integer  "item_id"
    t.boolean  "cleaned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "orders", force: true do |t|
    t.integer  "purchase_order_id"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.integer  "item_id"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["item_id"], name: "index_parts_on_item_id"
  add_index "parts", ["supplier_id"], name: "index_parts_on_supplier_id"

  create_table "purchase_orders", force: true do |t|
    t.date     "date"
    t.string   "purchase_order_number"
    t.decimal  "cost"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quantities", force: true do |t|
    t.integer  "purchase_order_id"
    t.integer  "item_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
