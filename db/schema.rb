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

ActiveRecord::Schema.define(version: 20131113185136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_attempts", force: true do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.integer  "completion_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_exercises", force: true do |t|
    t.integer  "challenge_id"
    t.integer  "exercise_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenge_types", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "xp_multiplier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.integer  "reward"
    t.integer  "difficulty_id"
    t.integer  "challenge_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_exercises", force: true do |t|
    t.integer  "exercise_type_id"
    t.integer  "competition_id"
    t.integer  "limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.integer  "team_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_transactions", force: true do |t|
    t.integer  "competition_id"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competition_types", force: true do |t|
    t.string   "name"
    t.boolean  "use_date",   default: false
    t.boolean  "use_limit",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competitions", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "competition_type_id"
    t.integer  "max_participants"
    t.integer  "number_of_teams"
    t.integer  "lower_level_restriction"
    t.integer  "upper_level_restriction"
    t.integer  "difficulty_id"
    t.boolean  "team",                    default: false
    t.boolean  "public",                  default: true
    t.boolean  "active",                  default: true
    t.integer  "creator_id"
    t.integer  "winner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "difficulties", force: true do |t|
    t.string   "level"
    t.float    "xp_multiplier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_types", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "xp_multiplier"
    t.boolean  "use_reps",      default: false
    t.boolean  "use_distance",  default: false
    t.boolean  "use_duration",  default: false
    t.boolean  "use_weight",    default: false
    t.boolean  "use_calories",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.integer  "user_id"
    t.integer  "exercise_type_id"
    t.integer  "reps"
    t.float    "distance"
    t.integer  "duration"
    t.integer  "weight"
    t.integer  "calories"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "competition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "nickname"
    t.string   "gender"
    t.string   "address"
    t.string   "phone"
    t.float    "weight"
    t.float    "height"
    t.integer  "age"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.integer  "level",                  default: 1
    t.integer  "xp_level",               default: 1
    t.integer  "xp_multiplier",          default: 500
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "xp_transactions", force: true do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "xp_source_id"
    t.string   "xp_source_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "xp_transactions", ["xp_source_id", "xp_source_type"], name: "index_xp_transactions_on_xp_source_id_and_xp_source_type", using: :btree

end
