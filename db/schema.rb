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

ActiveRecord::Schema.define(version: 20150411153153) do

  create_table "customer_orders", force: :cascade do |t|
    t.string   "order_no",      limit: 255
    t.date     "order_date"
    t.string   "customer_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "customer_order_id", limit: 4
    t.string   "product_name",      limit: 255
    t.integer  "qty",               limit: 4
    t.decimal  "rate",                          precision: 10
    t.boolean  "received",          limit: 1
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "items", ["customer_order_id"], name: "index_items_on_customer_order_id", using: :btree

  add_foreign_key "items", "customer_orders"
end
