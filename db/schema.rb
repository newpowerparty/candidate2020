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

ActiveRecord::Schema.define(version: 2019_11_21_062451) do

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

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "school"
    t.text "info"
    t.text "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "mobile_phone"
    t.integer "total_amount"
    t.string "address"
    t.text "description"
    t.integer "receipt_type"
    t.integer "donate_type"
    t.boolean "confirmed"
    t.datetime "confirmed_at"
    t.boolean "anonymous", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_category_id"], name: "index_donations_on_donation_category_id"
  end

  add_foreign_key "donation_items", "donation_rewards"
  add_foreign_key "donation_items", "donations"
  add_foreign_key "donation_rewards", "donation_categories"
  add_foreign_key "donations", "donation_categories"
end
