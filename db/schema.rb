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

ActiveRecord::Schema.define(version: 20140201182417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "prices", force: true do |t|
    t.integer  "veggie_id"
    t.integer  "primary_price"
    t.integer  "secondary_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["created_at"], name: "index_prices_on_created_at", using: :btree

  create_table "twitter_accounts", force: true do |t|
    t.string   "access_token"
    t.string   "access_secret"
    t.integer  "veggie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hash_tags",     default: [], array: true
    t.string   "handle"
  end

  create_table "veggies", force: true do |t|
    t.string   "eng_name"
    t.string   "heb_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.string   "icon"
    t.integer  "weight"
  end

  add_index "veggies", ["heb_name"], name: "index_veggies_on_heb_name", using: :btree

end
