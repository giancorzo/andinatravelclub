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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120310155747) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "email",          :null => false
    t.string   "crypt_password", :null => false
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email"

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
  end

  add_index "banners", ["tour_id"], :name => "fk_banners_tours"

  create_table "images", :force => true do |t|
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "tour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["tour_id"], :name => "fk_images_tours"

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media", :force => true do |t|
    t.string   "description"
    t.string   "content_file_name"
    t.string   "content_content_type"
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "preview"
    t.boolean  "popular"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "posts", ["account_id"], :name => "fk_posts_accounts"
  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true

  create_table "quotes", :force => true do |t|
    t.string   "travel_type"
    t.integer  "days"
    t.date     "travel_time"
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.string   "payment_type"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "adults"
    t.integer  "childs"
    t.integer  "age"
  end

  create_table "reviews", :force => true do |t|
    t.text     "description"
    t.text     "short_description"
    t.boolean  "home",                :default => false
    t.string   "name"
    t.integer  "tour_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["tour_id"], :name => "fk_reviews_tours"

  create_table "tours", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "short_description"
    t.text     "short_itinerary"
    t.text     "itinerary"
    t.integer  "days"
    t.integer  "nights"
    t.integer  "price"
    t.boolean  "place",              :default => false
    t.integer  "popularity"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tours", ["interest_id"], :name => "fk_interests_tours"

end
