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

ActiveRecord::Schema.define(version: 20150227153629) do

  create_table "build_lots", force: true do |t|
    t.integer  "my_build_id"
    t.integer  "lot_id"
    t.integer  "pull_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "pull_date"
    t.integer  "employee_id"
  end

  add_index "build_lots", ["lot_id"], name: "index_build_lots_on_lot_id"
  add_index "build_lots", ["my_build_id"], name: "index_build_lots_on_my_build_id"

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true
  add_index "employees", ["first_name"], name: "index_employees_on_first_name"
  add_index "employees", ["last_name"], name: "index_employees_on_last_name"
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true

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
    t.integer  "received_qty"
    t.integer  "inventory_qty"
    t.integer  "item_id"
    t.boolean  "cleaned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "purchase_order_id"
    t.date     "received_date"
    t.boolean  "full_po_qty"
    t.integer  "accepted_qty"
    t.integer  "rejected_qty"
    t.date     "date_cleaned"
    t.boolean  "ncmr"
  end

  add_index "lots", ["accepted_qty"], name: "index_lots_on_accepted_qty"
  add_index "lots", ["date_cleaned"], name: "index_lots_on_date_cleaned"
  add_index "lots", ["full_po_qty"], name: "index_lots_on_full_po_qty"
  add_index "lots", ["purchase_order_id"], name: "index_lots_on_purchase_order_id"
  add_index "lots", ["received_date"], name: "index_lots_on_received_date"
  add_index "lots", ["rejected_qty"], name: "index_lots_on_rejected_qty"

  create_table "my_builds", force: true do |t|
    t.integer  "start_qty"
    t.integer  "scrap_qty"
    t.string   "description"
    t.date     "start_date"
    t.date     "ship_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete"
    t.boolean  "current"
  end

  add_index "my_builds", ["complete"], name: "index_my_builds_on_complete"
  add_index "my_builds", ["current"], name: "index_my_builds_on_current"
  add_index "my_builds", ["scrap_qty"], name: "index_my_builds_on_scrap_qty"
  add_index "my_builds", ["start_qty"], name: "index_my_builds_on_start_qty"

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
    t.date     "estimated_arrival"
    t.integer  "supplier_id"
    t.string   "status"
  end

  add_index "purchase_orders", ["estimated_arrival"], name: "index_purchase_orders_on_estimated_arrival"
  add_index "purchase_orders", ["status"], name: "index_purchase_orders_on_status"
  add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id"

  create_table "quantities", force: true do |t|
    t.integer  "purchase_order_id"
    t.integer  "item_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount_received"
    t.integer  "amount_remaining"
  end

  add_index "quantities", ["amount_received"], name: "index_quantities_on_amount_received"
  add_index "quantities", ["amount_remaining"], name: "index_quantities_on_amount_remaining"

  create_table "receptions", force: true do |t|
    t.date     "date"
    t.integer  "quantity"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "purchase_order_id"
    t.integer  "supplier_id"
  end

  add_index "receptions", ["date"], name: "index_receptions_on_date"

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
    t.boolean  "critical"
  end

end
