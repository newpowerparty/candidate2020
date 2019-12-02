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

ActiveRecord::Schema.define(version: 2019_12_02_070438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "candidate_locations", force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidate_locations_on_candidate_id"
    t.index ["location_id"], name: "index_candidate_locations_on_location_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "headshot"
    t.string "typee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.text "content"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "candidate_id"
    t.string "phone"
    t.string "email"
    t.string "official_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_contacts_on_candidate_id"
  end

  create_table "donation_categories", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donation_items", force: :cascade do |t|
    t.bigint "donation_reward_id"
    t.bigint "donation_id"
    t.integer "quantity"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_id"], name: "index_donation_items_on_donation_id"
    t.index ["donation_reward_id"], name: "index_donation_items_on_donation_reward_id"
  end

  create_table "donation_rewards", force: :cascade do |t|
    t.bigint "donation_category_id"
    t.integer "amount"
    t.string "image"
    t.boolean "active", default: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_category_id"], name: "index_donation_rewards_on_donation_category_id"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "donation_category_id"
    t.string "name"
    t.string "citizend"
    t.string "mobile_phone"
    t.integer "total_amount"
    t.text "description"
    t.integer "receipt_type"
    t.integer "donate_type"
    t.boolean "confirmed"
    t.datetime "confirmed_at"
    t.boolean "anonymous", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_type"
    t.string "county"
    t.string "district"
    t.integer "zipcode"
    t.string "road"
    t.index ["donation_category_id"], name: "index_donations_on_donation_category_id"
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "candidate_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_educations_on_candidate_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "content"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_experiences_on_candidate_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "candidate_id"
    t.integer "position"
    t.string "file_name"
    t.string "file_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_images_on_candidate_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socials", force: :cascade do |t|
    t.string "fb"
    t.string "line"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_socials_on_candidate_id"
  end

  create_table "titles", force: :cascade do |t|
    t.string "content"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_titles_on_candidate_id"
  end

  create_table "videos", force: :cascade do |t|
    t.bigint "candidate_id"
    t.integer "position"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_videos_on_candidate_id"
  end

  add_foreign_key "candidate_locations", "candidates"
  add_foreign_key "candidate_locations", "locations"
  add_foreign_key "contacts", "candidates"
  add_foreign_key "donation_items", "donation_rewards"
  add_foreign_key "donation_items", "donations"
  add_foreign_key "donation_rewards", "donation_categories"
  add_foreign_key "donations", "donation_categories"
  add_foreign_key "educations", "candidates"
  add_foreign_key "experiences", "candidates"
  add_foreign_key "images", "candidates"
  add_foreign_key "socials", "candidates"
  add_foreign_key "titles", "candidates"
  add_foreign_key "videos", "candidates"
end
