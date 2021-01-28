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

ActiveRecord::Schema.define(version: 2021_01_28_134601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_assigns_on_group_id"
    t.index ["user_id"], name: "index_assigns_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "pet_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_comments_on_pet_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.time "start_time"
    t.float "weight"
    t.float "temperature"
    t.text "memo"
    t.bigint "wrap_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wrap_id"], name: "index_conditions_on_wrap_id"
  end

  create_table "excretions", force: :cascade do |t|
    t.time "start_time"
    t.string "shape"
    t.string "amount"
    t.string "smell"
    t.text "memo"
    t.bigint "wrap_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wrap_id"], name: "index_excretions_on_wrap_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.integer "owner_id"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "meals", force: :cascade do |t|
    t.time "start_time"
    t.string "shape"
    t.string "amount"
    t.text "memo"
    t.bigint "wrap_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wrap_id"], name: "index_meals_on_wrap_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.time "start_time"
    t.string "shape"
    t.text "memo"
    t.bigint "wrap_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wrap_id"], name: "index_medicines_on_wrap_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthday"
    t.integer "gender"
    t.string "species"
    t.text "memo"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_pets_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "icon"
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "walks", force: :cascade do |t|
    t.time "start_time"
    t.string "how_many"
    t.text "memo"
    t.bigint "wrap_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wrap_id"], name: "index_walks_on_wrap_id"
  end

  create_table "wraps", force: :cascade do |t|
    t.string "precaution_title"
    t.text "precaution_content"
    t.date "start_time", null: false
    t.bigint "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_wraps_on_pet_id"
    t.index ["start_time"], name: "index_wraps_on_start_time"
  end

  add_foreign_key "assigns", "groups"
  add_foreign_key "assigns", "users"
  add_foreign_key "boards", "users"
  add_foreign_key "comments", "pets"
  add_foreign_key "conditions", "wraps"
  add_foreign_key "excretions", "wraps"
  add_foreign_key "groups", "users", column: "owner_id"
  add_foreign_key "meals", "wraps"
  add_foreign_key "medicines", "wraps"
  add_foreign_key "pets", "groups"
  add_foreign_key "walks", "wraps"
  add_foreign_key "wraps", "pets"
end
