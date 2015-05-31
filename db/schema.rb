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

ActiveRecord::Schema.define(version: 20150530223207) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "email",          limit: 255, null: false
    t.string   "crypt_password", limit: 255, null: false
    t.string   "salt",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "subtitle",           limit: 255
    t.integer  "tour_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "banners", ["tour_id"], name: "index_banners_on_tour_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "description",        limit: 255
    t.integer  "tour_id",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "images", ["tour_id"], name: "index_images_on_tour_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", force: :cascade do |t|
    t.string   "description",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_file_name",    limit: 255
    t.string   "content_content_type", limit: 255
    t.integer  "content_file_size",    limit: 4
    t.datetime "content_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body",       limit: 65535
    t.text     "preview",    limit: 65535
    t.boolean  "popular",    limit: 1
    t.string   "slug",       limit: 255
    t.integer  "account_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["account_id"], name: "index_posts_on_account_id", using: :btree

  create_table "quotes", force: :cascade do |t|
    t.string   "travel_type",  limit: 255
    t.integer  "days",         limit: 4
    t.date     "travel_time"
    t.string   "name",         limit: 255
    t.string   "country",      limit: 255
    t.string   "city",         limit: 255
    t.string   "phone",        limit: 255
    t.string   "email",        limit: 255
    t.string   "payment_type", limit: 255
    t.string   "comments",     limit: 255
    t.integer  "adults",       limit: 4
    t.integer  "childs",       limit: 4
    t.integer  "age",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id",      limit: 4
  end

  add_index "quotes", ["tour_id"], name: "index_quotes_on_tour_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "description",         limit: 65535
    t.text     "short_description",   limit: 65535
    t.boolean  "home",                limit: 1,     default: false
    t.string   "name",                limit: 255
    t.integer  "tour_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "reviews", ["tour_id"], name: "index_reviews_on_tour_id", using: :btree

  create_table "tours", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "subtitle",           limit: 255
    t.text     "short_description",  limit: 65535
    t.text     "short_itinerary",    limit: 65535
    t.text     "itinerary",          limit: 65535
    t.integer  "days",               limit: 4
    t.integer  "nights",             limit: 4
    t.integer  "price",              limit: 4
    t.boolean  "place",              limit: 1,     default: false
    t.string   "slug",               limit: 255
    t.integer  "interest_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "popularity",         limit: 4,     default: 0
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "tours", ["interest_id"], name: "index_tours_on_interest_id", using: :btree

  add_foreign_key "banners", "tours"
  add_foreign_key "images", "tours"
  add_foreign_key "posts", "accounts"
  add_foreign_key "quotes", "tours"
  add_foreign_key "reviews", "tours"
  add_foreign_key "tours", "interests"
end
