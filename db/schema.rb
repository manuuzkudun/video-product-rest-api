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

ActiveRecord::Schema.define(version: 20170408161521) do

  create_table "episodes", force: :cascade do |t|
    t.integer  "season_id"
    t.string   "title"
    t.text     "plot"
    t.integer  "episode_in_season"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "purchase_options", force: :cascade do |t|
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.string   "video_quality"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "video_product_id"
    t.integer  "purchase_option_id"
    t.datetime "expiration"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
    t.index ["video_product_id"], name: "index_purchases_on_video_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "video_products", force: :cascade do |t|
    t.string   "title"
    t.text     "plot"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
