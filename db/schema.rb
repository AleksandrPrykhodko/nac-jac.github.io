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

ActiveRecord::Schema.define(version: 20160722084043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.integer  "cart_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buyers", ["cart_id"], name: "index_buyers_on_cart_id", using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.string   "email"
    t.text     "address"
    t.string   "notes"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "completed",                           default: false
    t.string   "token"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_subscriptions", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mail_subscriptions", ["email"], name: "index_mail_subscriptions_on_email", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "notes"
    t.string   "photo_url"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "price",       precision: 8, scale: 2
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
end
